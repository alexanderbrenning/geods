library("mgcv")
library("randomForest")
library("e1071")
library("iml")
library("magrittr")
library("dplyr")
library("purrr")


###########################################################
### 1. Prepare simulated dataset
###########################################################

set.seed(123)

# Sample size:
N <- 200

# Simulate data points:
d <- data.frame(
  dem = runif(N, min = 2200, max = 2800),
  aspect = runif(N, min = 0, max = 360),
  slope = (pmax(0, runif(N, min = 15, max = 20) + rnorm(N, mean = 0, sd = 4))),
  log.carea = runif(N, min = 1, max = 2.5) + abs(rnorm(N, sd = 1.25))
)

# Simulate (ground) temperatures, from which permafrost presence/absence
# is derived by thresholding:
temperature_simulator <- function(x, add_noise = TRUE) {
  x$temp <- 
    # Elevation effect: apply lapse rate:
    (x$dem - 2500) * 0.0065 + 
    # North versus south exposure: solar radiation:
    (-1.2) * cos(x$aspect * pi / 180) * c(1,1,0.5)[2 + sign(cos(x$aspect * pi / 180))] +
    # Snow cover effect makes it less symmetric:
    (1) * pmax(0, cos((x$aspect + 25) * pi / 180))^3 +
    # This could also be related to snow cover duration:
    1 * pmin(4, x$log.carea)/4 +
    # ...and this one too, with longer lasting snow on north slopes
    # at gentle slope angles where avalanche snow may get deposited:
    0.5 * cos((x$slope - 5)*10 * pi / 180) * cos(x$aspect * pi / 180)
  if (add_noise)
    x$temp <- x$temp + rnorm(nrow(x), sd = 1) - 1
  # Permafrost is a thermal condition:
  x$class <- factor(x$temp < 0, levels = c("FALSE", "TRUE"))
  x
}

# Simulate (ground) temperature and permafrost presence/absence:
d <- temperature_simulator(d)
# It is almost perfectly balanced:
summary(d$class)

### Theoretical marginal relationship:
# ...derived using a Monte Carlo approach...
nd0 <- data.frame(
  aspect = c(0:360),
  dem = mean(d$dem),
  slope = mean(d$slope),
  log.carea = mean(d$log.carea)
)
nd0s <- nd0[rep(c(1:nrow(nd0)), each = 5000),]
nd0s <- temperature_simulator(nd0s)
nd0$prob <- tapply(nd0s$class, factor(nd0s$aspect), function(x) mean(x == "TRUE"))
# Do some smoothing:
for (i in 1:3) {
  nd0$prob <- (nd0$prob + c(nd0$prob[1], nd0$prob[-nrow(nd0)]) +
                 c(nd0$prob[-1], nd0$prob[nrow(nd0)])) / 3
}
nd0$logit <- log(nd0$prob / (1 - nd0$prob))
rm(nd0s)

# # Theoretical relationship between probability and aspect:
# plot(prob ~ aspect, data = nd0, type = "l")
# abline(v = c(0,90,180,270,360), col = "grey80")
# abline(h = c(-1,1), col = "grey80")


### Prepare predictor variables:
# Trim possible outliers:
d$slope[ d$slope > 50 ] <- 50
d$log.carea[ d$log.carea > 5 ] <- 5
# Cosine-sine encoding of aspect:
d$cos_aspect <- cos(d$aspect * pi / 180)
d$sin_aspect <- sin(d$aspect * pi / 180)
# Binning of aspect:
binned_aspect <- function(x) {
  cut((x + 22.5) %% 360, breaks = seq(0,360,by=45),
      labels = c("N","NE","E","SE","S","SW","W","NW"))
}
d$binned_aspect <- binned_aspect(d$aspect)


###########################################################
### 2. Fit the models using different encoding strategies
###########################################################

### Set up the smoothers:
# Penalized smoother:
bsp <- "ts" # could also use "cs"
# Cyclic smoother for aspect in one of the models:
bsc <- "cc"
# Optionally control the e.d.f. to avoid overfitting, not really used here:
k <- 10
# cosaspect and sinaspect should not double the e.d.f. of aspect:
k2 <- ceiling((k-1)/2) + 1

