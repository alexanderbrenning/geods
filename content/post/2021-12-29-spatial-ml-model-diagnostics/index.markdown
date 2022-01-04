---
title: "Spatial machine-learning model diagnostics"
author: Alexander Brenning
date: '2021-12-29'
slug: spatial-ml-model-diagnostics
categories: ["machine learning", "geostatistics"]
tags: ["interpretable machine learning", "spatial prediction", "interpolation", "permutation variable importance", "spatial cross-validation", "spatial autocorrelation", "kriging", "random forest", "spatial prediction error profile", "spatial variable importance profile"]
subtitle: 'A model-agnostic distance-based approach'
summary: 'How do the predictions of machine-learning and geostatistical models deteriorate with increasing distance to the training locations? Are different predictors instrumental in making predictions at greater versus shorter distances? A novel set of diagnostic tools allows us to answer these questions...'
lastmod: '2021-12-29'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
bibliography: spdiag.bib
csl: "../chicago-author-date.csl"
draft: true
---

When applying machine-learning models to geospatial analysis problems, we still rely on non-spatial diagnostic tools for model assessment and interpretation.

In model assessment, *spatial cross-validation* has been established as an estimation techniques that determines the transferability of a model to similar nearby areas.
Nevertheless, it does express how a model’s predictive performance deteriorates with prediction distance.
In model interpretation, permutation-based *variable importance* is an intuitive and widely used technique that estimates the contribution of individual predictors or groups of predictors to a model’s predictions (see, e.g., Molnar 2019).
However, it does not reveal if and how a variable is more relevant at shorter or longer distances.

My recent contribution to the *International Journal of Geographical Information Science* (Brenning 2021) proposes novel spatial diagnostic tools that address these issues:

{{% callout note %}}

**Spatial prediction error profiles (SPEPs)** reveal how model performance deteriorates as the distance to the measurement locations increases.

**Spatial variable importance profiles (SVIPs)** determine how strongly a predictor contributes to a model’s spatial prediction skill at varying prediction distances.

{{% /callout %}}

When using SPEPs and SVIPs to compare difference machine-learning and geostatistical models, they indicate which models are better at interpolating and extrapolating at different prediction horizons, and which predictors they are able to exploit.

### How it works

**TODO: create a visualization of spLOO with guard zone**

SPEPs aim to find out how well a model predicts at a given prediction distance.
To estimate this performance, we leave out one observation at a time from the training set.
We can enforce a particular prediction distance by removing from the training sample all data that falls within that distance around the left-out data point.
We train our model on the remaining data, and estimate its error on the left-out point.
This is repeated for each observation in our dataset, and the prediction distance is furthermore varied from 0 to some upper limit that depends on the size of the study area.
Aggregating these results gives us a distance-dependent curve, the spatial prediction error profile (SPEP).

Unlike the kriging variance, which is only available for this specific geostatistical method and requires certain assumptions to be satisfied, the SPEP technique is *model-agnostic*, which means that it can be applied to any model – statistical, geostatistical, or machine learning.

In general, permutation-based variable importance is based on measuring how much a model’s predictive performance deteriorates when a predictor variable is permuted, or “scrambled.”
We can do this also in the estimation of SPEPs, which will indicate how strongly the predictive performance at different prediction distances relies on a given predictor.
I refer to this as the spatial variable importance profile (SVIP).

SPEPs and SVIPs can be applied to interpolation, regression, and classification problems in the spatial domain.
Here we will have a brief look at a well-known dataset that is often used to introduce geostatistics, but in the paper I also demonstrate their application to a classical remotely-sensed land cover classification problem (Brenning 2021).

### Case study: the Meuse dataset

The Meuse dataset characterizes topsoil heavy-metal concentration on a floodplain in the Netherlands.
The logarithm of zinc concentration (*logZn*) can be modeled based on elevation (*elev*), the (square root of the) distance to the river (*sqrt.dist*), and the x and y coordinates; I will use regression methods such as random forest (RF) and multiple linear regression for this (MLR).

<div class="figure">

<img src="{{< blogdown/postref >}}index_files/figure-html/predictionmaps-1.png" alt="Spatial prediction maps of ordinary kriging (OK), kriging with external drift (KED), random forest (RF), and a hybrid OK--RF method." width="768" />
<p class="caption">
Figure 1: Spatial prediction maps of ordinary kriging (OK), kriging with external drift (KED), random forest (RF), and a hybrid OK–RF method.
</p>

</div>

Due to the strong autocorrelation at short distances, it is also possible to use interpolation methods such as ordinary kriging (OK) or nearest-neighbour (NN) interpolation, which I also include in my comparison.
Hybrid methods are therefore also appealing – here I use kriging with external drift (KED) and also a combined OK–RF technique that blends OK into RF as the prediction distance increases.

<div class="figure">

<img src="{{< blogdown/postref >}}index_files/figure-html/SPEPs-1.png" alt="Spatial prediction error profiles (SPEPs) of the geostatistical, machine-learning, and hybrid models." width="576" />
<p class="caption">
Figure 2: Spatial prediction error profiles (SPEPs) of the geostatistical, machine-learning, and hybrid models.
</p>

</div>

This is what we can learn from the SPEPs:

{{% callout note %}}

Surprisingly, even non-spatial models (RF, MLR) show an improvement in model performance as the prediction distance decreases.

KED is best able to exploit both spatial dependence (at very short distances) and predictor variables (for extrapolation), but differences to RF and MLR are small in this case study.

{{% /callout %}}

<div class="figure">

<img src="{{< blogdown/postref >}}index_files/figure-html/SVIPs-1.png" alt="Spatial variable importance profiles of the predictor variables for OK (grey), KED (black), MLR (blue), RF (dark green), and hybrid OK--RF (light green)." width="768" />
<p class="caption">
Figure 3: Spatial variable importance profiles of the predictor variables for OK (grey), KED (black), MLR (blue), RF (dark green), and hybrid OK–RF (light green).
</p>

</div>

The SVIP confirm the expected differences between interpolation, regression, and hybrid models:
Interpolation models only rely on x and y coordinate information, which becomes less useful at greater distances.
Regression models, in contrast, only rely on predictor variables, and their importance may decrease with distance (see RF, KED).
SVIPs detect the ability of the hybrid OK–RF model to exploit proximity information (i.e., coordinates) at short prediction distances, while ramping up the importance of predictor variables at greater distances.

{{% callout note %}}

Overall, SVIPs effectively reveal the inner workings of black-box models in spatial prediction.

{{% /callout %}}

## Conclusion

SPEPs and SVIPs are effectively able to visualize how model performance and variable importance vary with prediction distance.
They are therefore valuable additions to our diagnostic toolkit for spatial modeling.

### R Code

The R code for this analysis is available in a [Github repository](https://github.com/alexanderbrenning/spdiag).
It will be migrated into the `sperrorest` package (https://github.com/giscience-fsu/sperrorest), adding functions for computing and plotting spatial prediction error profiles (SPEPs) and spatial variable importance profiles (SVIPs).

### References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-brenning.2021.spdiag.preprint" class="csl-entry">

Brenning, A. 2021. “Spatial Machine-Learning Model Diagnostics: A Model-Agnostic Distance-Based Approach.” *arXiv*, 2111.08478.

</div>

<div id="ref-molnar.2019.iml.book" class="csl-entry">

Molnar, C. 2019. *Interpretable Machine Learning: A Guide for Making Black Box Models Explainable*.

</div>

</div>

<img src="https://vg09.met.vgwort.de/na/f0120719e7aa4011bde3d338f90a7c24" width="1" height="1" alt="">
