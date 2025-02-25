---
title: "Designation of nitrate-polluted areas"
author: "Alexander Brenning"
authors: ["Alexander Brenning"]
date: '2024-04-17'
slug: nitrate
categories: ["geostatistics", "groundwater"]
tags: ["geostatistics", "interpolation", "kriging", "inverse-distance weighting", "nearest-neighbor interpolation", "conditional geostatistical simulation", "exceedance area", "nitrate", "groundwater", "pollution"]
subtitle: 'An expert report on regionalization methods, prepared for the German federal environmental agency'
summary: 'Summary of my expert report on regionalization methods for the designation of areas with nitrate-polluted groundwater, prepared for the German federal environmental agency...'
lastmod: "2024-04-17"
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

I recently had the honour to prepare an expert report for the German federal environmental agency concerning regionalization methods for designating regions with nitrate-polluted groundwater. Methods needs to acknowledge that this is about exceedance modeling, not just interpolation. Suitable geostatistical methods account for spatial heterogeneity and non-stationarity. Report in German (sorry), published in the Umweltbundesamt's publication series ([Brenning, 2024](https://www.umweltbundesamt.de/publikationen/evaluierung-weiterentwicklung-der)), English summary below, journal publication in preparation --- comments welcome!


## Summary of the expert report


As a basis for improved groundwater protection, the EU Nitrates Directive (91/676/EEC) in conjunction with the German Fertiliser Directive (Düngeverordnung) requires the designation of nitrate-polluted areas. Areas are designated in accordance with the General Administrative Regulation on the Designation of Nitrate-Polluted and Eutrophic Areas (AVV GeA) on the basis of measurements at currently around 13,500 groundwater monitoring wells. Depending on the density of measurements, deterministic methods (inverse distance weighting, IDW, and nearest neighbour interpolation, NNI) or geostatistical regionalisation methods are to be used for this purpose. The current state-level designation practice is to be replaced by a nationwide geostatistical regionalisation.

## Objectives

Against this background, this expert report pursues the following objectives:

1. to evaluate and assess the existing procedures for area designation with regards to their suitability for the delineation of nitrate input areas from a technical perspective.
2. to determine whether and, if so, how the existing procedures could be further developed in order to maximise the robustness and adequacy of the area designation under the given boundary conditions.
3. beyond the existing methods for area designation, it should be investigated to what extent new or alternative spatial statistical methods are more suitable. A recommendation will also be made on how to deal with the mandatory introduction of geostatistical methods by the end of 2028 and how this could be implemented.

### Problem analysis

The problem analysis in section 2 formalises the task of area designation as an exceedance region problem, which is in contrast to the conventional treatment as a regionalisation problem, and thus identifies a possible source of considerable bias. Analyses in a pilot region and Germany-wide analyses serve to illustrate this. In principle, regionalisation models and in particular regression kriging (kriging with external drift, KED) offer extensive design options for modelling spatial heterogeneity with the help of ancillary information available areawide. The quantitative evaluation criteria and qualitative requirements for data-driven models of nitrate pollution are then derived from the problem analysis. The deterministic methods of the AVV GeA (IDW, NNI) do not fulfil these criteria in comparison to KED, and SIMIK+ regression kriging has avoidable limitations and shortcomings. Conditional geostatistical simulation (CGS) is introduced as a method that can regionalise probabilities of exceeding the nitrate threshold and also allows the unbiased estimation of the total nitrate-polluted area. The characterisation of area designation as a diagnostic problem opens up the possibility of finding a trade-off between false-positive and false-negative designations. Furthermore, technical aspects such as the modelling of non-stationary trends and dependencies as well as non-normally distributed data are addressed and the potential of machine-learning models is discussed. Finally, the combination with the secondary designation criterion, referring to increasing trends in areas with nitrate levels above 37.5 mg/l, is outlined.


<div class="figure">
<img src="figures/pred_comparison.png" alt="Application of regionalization methods for the interpolation of nitrate concentrations in groundwater in a pilot region. NNI: nearest-neighbour interpolation; IDW: inverse-distance weighting; OK: Ordinary Kriging; KED: Kriging with external drift (regression-kriging); RF: Random forest." width="100%" />
<p class="caption"><span id="fig:unnamed-chunk-2"></span>Figure 1: Application of regionalization methods for the interpolation of nitrate concentrations in groundwater in a pilot region. NNI: nearest-neighbour interpolation; IDW: inverse-distance weighting; OK: Ordinary Kriging; KED: Kriging with external drift (regression-kriging); RF: Random forest.</p>
</div>


### Sources of ancillary information