### Model formulas:
# 2 = cosine-sine encoding; 3 = binning
fo <- list(
  direct = class ~ aspect + dem + slope + log.carea,
  binning = class ~ binned_aspect + dem + slope + log.carea,
  cos_sin = class ~ cos_aspect + sin_aspect + dem + slope + log.carea
)
# For the GAMs - with smoothers:
sfo <- list(
  direct = class ~ s(aspect, bs = bsp, k = k) + s(dem, bs = bsp, k = k) + s(slope, bs = bsp, k = k) + s(log.carea, bs = bsp, k = k),
  binning = class ~ binned_aspect + s(dem, bs = bsp, k = k) + s(slope, bs = bsp, k = k) + s(log.carea, bs = bsp, k = k),
  cos_sin = class ~ s(cos_aspect, bs = bsp, k = k2) + s(sin_aspect, bs = bsp, k = k2) + s(dem, bs = bsp, k = k) + s(slope, bs = bsp, k = k) + s(log.carea, bs = bsp, k = k),
  cyclic = class ~ s(aspect, bs = bsc, k = k) + s(dem, bs = bsp, k = k) + s(slope, bs = bsp, k = k) + s(log.carea, bs = bsp, k = k)
)

learner <- function(formula, data, method, ranges, tunecontrol, 
                    verbose = TRUE, ...) {
  if (method == "randomForest") {
    if (any(names(ranges) == "mtry")) {
      max_mtry <- length(all.vars(formula)) - 1
      ranges$mtry <- ranges$mtry[ ranges$mtry <= max_mtry ]
    }
  }
  fit <- tune(method = method, train.x = formula, 
              data = data[,all.vars(formula)],
              ranges = ranges, tunecontrol = tunecontrol, ...)
  if (verbose) {
    cat("Optimal", method, "hyperparameters\n")
    print(fit$best.parameters)
  }
  fit$best.model
}



### Fit random forest (with default settings):

tc <- tune.control(sampling = "cross", cross = 5)
rf_ranges <- list(mtry = 1:999, nodesize = c(1,2,4,6,10,15,20,25))
svm_ranges <- list(gamma = 2^(-6:1), cost = 2^(-3:4))


fit <- list()
fit$glm <- fo %>% map(glm, data = d, family = binomial)
fit$gam <- sfo %>% map(gam, data = d, family = binomial)
fit$rf <- fo %>% map(learner, data = d, method = "randomForest",
                     ntree = 2000, ranges = rf_ranges, tunecontrol = tc)
fit$svm <- fo %>% map(learner, data = d, method = "svm",
                     probability = TRUE, ranges = svm_ranges, tunecontrol = tc)

# ### Plot GAMs, e.g.:
# par(mfrow=c(2,3))
# plot(fit$gam$cos_sin)



###########################################################
### 3. Estimate marginal effect of aspect on logit
###########################################################


predfun <- function(object, newdata, as_matrix = TRUE, 
                    terms = FALSE, ...) {
  newdata$aspect <- newdata$aspect %% 360
  newdata$cos_aspect <- cos(newdata$aspect * pi / 180)
  newdata$sin_aspect <- sin(newdata$aspect * pi / 180)
  newdata$binned_aspect <- binned_aspect(newdata$aspect)
  if (inherits(object, "randomForest")) {
    pred <- predict(object, newdata = newdata, type = "prob", ...)[,"TRUE"]
  } else if (inherits(object, "svm")) {
    pred <- predict(object, newdata = newdata, probability = TRUE, ...)
    pred <- attr(pred, "probabilities")[,"TRUE"]
  } else { # "glm", "gam"
    if (terms) {
      stopifnot(!as_matrix)
      pred <- predict(object, newdata = newdata, type = "terms", ...)
      # pick all aspect variables, add up their effects:
      sel <- grep("aspect", colnames(pred)) 
      if (length(sel) == 1) {
        pred <- pred[,sel]
      } else if (length(sel) > 1) {
        pred <- rowSums(pred[,sel])
      } else {
        stop("could not find an aspect variable among the terms")
      }
    } else {
      pred <- predict(object, newdata = newdata, type = "response", ...)
    }
  }
  # matrix format required by some functions in package iml:
  if (as_matrix) { 
    pred <- cbind(1 - pred, pred)
    colnames(pred) <- c("FALSE", "TRUE")
  }
  pred
}

marginal_effect <- function(fit, data, ...) {
  xvars <- all.vars(formula(fit))[-1]
  xvars <- xvars[ !grepl("aspect", xvars) ]
  xvars <- xvars[ xvars %in% colnames(data) ]
  aspects <- c(0:360)
  
  if (inherits(fit, "glm")) { # includes "gam", which inherits from "glm"
    nd <- as.data.frame(t(colMeans(data[,xvars])))
    nd <- nd[rep(1,length(aspects)),]
    nd$aspect <- aspects
    # logit-scale prediction of effect:
    pred <- predfun(fit, newdata = nd,
                    terms = TRUE, as_matrix = FALSE, ...)
  } else {
    # Generate new data from d with aspect = 0, ..., 360:
    nd <- data[rep(1:nrow(data), each = length(aspects)), xvars]
    nd$aspect <- rep(aspects, nrow(data))
  
    # Make model predictions:
    pred <- predfun(fit, newdata = nd, as_matrix = FALSE, ...)
  
    # Convert to logit:  
    pred <- log(pred / (1-pred))
    # Average over all observations with a given aspect value:
    pred <- tapply(pred, factor(nd$aspect), mean, na.rm = TRUE)
  }
  
  unname(pred)
}

