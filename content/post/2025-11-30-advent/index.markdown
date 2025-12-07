---
title: "My GIScience Advent Calendar"
author: "Alexander Brenning"
authors: ["Alexander Brenning"]
date: '2025-11-30'
slug: advent
categories: ["GIS"]
tags: ["GIS"]
subtitle: 'Updated on a daily basis'
summary: 'Day by day, 24 concepts from geographic information science that every geographer should know...'
lastmod: "2025-12-07"
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---
<link href="{{< blogdown/postref >}}index_files/panelset/panelset.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/panelset/panelset.js"></script>








## December 7: Catchment Areas

<img src="figures/catchment.png" width="50%" />

A **<span style="color:blue">catchment area</span>** describes the region from which a location “draws its influence” – in GIScience, often the result of a **<span style="color:blue">network analysis</span>**.

<div class="figure">
<img src="figures/catchment_firestations.jpg" alt="Arrival times of fire brigades in the city of Jena. (c) City of Jena / antwortING / otz." width="50%" />
<p class="caption"><span id="fig:unnamed-chunk-3"></span>Figure 1: Arrival times of fire brigades in the city of Jena. (c) City of Jena / antwortING / otz.</p>
</div>

It can be used to calculate which street segments belong to a fire station 🚒 or from which regions the members of [FC Carl Zeiss Jena](https://www.fc-carlzeiss-jena.de/) come ⚽ — or, in the words of the fans: “Hier regiert der FCC!” (“The FCC rules here!”). 🌍

Unfortunately, [the 10-minute catchment of Jena’s fire brigades doesn’t cover the entire city area](https://www.otz.de/lokales/jena/article410477795/gutachter-alarm-die-feuerwehr-kommt-nicht-schnell-genug-in-jena.html) — and today [the opponent’s goal was within the FCC attackers’ catchment only once](https://www.mdr.de/sport/fussball_rl/spielbericht-regionalliga-nordost-mdr-sport-im-osten-fcc-fc-carl-zeiss-jena-sv-babelsberg-svb-100.html)...

<div class="figure">
<img src="figures/catchment_fcc.jpg" alt="The catchment area of FC Carl Zeiss Jena based on the spatial distribution of its members. (c) Thüringer Allgemeine." width="50%" />
<p class="caption"><span id="fig:unnamed-chunk-4"></span>Figure 2: The catchment area of FC Carl Zeiss Jena based on the spatial distribution of its members. (c) Thüringer Allgemeine.</p>
</div>

<div class="figure">
<img src="figures/fcc.png" alt="The “Südkurve” (South Stand) at the Ernst Abbe Stadium. Their catchment area? Wherever FC Carl Zeiss Jena is playing!" width="50%" />
<p class="caption"><span id="fig:unnamed-chunk-5"></span>Figure 3: The “Südkurve” (South Stand) at the Ernst Abbe Stadium. Their catchment area? Wherever FC Carl Zeiss Jena is playing!</p>
</div>



## December 6: Drones (UAV – Unmanned Aerial Vehicles)

🚁 Drones capture geospatial data from above – usually with cameras, LiDAR, or multispectral sensors 🎨.

<img src="figures/drone2.png" width="50%" />

They produce high-resolution orthophotos and 3D models for environmental monitoring 🌿, land-use mapping 🏙️, and disaster assessment 🌋.

Their advantages: flexible operation and centimeter-level accuracy.
Their downsides: limited flight time and strict legal regulations ⚖️.

And honestly – one of the coolest things you can do with drones is observing adorable little penguins 🐧.
Here are some images [from a recent publication](https://doi.org/10.1016/j.ecolind.2024.113011) by <span style="color:blue">Christian Pfeifer</span> ([ThINK GmbH](https://www.think-jena.de/); funded by the [German Environment Agency](https://www.umweltbundesamt.de/)), a PhD student in my group, who’s currently out on another Antarctic expedition ❄️🚀

<div class="figure">
<img src="figures/Pfeifer2025penguins.jpeg" alt="Drone imagery of Adélie and Gentoo penguin colonies on Ardley Island, Antarctica. Pfeifer et al. (2025) in Ecological Indicators." width="100%" />
<p class="caption"><span id="fig:unnamed-chunk-7"></span>Figure 4: Drone imagery of Adélie and Gentoo penguin colonies on Ardley Island, Antarctica. Pfeifer et al. (2025) in Ecological Indicators.</p>
</div>


---

## Dec. 5: Interpolation

🌈 **<span style="color:blue">Interpolation</span>** estimates values at locations where no direct measurements exist.

<img src="figures/Robo-Ausweisung.png" width="50%" />

📍 From data measured at monitoring sites, a continuous field is computed – for example, air temperature or pollutant concentration.
Methods such as inverse distance weighting or geostatistical **<span style="color:blue">kriging</span>** use spatial neighborhood relationships to create smooth surfaces.
The result: maps that close gaps in our knowledge. 🌍

<img src="figures/regression_kriging.png" width="50%" />

✨ In the [GIScience group](https://www.chemgeo.uni-jena.de/en/30778/giscience-group), we currently apply advanced kriging approaches to estimate **<span style="color:blue">nitrate concentrations</span>** in groundwater across Germany.
[Our method](https://geods.netlify.app/post/nitrate/) also incorporates auxiliary data — such as hydrogeology and land cover — to statistically evaluate evidence for or against nitrate contamination.
This is essential for evidence-based environmental decision making!

<div class="figure">
<img src="figures/tgrk.png" alt="Geostatistical interpolation of exceedance probabilities for a nitrate threshold of 50 mg/l in an undisclosed pilot area." width="70%" />
<p class="caption"><span id="fig:unnamed-chunk-10"></span>Figure 5: Geostatistical interpolation of exceedance probabilities for a nitrate threshold of 50 mg/l in an undisclosed pilot area.</p>
</div>


---

## Dec. 4: Raster and Vector Data

🌍 Geodata are usually stored as **raster or vector data**. These two data models form the fundamental building blocks of GIS databases. ✨

<img src="figures/raster_vector.png" width="50%" />

**<span style="color:blue">Raster</span>** consist of regularly arranged cells that store a value for each location – ideal for continuous phenomena such as air temperature 🌡️.

**<span style="color:blue">Vector data</span>** represent objects through points, lines, or polygons – perfect for roads, rivers, or parcels.

Thuringia runs a fantastic **<span style="color:blue">Open Geodata</span>** initiative. I took a closer look using an R script: out of more than 1,600 open datasets, **82% are vector datasets**! Many are small municipal datasets such as zoning plans, while others, like erosion susceptibility, cover the entire state 🌳.

Here, for example, are the erosion-prone areas near Jena in the [map viewer](https://thueringenviewer.thueringen.de/), shown as polygon vector data ((c) GDI-Th):

<img src="figures/erosion_jena.png" width="70%" />

---

## Dec. 3: Positioning with GPS/GNSS

<img src="figures/gps2.png" width="50%" />

The **<span style="color:blue">Global Positioning System (GPS)</span>** is part of the family of Global Navigation Satellite Systems (GNSS).
Such systems determine positions by measuring signals from multiple satellites and deriving distances from them.

📍 The result: precise coordinates — usually accurate to within a few meters. Your phone therefore knows your location quite well.

<img src="figures/gps_jena.jpg" width="50%" />

✨ In our [B.Sc. Geography](https://www.chemgeo.uni-jena.de/210/geographie) program, students are introduced to mobile data acquisition (*mobile mapping*) using GNSS tablets.

🧭 In research, by contrast, we employ high-precision GNSS surveying instruments — for example in Chile, where we determine movement rates of rock glaciers.

<img src="figures/gps_rgl.jpg" width="50%" />

<div class="figure">
<img src="figures/gps_rgl_creep.jpg" alt="Movement rates of a rock glacier in the Chilean Andes. (c) X. Bodin." width="70%" />
<p class="caption"><span id="fig:unnamed-chunk-16"></span>Figure 6: Movement rates of a rock glacier in the Chilean Andes. (c) X. Bodin.</p>
</div>

👉 By the way, GPS is the U.S. GNSS — did you know that the European Union operates its own system, [Galileo](https://en.wikipedia.org/wiki/Galileo_(satellite_navigation))?

---


## Dec. 2: Geocoding

<img src="figures/geocoding.png" width="50%" />

📍 **<span style="color:blue">Address Geocoding</span>** converts textual addresses into geographic coordinates.

It relies on reference databases that associate addresses with spatial locations.

🌍 Thus, *“Leutragraben 1, Jena”* becomes a point with latitude and longitude that can be mapped or further analyzed. In this case, the coordinate leads you directly to the [Jentower](https://en.wikipedia.org/wiki/JenTower) in the center of Jena, where my office is located.

Other place references can likewise be transformed into coordinates — for example, computer IP addresses, named locations such as *“Napoleonstein”*, or even unstructured text. Here's the example of geocoded [police reports](https://geods.netlify.app/beitrag/polizeiberichte/).

<div class="figure">
<img src="figures/geocoding_jena.png" alt="Geocoded police reports in Jena." width="50%" />
<p class="caption"><span id="fig:unnamed-chunk-18"></span>Figure 7: Geocoded police reports in Jena.</p>
</div>

By the way, a colleague here in Jena, [Dr. Xuke Hu](https://scholar.google.com/citations?hl=en&user=xCj17L0AAAAJ&view_op=list_works&sortby=pubdate) at the [DLR Institute of Data Science](https://www.dlr.de/en/dw/about-us/departments/dmo?page=3), is a leading expert in geoparsing, or geocoding of unstructured texts.

---

## Dec. 1: Geographic Information Science

<img src="figures/giscience.png" width="50%" />

**<span style="color:blue">Geographic Information Science (GIScience)</span>** is the science of acquiring, managing, analyzing, and visualizing geospatial data.

It combines computer science, geography, and statistics to make location-based phenomena measurable and modelable, and to solve geographical problems in research and applied contexts.

From traffic patterns to species distribution and climate change – wherever place matters, GIScience is there. 🌍


<img src="http://vg09.met.vgwort.de/na/93198bf7237842bd8d5ac9f172a26812" width="1" height="1" alt="">
