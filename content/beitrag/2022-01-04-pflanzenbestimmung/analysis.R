library("purrr")
set.seed(1234)

# Accuracies returned for each species:
res <- list(
  Caucasian_fir = c(43.64, 59.75, 34.42, 43.81, 33.69, 56.09, 65.31, 32.51, 22.55, 27.38, 21.50, 20.77, 34.47, 20.37, 45.71, 19.11, 32.89, 34.71, 12.03, 29.13, 59.32, 30.29, 70.41, 7.72, 62.92, 33.90, 21.25, 60.26, 15.03, 43.93, 35.25, 65.44, 35.86),
  Noble_fir = c(31.63, 24.18, 36.15, 62.74, 38.13, 52.02, 28.14, 25.39, 23.25, 21.89, 28.18, 51.85, 33.94, 23.00, 37.67, 24.92, 37.56),
  Hinoki_cypress = c(13.25, 25.69, 18.37, 53.07, 22.73, 42.21),
  Common_Asparagus_Fern = c(32.44),
  Red_fir = c(35.77),
  Pomegranate = c(40.28),
  Sacred_flower_of_the_Incas = c(41.97),
  Norfolk_Island_Pine = c(13.84),
  Flaky_juniper = c(17.17),
  Hoop_pine = c(27.53, 41.32),
  Japanese_holly = c(21.46),
  Pacific_silver_fir = c(56.42),
  Cook_pine = c(1.6, 25.65),
  Common_yew = c(24.40)
)

# Table with German and scientific species names and Wikipedia URLs:
species_list <- list(
  Caucasian_fir = c("Nordmann-Tanne", "Abies nordmanniana", "https://de.wikipedia.org/wiki/Nordmann-Tanne"),
  Noble_fir = c("Edel-Tanne", "Abies procera", "https://de.wikipedia.org/wiki/Edel-Tanne"),
  Hinoki_cypress = c("Hinoki-Scheinzypresse", "Chamaecyparis obtusa", "https://de.wikipedia.org/wiki/Hinoki-Scheinzypresse"),
  Common_Asparagus_Fern = c("Feder-Spargel", "Asparagus setaceus", "https://de.wikipedia.org/wiki/Feder-Spargel"),
  Red_fir = c("Pracht-Tanne", "Abies magnifica", "https://de.wikipedia.org/wiki/Pracht-Tanne"),
  Pomegranate = c("Granatalpfel", "Punica granatum", "https://de.wikipedia.org/wiki/Granatapfel"),
  Sacred_flower_of_the_Incas = c("Cantua", "Cantua buxifolia", "https://de.wikipedia.org/wiki/Cantua_buxifolia"),
  Norfolk_Island_Pine = c("Norfolk-Tanne", "Araucaria heterophylla", "https://de.wikipedia.org/wiki/Zimmertanne"),
  Flaky_juniper = c("Beschuppter Wacholder", "Juniperus squamata", "https://de.wikipedia.org/wiki/Beschuppter_Wacholder"),
  Hoop_pine = c("Neuguinea-Araukarie", "Araucaria cunninghamii", "https://de.wikipedia.org/wiki/Neuguinea-Araukarie"),
  Japanese_holly = c("Japanische Stechpalme", "Ilex crenata", "https://de.wikipedia.org/wiki/Stechpalmen"),
  Pacific_silver_fir = c("Purpur-Tanne", "Abies amabilis", "https://de.wikipedia.org/wiki/Purpur-Tanne"),
  Cook_pine = c("Araucaria columnaris", "Araucaria columnaris", "https://de.wikipedia.org/wiki/Araucaria_columnaris"),
  Common_yew = c("Gemeine Eibe", "Taxus baccata", "https://de.wikipedia.org/wiki/Europ%C3%A4ische_Eibe")
)
species <- species_list %>% unlist() %>% 
  matrix(ncol = 3, byrow = TRUE) %>% 
  as.data.frame()
colnames(species) <- c("german", "scientific", "url")
rownames(species) <- names(species_list)
species$english <- gsub("_", " ", names(species_list))

# Rename res list and species row names to German species names:
names(res) <- gsub(" ", "_", species[names(res), "german"])
rownames(species) <- gsub(" ", "_", species$german)


boxplot(res)

dat <- unlist(res)
dat <- data.frame(
  species = rep(names(res), sapply(res, length)),
  accuracy = unname(dat)
)

# Aggregated species variable for a less busy boxplot:
dat$reduced_species <- dat$species
sel_other <- !(dat$reduced_species %in% 
                 c("Nordmann-Tanne", "Edel-Tanne", "Hinoki-Scheinzypresse"))