Data bases available for specific areas are then examined with regard to their suitability as ancillary information or explanatory variables in the regionalisation of nitrate pollution (section 3). General geo-ecological spatial classifications can be distinguished from process-related environmental variables. A third group consists of derived process-related characteristics, such as the catchment mean values of explanatory variables (e.g. agricultural area in the upstream area). An exploratory analysis of the data indicates in particular the utility of soil-climate regions, hydrogeological macro-regions, geochemical rock types and the fraction of agricultural land in the catchment area. Using these variables within the hydrogeological regions (as interaction terms) substantially increases the explained variance. However, some of the ancillary information is only available at a coarse level of detail (scales of up to 1:1,000,000 and resolutions of up to 1 km × 1 km or municipality level), which results in uncertainties, particularly along zone boundaries. Against this background, the target scale of 1:25,000 required in the AVV GeA must be critically scrutinised.


### Requirements for regionalisation procedures

Building on the previous sections, general requirements for regionalisation procedures are formulated in section 4 of the report:

1. Regionalisation procedures must be able to spatially predict exceedance probabilities – and not merely expected nitrate concentrations. For this, distributional assumptions must be satisfied.
2. They must be able to include explanatory variables of different data types in order to account for spatial patterns and trends in a process-adequate and cause-appropriate manner.
3. Since heterogeneous (non-stationary) spatial dependencies have been identified, these must be adequately modelled.
4. Furthermore, the change of spatial support from point measurements to small areal units (raster cells) may need to be modelled, whereby the target scale or resolution should be critically scrutinised.

It should be noted that the determination of a suitable exceedance-probability decision threshold is required for balanced groundwater protection. The AVV GeA does not make any specific stipulations in this regard.


### Conclusions and recommendations

Based on these requirements, the following conclusions can be drawn with regard to the report’s objectives. Concerning Objective 1, it is established that of the methods considered in the AVV GeA, only the geostatistical methods fulfil the requirements. The use of IDW and NNI is not recommended, irrespective of the criteria formulated in the AVV GeA for the required density of the monitoring network, which are deemed unsuitable. The only geostatistical method used to date, SIMIK+, also has limitations and technical shortcomings; more general, well-established geostatistical methods (KED, CGS) exist, which is why further development of the other does not appear to be warranted (Objective 2).



<div class="figure">
<img src="figures/prob_BGS.png" alt="Application of conditional geostatistical simulation in combination with an external drift for modeling exceedance probabilities for a nitrate threshold of 50 mg/l in a pilot region." width="50%" />
<p class="caption"><span id="fig:unnamed-chunk-3"></span>Figure 2: Application of conditional geostatistical simulation in combination with an external drift for modeling exceedance probabilities for a nitrate threshold of 50 mg/l in a pilot region.</p>
</div>


Regarding Objective 3 of the report, a geostatistical regionalisation approach is proposed that uses established tools and can also be applied nationwide in the short term. This approach can be built around CGS or KED for the estimation of exceedance probabilities and total exceedance area. A linear or possibly non-linear spatial trend model is used to capture process-related patterns and spatial dependencies, whereby sub-models can be built within hydrogeological macro-regions in order to take regional heterogeneity into account. Separate modelling of nitrate pollution at the state level, on the other hand, is not recommended. Data transformations, feature extraction and data-driven model selection are additional necessary steps in model construction. The question of a possible change of support from point scale to raster cells at a suitable resolution must be clarified and can be implemented using block geostatistics. 

It is further recommended that the geostatistical models used should also be employed for optimal selection of additional monitoring sites in order to achieve the best possible benefit with the available resources.

Regarding the potential of machine learning methods, the use of which is currently not explicitly supported by the AVV GeA, it must be noted that there is currently no reliable evidence of an improved predictive performance, and the limited interpretability of black-box models moreover raises new questions concerning the traceability of decisions. Further research is recommended in order to assess longer-term potentials of these methods.

In conclusion, it can be stated that the designation of nitrate-polluted areas places special demands on regionalisation procedures, and their inappropriate use can result in a systematic under- or over-designation of these areas. The broad field of geostatistical regression--kriging methods offers an established methodological toolbox for process-adequate modelling and transparent decision-making.


## Source

Brenning, A. (2024). Evaluierung und Weiterentwicklung der Regionalisierungsverfahren zur Ausweisung nitratbelasteter Gebiete nach AVV GeA in Deutschland. TEXTE 67/2024, 54 pp. Umweltbundesamt, Dessau, Germany. Available online at <https://www.umweltbundesamt.de/publikationen/evaluierung-weiterentwicklung-der>