# marginal_effect(fit$rf$direct, data = d)

### Gather results:
res <- list(
  aspect = c(0:360),
  Aspect = c(c(0:180), c(-179:0)),
  truth = nd0$logit
)

res$glm <- fit$glm %>% map(marginal_effect, data = d)
res$gam <- fit$gam %>% map(marginal_effect, data = d)
res$rf  <- fit$rf  %>% map(marginal_effect, data = d)
res$svm <- fit$svm %>% map(marginal_effect, data = d)

res <- as.data.frame(res)

res <- res[ c(181:361, 1:181), ]
res$Aspect[1] <- -180
res$Aspect[182] <- NA # create a breakpoint in plots



### Degrees of freedom used by smoothers:
edf <- list(
  direct = summary(fit$gam$direct)$s.table["s(aspect)", "edf"],
  cos_sin = summary(fit$gam$cos_sin)$s.table["s(cos_aspect)", "edf"] +
    summary(fit$gam$cos_sin)$s.table["s(sin_aspect)", "edf"],
  cyclic = summary(fit$gam$cyclic)$s.table["s(aspect)", "edf"]
)



###########################################################
### Use iml for ML model diagnostics:
### ALE plots and permutation variable importance
###########################################################

shift_aspect <- function(x) {
  if (is.data.frame(x)) {
    x$aspect <- shift_aspect(x$aspect)
  } else {
    x <- x %% 360
    sel <- x >= 180
    x[sel] <- x[sel] - 360
  }
  x
}

### Calculate ALE functions for aspect variable:
sd <- shift_aspect(d)
ale <- unlist(fit, recursive = FALSE) %>%
  map(Predictor$new, data = sd, predict.function = predfun, 
      y = "class", class = "TRUE") %>%
  map(FeatureEffect$new, feature = "aspect", grid.size = 100)
# plot(ale$gam.cos_sin)
# plot(ale$rf.cos_sin)
ale <- ale %>%
  map(function(x) x$results[,c("aspect",".value")]) %>%
  dplyr::bind_rows(.id = "setting") %>% as.data.frame()
ale$model <- gsub("\\..*$","", ale$setting)
ale$Encoding <- gsub("^.*\\.","", ale$setting)
ale$Encoding <- paste0(toupper(substring(ale$Encoding,1,1)), substring(ale$Encoding,2))
ale$Encoding[ale$Encoding == "Cos_sin"] <- "Cosine-sine"
ale$Aspect <- ale$aspect
ale$ALE <- ale$.value
ale$.value <- NULL

### Calculate permutation-based variable importances:
xvars <- all.vars(fo$direct)[-1]


feature_importance <- function(fit, data, xvars) {
  data <- data[,c("class", xvars)]
  pred <- Predictor$new(fit, data = data,
                        predict.function = predfun, y = "class")
  imp <- FeatureImp$new(pred, features = xvars, 
                        compare = "difference",
                        n.repetitions = 500, loss = "ce")
  imp
}
# feature_importance(fit$glm$direct, data = d, xvars = xvars)

# Using lapply because I couldn't get map to work with feature_importance...
imp <- list(
  glm = lapply(fit$glm, feature_importance, data = d, xvars = xvars),
  gam = lapply(fit$gam, feature_importance, data = d, xvars = xvars),
  svm = lapply(fit$svm, feature_importance, data = d, xvars = xvars)
)
# plot(imp$svm$cos_sin)
# plot(imp$gam$binning)

imp <- unlist(imp, recursive = FALSE)

process_feature_importance <- function(x) {
  xvars_ordered <- rev(c("dem","aspect","slope","log.carea"))
  x <- x$results
  rownames(x) <- x$feature
  x <- x[xvars_ordered,]
  x$feature <- factor(x$feature, levels = xvars_ordered)
  x
}
imp <- lapply(imp, process_feature_importance)



# Gather all results:
RES <- list(
  data = d,
  profiles = res,
  N = N,
  smoothers = list(
    bsp = bsp,
    bsc = bsc
  ),
  res = res,
  fit = fit,
  ale = ale,
  imp = imp,
  edf = edf
)



### Save results for re-use in Rmd file:

saveRDS(RES, file = "aspect-results.rds")