dat$reduced_species[sel_other] <- "Andere Arten"
dat$reduced_species <- factor(dat$reduced_species,
                              levels = c("Nordmann-Tanne", "Edel-Tanne", 
                                         "Hinoki-Scheinzypresse", "Andere Arten"))

# Simulate a majority vote over k pictures using
# resampled classification results drawn without replacement
# from the observations:
MV <- function(x = 0, y = dat, k = 3, 
               weights = NULL, maxacc = FALSE) {
  if (maxacc & is.null(weights))
    stop("maxacc option requires weights argument to specify accuracy variable")
  
  prob <- NULL
  if (is.data.frame(y)) {
    if (!is.null(weights)) {
      weights <- y[,weights]
    }
    y <- y$species
  }
  sel <- sample(1:length(y), size = k, replace = FALSE)
  if (is.null(weights)) {
    tbl <- table(y[sel])
  } else {
    if (maxacc) {
      tbl <- tapply(weights[sel], y[sel], max)
    } else {
      tbl <- tapply(weights[sel], y[sel], sum)
    }
  }
  tbl <- tbl[ tbl == max(tbl) ]
  if (length(tbl) > 1)
    tbl <- tbl[ sample(1:length(tbl), size = 1) ]
  names(tbl)
}

# MV(k = 5)
# MV(k = 5, weights = "accuracy")

# # Repeat this e.g. 100 times:
# mean(sapply(1:100, MV, k = 10) == "Nordmann-Tanne")
# mean(sapply(1:100, MV, k = 5, weights = "accuracy") == "Nordmann-Tanne")

# Estimate the accuracy of predictions using an ensemble
# approach with majority vote or weightes majority vote:
MVacc <- function(x, n = 2000, truth = "Nordmann-Tanne", ...) {
  mean(sapply(1:n, MV, k = x, ...) == truth)
}

# Estimate mean accuracies for ensembles of size 1, ..., 15
# using ordinary and weightes majority voting schemes:
k <- seq(1,15,by=2)
acc <- sapply(k, MVacc)
acc_wgt <- sapply(k, MVacc, weights = "accuracy")
acc_max <- sapply(k, MVacc, weights = "accuracy", maxacc = TRUE)

species$count <- as.numeric(table(dat$species)[rownames(species)])
species$mean_acc <- tapply(dat$accuracy, factor(dat$species), mean)[rownames(species)]
species$max_acc <- tapply(dat$accuracy, factor(dat$species), max)[rownames(species)]

# Re-format table for use with kableExtra:
# <a href="Link-Ziel">Link-Text</a>
kbl <- data.frame(
  name = paste0('<a href="', species$url, '">', 
                species$german, " (<i>", species$scientific, "</i>)",
                "</a>"),
  # name = paste0("[", species$german, " (*", species$scientific, "*)](", species$url, ")"),
  count = species$count,
  mean_acc = round(species$mean_acc, 2),
  max_acc = species$max_acc
)
kbl <- kbl[order(kbl$count, decreasing = TRUE),]
# kableExtra::kbl(kbl, col.names = c("Art laut App", "Häufigkeit",
#                                    "Mittlere <i>accuracy</i>", "Maximale <i>accuracy</i>"))

# Save results for re-use by Markdown file:
save(res, species, dat, k, acc, acc_wgt, acc_max, kbl, 
     file = "plant-id.rda")


mean(dat$species == "Nordmann-Tanne")

kableExtra::kbl(kbl, col.names = c("Art laut App", "Häufigkeit",
                                   "Mittlere *accuracy*", "Maximale *accuracy*"))

boxplot(accuracy ~ reduced_species, data = dat,
        xlab = "Art laut App", ylab = "Accuracy laut App",
        col = c("lightgreen", rep("pink",3)))


plot(k, acc*100, type = "l", ylim = c(40, 100), lwd = 2,
     xaxt = "n", xlab = "Anzahl Fotos", ylab = "Häufigkeit korrekter Klassifikation [%]",
     main = "Ensemble-Klassifikation mit mehreren Fotos")
axis(1, at = k, labels = as.character(k))
points(k, acc*100, pch = 19)
lines(k, acc_wgt*100, col = "blue", lwd = 2)
points(k, acc_wgt*100, pch = 19, col = "blue")
lines(k, acc_max*100, col = "red", lwd = 2)
points(k, acc_max*100, pch = 19, col = "red")
abline(h = seq(40,100,by=10), col = "grey80")
text(6, 76, "Gewichteter", col = "blue", pos = 2)
text(7, 72, "Ungewichteter", pos = 4, srt = 20)
text(5.5, 60, "Maximalselektierter\nMehrheitsentscheid", pos = 4, col = "red")
