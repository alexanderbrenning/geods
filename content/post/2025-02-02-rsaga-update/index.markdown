---
title: "Announcing the New RSAGA Release"
author: "Alexander Brenning"
authors: ["Alexander Brenning"]
date: '2025-02-03'
slug: rsaga-update
categories: ["R", "GIS", "geocomputing"]
tags: ["R package", "SAGA", "GIS", "terrain analysis", "geomorphometry", "geocomputation", "open-source software"]
subtitle: 'Now Compatible with SAGA GIS 9.7.2'
summary: 'A new version of RSAGA is available, the R package that provides an interface to SAGA GIS for geospatial analysis, digital terrain analysis, and geocomputing...'
lastmod: "2025-02-09"
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
draft: false
---
<link href="{{< blogdown/postref >}}index_files/panelset/panelset.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/panelset/panelset.js"></script>








## TL;DR

I am pleased to announce the release of a new version of **[RSAGA](https://CRAN.R-project.org/package=RSAGA)**, the R package that provides a seamless interface from [R](https://www.r-project.org/) to **[SAGA GIS](https://saga-gis.sourceforge.io/en/index.html)** for geospatial analysis, digital terrain analysis, and geocomputing. This update ensures compatibility with the latest versions of **SAGA GIS**, now supporting up to **SAGA 9.7.2**, and continues to offer an efficient workflow for integrating SAGA’s powerful geoprocessing tools within R.



## A Widely Used Tool in Geographic Data Science

Since its initial release in 2008, **RSAGA** has become a widely adopted tool among researchers and practitioners working with geospatial data. According to [DataScienceMeta](https://www.datasciencemeta.com/rpackages?utm_source=chatgpt.com), RSAGA is among the **top 10% most downloaded R packages**, with over **245,000 downloads**. These numbers reflect the **importance of SAGA GIS** for a broad range of applications in geographic data science, environmental modeling, and digital terrain analysis, creating a demand for an integration with the leading statistical programming environment, **R**.

**RSAGA** has recently reached **100 citations** in Google Scholar as researchers in diverse fields have leveraged its capabilities, including:

- **Hydrology & Water Resources**: Used for watershed delineation, stream network extraction, and hydrological modeling.
- **Geomorphology & Terrain Analysis**: Applied in studies focusing on landform classification, slope stability, and geomorphic distribution modeling.
- **Environmental Science & Ecology**: Used in habitat modeling, land cover classification, and environmental risk assessment.
- **Soil Science & Agriculture**: Supports research in soil property mapping, digital soil mapping, and precision agriculture.

For those interested in a practical example of RSAGA in action, the **[RSAGA vignette](https://cran.r-project.org/web/packages/RSAGA/vignettes/RSAGA.html)** features a case study on **landslide susceptibility mapping**, demonstrating how the package can be used in nonlinear statistical modeling of Earth surface processes.

## Citing RSAGA

As RSAGA continues to support geospatial research and applications, I would like to **remind users to properly cite R packages** in their academic work. Citing software tools and R packages not only acknowledges the contributions of developers but also enhances the transparency and reproducibility of scientific research.  

If you use **RSAGA** in your work, please cite it as follows:  

Brenning, A., Bangs, D., Becker, M., Schratz, P., & Polakowski, F. (2025). *RSAGA: SAGA Geoprocessing and Terrain Analysis*. R package version 1.4.2. Retrieved from https://CRAN.R-project.org/package=RSAGA  

You can also retrieve the most up-to-date citation by running the following command in R:  

```r
citation("RSAGA")
```

## Acknowledgments

Many thanks to the **SAGA GIS developers**, the **CRAN team** and the **R community** for their tremendous work!

Happy mapping and modeling!


## References

Brenning, A., Bangs, D., Becker, M., Schratz, P., & Polakowski, F. (2025). *RSAGA: SAGA Geoprocessing and Terrain Analysis*. R package version 1.4.2. Retrieved from https://CRAN.R-project.org/package=RSAGA  


<img src="https://vg09.met.vgwort.de/na/aa0f5334bb0a445fa3e7b20ef60634a9" width="1" height="1" alt="">

