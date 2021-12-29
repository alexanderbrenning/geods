
library("ggplot2")
library("patchwork")
library("purrr")


RES <- readRDS("aspect-results.rds")
res <- RES$res # for convenience

sel <- which(is.na(res$Aspect))
res$Aspect[sel] <- 0
res[ sel - 1, ] <- NA

par(mfrow = c(1,2))
par(cex = 0.7, cex.main = 1.2)
ylim <- c(min(c(res$glm.direct,res$gam.cyclic,res$svm.cos_sin), na.rm = TRUE),
          max(c(res$glm.direct,res$gam.cyclic,res$svm.cos_sin), na.rm = TRUE))
ylim <- ylim * c(1.1, 1.35)
xat <- seq(-180, 180, by = 45)
xlim <- c(-180, 180)
xlabels <- as.character(xat %% 360)
xlabels[xlabels == "0"] <- "0 = 360"
plot(res$Aspect, res$gam.direct, type = "l", col = "red", lwd = 2, 
     xlim = xlim, ylim = ylim,
     xlab = "aspect [°]", ylab = "marginal effect on logit",
     main = "Generalized additive model",
     xaxs = "i", yaxs = "i", xaxt = "n")
axis(1, at = xat, labels = xlabels)
lines(res$Aspect, res$gam.binning, col = "darkgreen", lwd = 2)
lines(res$Aspect, res$gam.cyclic, col = "black", lwd = 2)
lines(res$Aspect, res$gam.cos_sin, col = "blue", lwd = 2)
lines(res$Aspect, res$truth, col = "grey50")
abline(v = 0, col = "grey80")
legend(x = -180, y = ylim[2], 
       lwd = c(1,2,2,2,2), 
       col = c("grey50", "red", "darkgreen", "blue", "black"), 
       bty = "n",
       legend = c("truth", "direct encoding", "binning", "cosine-sine encoding", "cyclic smoother"))

plot(res$Aspect, res$glm.direct, type = "l", col = "red", lwd = 2, 
     xlim = xlim, ylim = ylim,
     xlab = "aspect [°]", ylab = "marginal effect on logit",
     main = "Logistic regression",
     xaxs = "i", yaxs = "i", xaxt = "n")
axis(1, at = xat, labels = xlabels)
lines(res$Aspect, res$glm.binning, col = "darkgreen", lwd = 2)
lines(res$Aspect, res$glm.cos_sin, col = "blue", lwd = 2)
lines(res$Aspect, res$truth, col = "grey50")
abline(v = 0, col = "grey80")



EDF <- data.frame(
  Model = c(rep("GLM", 3), rep("GAM", 4)),
  Strategy = c(
    rep(c("Direct encoding", "Binning", 
          "Cosine-sine encoding"), 2), 
    "Cyclic smoother"),
  "Degrees of freedom" = c("1","7","2",
                           exams::fmt(RES$edf$direct), 7,
                           exams::fmt(RES$edf$cos_sin),
                           exams::fmt(RES$edf$cyclic))
)

cnms <- c("Model", "Strategy", "Degrees of freedom")

EDF %>% kableExtra::kbl(align = "llr", col.names = cnms) %>% 
  kableExtra::kable_styling(full_width = FALSE)





par(mfrow = c(1,2))
par(cex = 0.7, cex.main = 1.2)
plot(res$Aspect, res$svm.direct, type = "l", col = "red", lwd = 2, 
     xlim = xlim, ylim = ylim,
     xlab = "aspect [°]", ylab = "marginal effect on logit",
     main = "Support vector machine",
     xaxs = "i", yaxs = "i", xaxt = "n")
axis(1, at = xat, labels = xlabels)
lines(res$Aspect, res$svm.binning, col = "darkgreen", lwd = 2)
lines(res$Aspect, res$svm.cos_sin, col = "blue", lwd = 2)
lines(res$Aspect, res$truth, col = "grey50")
abline(v = 0, col = "grey80")
legend(x = -180, y = ylim[2], 
       lwd = c(1,2,2,2), 
       col = c("grey50", "red", "darkgreen", "blue"), 
       bty = "n",
       legend = c("truth", "direct encoding", "binning", "cosine-sine encoding"))

plot(res$Aspect, res$rf.direct, type = "l", col = "red", lwd = 2, 
     xlim = xlim, ylim = ylim,
     xlab = "aspect [°]", ylab = "marginal effect on logit",
     main = "Random forest",
     xaxs = "i", yaxs = "i", xaxt = "n")
axis(1, at = xat, labels = xlabels)
lines(res$Aspect, res$rf.binning, col = "darkgreen", lwd = 2)
lines(res$Aspect, res$rf.cos_sin, col = "blue", lwd = 2)
lines(res$Aspect, res$truth, col = "grey50")
abline(v = 0, col = "grey80")



# Combined ALE plot and permutation-based variable importances:
theme_set(theme_grey(base_size = 10))
cols <- c(
  Direct = "red",
  Binning = "darkgreen",
  "Cosine-sine" = "blue"
)
ale <- ggplot(RES$ale[RES$ale$model == "svm",], 
              aes(x = Aspect, y = ALE, group = Encoding, colour = Encoding)) + 
  scale_color_manual(values = cols) +
  geom_line(size = 1) +
  ggtitle("ALE plots of slope aspect in SVM models with different encodings")
imp_direct <- ggplot(RES$imp$svm.direct, aes(y = feature, x = importance)) +
  geom_col(fill = "red") + ggtitle("Direct encoding")
imp_binning <- ggplot(RES$imp$svm.binning, aes(y = feature, x = importance)) +
  geom_col(fill = "darkgreen") + ggtitle("Binning")
imp_cos_sin <- ggplot(RES$imp$svm.cos_sin, aes(y = feature, x = importance)) +
  geom_col(fill = "blue") + ggtitle("Cosine-sine encoding")
ale / (imp_direct | imp_binning | imp_cos_sin)

