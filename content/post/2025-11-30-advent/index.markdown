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
lastmod: "2025-12-23"
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---
<link href="{{< blogdown/postref >}}index_files/panelset/panelset.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/panelset/panelset.js"></script>







<!---


## 🎄 December 24: What Does GIScience Give Us?

<img src="figures/globe.png" width="50%" />

🎁🌍 **What does geographic information science actually give us — beyond maps?**

It gives us **orientation** 🧭

* → in cities, landscapes, data, and decisions.

It gives us **understanding** 🧠

* → of spatial patterns, relationships, and uncertainties.

It gives us **tools** 🛠️

* to analyze environmental problems 🌱,
* to better plan cities and environments 🏙️,
* and to assess risks 🌊🔥.

And perhaps most importantly:

{{% callout note %}}

GIScience gives us the ability to **use complex spatial information collectively, transparently, and responsibly** 🤝.

{{% /callout %}}

👉 In a world full of data, that is a true gift.

**Merry Christmas 🎄
and thank you for following this Geoinformatics Advent Calendar.**


---


-->

## December 23: Multi-Criteria Site Selection

📍🧩 **Where is a “suitable” location?**
In GIScience, this question is addressed using <span style="color:blue">multi-criteria site suitability analyses</span>.

Here, multiple spatial criteria are combined — e.g.:

* accessibility 🚗
* population density 👥
* environmental constraints 🌱
* distance to settlements 🏘️

Technically, this is implemented through <span style="color:blue">overlay analyses</span>:
raster or vector layers are overlaid and, if necessary, weighted to derive a <span style="color:blue">suitability map</span> 📊🗺️.

<img src="figures/overlay.png" width="50%" />

Such methods are used, for example, in

* selecting locations for new business sites 🛒,
* infrastructure planning 🏗️,
* or highly sensitive decisions such as identifying a repository site for radioactive waste ☢️.

👉 Important:
The result is not “the truth,” but a **transparent and traceable decision basis** —
dependent on the choice of criteria, their weighting, and societal priorities.


---

## December 22: Aggregation & Disaggregation

<img src="figures/disaggr.png" width="50%" />

📦📊 **<span style="color:blue">Aggregation</span>** combines spatial data into larger units —
for example income 💶 or health data 👥 at the level of municipalities or neighborhoods.

🔍📍 One application is <span style="color:blue">geomarketing</span>: here, readily available aggregated demographic and socioeconomic data are often **<span style="color:blue">disaggregated</span>**
to estimate purchasing power 💳, demand 🛒, or preferences 🎯 at the street or block level.

The key point is:
➡️ fine-scale patterns are not measured directly, but derived using <span style="color:blue">spatial statistical models</span>,
for example incorporating land use 🏘️, building data 🧱, or population density 📈.

⚠️ Important:
Disaggregated results are *estimates*, not observations —
and they are sensitive to assumptions, scale 📐, and zoning 🗺️.

---


## December 21: Volunteered Geographic Information (VGI)

<img src="figures/vgi.png" width="50%" />

🌍🤝 **<span style="color:blue">Volunteered Geographic Information (VGI)</span>** refers to geospatial data that are <span style="color:blue">voluntarily created and shared by users</span>.
People map their environment themselves — using smartphones, GPS, or local knowledge.

The most prominent example is [OpenStreetMap](https://www.openstreetmap.org/):
thousands of volunteers worldwide map streets, buildings, bike lanes, or points of interest — often more up to date than official datasets 🚲🏘️.

VGI is closely related to <span style="color:blue">crowdsourcing</span>, but conceptually goes a step further:
data collection is not controlled by institutions, but by civil society itself.

👉 Opportunities: high timeliness, global coverage, democratic data creation.

⚠️ Challenges: data quality, spatial biases, and social inequalities.

In short:
**VGI shows that geospatial data are not only measured — they are also created collaboratively.**

---

## December 20: Spatial Autocorrelation

📍🔗 **<span style="color:blue">Spatial autocorrelation</span>** describes a core principle of GIScience:
values observed at locations close to each other are often more similar than values observed far apart.

<img src="figures/autocorr2.png" width="50%" />

Why is this so important?
Without spatial autocorrelation, <span style="color:blue">interpolating point measurements into continuous surfaces</span> would not be possible.
Only because neighboring observations are related can we derive continuous maps from a limited number of measurement points 📊🗺️.

This is essential for <span style="color:blue">spatially assessing environmental pollution</span> — for example **<span style="color:blue">nitrate in groundwater</span>** 💧.
In the [ReGeNi project](https://www.umweltbundesamt.de/sites/default/files/medien/2875/dokumente/20241121_projektsteckbrief_regeni.pdf), funded by the [German Environment Agency](https://www.umweltbundesamt.de/), we apply exactly this principle to derive spatially consistent maps of nitrate contamination from point measurements and to make uncertainties transparent. See also [my blog post related to this topic](https://geods.netlify.app/post/nitrate/).

👉 In short:
**Spatial autocorrelation is the statistical foundation that allows maps to be more than just colorful patterns.**

<img src="figures/nitrate.png" width="50%" />


---

## December 19: Digital Twin

<img src="figures/digitaltwin.png" width="50%" />


🏙️🧠 **<span style="color:blue">Digital twins</span>** are virtual representations of real-world systems.
They integrate <span style="color:blue">geospatial data, sensor data, models, and simulations</span> to realistically represent processes in cities or the environment — and to explore “what-if” scenarios.

A digital twin is more than a 3D city model:
it can simulate traffic flows 🚗, estimate heat development 🌡️,
predict flooding 🌊, or test the effects of planning measures — *before* they are implemented.

Especially in the context of <span style="color:blue">smart cities</span> and <span style="color:blue">environmental forecasting</span>, digital twins are becoming increasingly important.


---


## December 18: Geospatial Data Infrastructure (GDI) – The Backbone of Geoinformatics

<img src="figures/gdi.png" width="50%" />

A **<span style="color:blue">Geospatial Data Infrastructure (GDI)</span>** is not a single system, but an organized interplay of
geospatial data, metadata, standards, services, and institutions.

**Its goal:** geospatial data and web services should be <span style="color:blue">findable, accessible, interoperable, and usable</span> — across organizational boundaries.

At the European level, this is regulated by the **<span style="color:blue">INSPIRE Directive</span>**.
It obliges public authorities to provide their geospatial data in standardized ways — for example on topics such as the environment, transport, land use, or administrative units.

Thanks to GDI and INSPIRE, data from municipalities, federal states, national authorities, and the EU can be integrated —
for instance for environmental reporting 🌱, spatial planning 🏗️, or crisis management 🚨. Here is an example from the [Thuringian Geoportal](https://geoportal.thueringen.de/).

👉 Without geospatial data infrastructures, there would be many maps —
but **no functional and reliable geospatial data landscape**.


---

## December 17: Participatory GIS

<img src="figures/pgis.png" width="50%" />

🚲🗺 An early example of **<span style="color:blue">Participatory GIS</span>** in Jena is the <span style="color:blue">Radforum Jena</span>.

<img src="figures/radforum_jena.png" width="50%" />

🤝 As early as 2022, citizens were able to pinpoint problems, hazardous locations, and ideas for cycling infrastructure directly on maps — from missing bike lanes to critical intersections.
Local, everyday knowledge was thus transformed into usable geospatial data.

This is exactly the core idea of Participatory GIS (PGIS):
GIScience is used to systematically integrate citizens’ knowledge into maps, analyses, and planning processes — digitally and transparently.

Today, this approach is a key component of **<span style="color:blue">Jena’s Smart City strategy</span>** 🌍💡.
Through participatory maps and online engagement formats, citizens can actively contribute to urban development — for example in mobility 🚲, urban green spaces 🌳, accessibility ♿, or neighborhood planning 🏘️.

👉 Maps are not just analytical tools — they are spaces for dialogue between urban society and decision-makers.

<img src="figures/smartcity_jena.png" width="50%" />


---

## December 16: Geospatial Analytics – A Winning Industry

<img src="figures/markets1.png" width="50%" />

📈 The **<span style="color:blue">geomatics industry</span>** is growing rapidly: [market studies](https://www.fortunebusinessinsights.com/de/geospatial-analytics-markt-102219) forecast <span style="color:blue">11–14% annual revenue growth</span> — worldwide and also in Germany 🌍.

Key drivers include navigation 🧭, Earth observation 🛰️, geospatial analytics 📊, drones 🚁, environmental and traffic sensing 🌱🚦, smart cities, and digital planning (BIM).

It is therefore no surprise that the finance podcast [“Alles auf Aktien”](https://www.welt.de/podcasts/alles-auf-aktien/article6940c830ee38f909a4fbb35f/planet-labs-palantir-blacksky-galaktische-gewinne-mit-geodaten.html) picked up this topic today following my suggestion 🎙️.
Behind maps, apps, and satellites lies a highly innovative industry with real societal impact *and* strong economic potential.

👉 **GIScience is more than a study focus — it is a future-oriented industry.**

<img src="figures/markets2.png" width="50%" />


---

## December 15: MAUP – When Boundaries Change Results

<img src="figures/maup.png" width="50%" />

⚠️ The **<span style="color:blue">Modifiable Areal Unit Problem (MAUP)</span>** describes a fundamental issue in spatial analysis:
statistical results depend on how spatial units are defined. 📐

📊 The same analysis can lead to different correlations depending on whether data are aggregated by municipalities, districts, or raster cells (<span style="color:blue">scale effect</span>), or on how exactly the boundaries of those units are drawn (<span style="color:blue">zoning effect</span>). 🌍

MAUP plays a major role in topics such as disease incidence 🦠, election analyses 🗳️, or the analysis of satellite imagery.
The data do not change — but our interpretation does.

👉 Therefore, a key principle in geoinformatics applies:
results of spatial analyses are always, at least in part, a product of the chosen spatial units.

---

## December 14: Metadata & FAIR Principles

<img src="figures/fair.png" width="50%" />

**<span style="color:blue">Metadata</span>** are <span style="color:blue">“data about data”</span>.
They describe, for example, who created a dataset, when and how it was produced, at what resolution, for which purpose — and under which license it may be used.
Without metadata, geospatial data are essentially worthless.

The **<span style="color:blue">FAIR principles</span>** summarize good data practices:
data should be *<span style="color:blue">Findable</span>*, *<span style="color:blue">Accessible</span>*, *<span style="color:blue">Interoperable</span>*, and *<span style="color:blue">Reusable</span>*.
They are central to reproducibility, long-term usability, and the exchange of geospatial data in research, industry, and public administration.

👉 We can all contribute to FAIR geodata: whenever possible, we also publish the code and data underlying our analyses.
Our former PhD student Patrick Schratz even won the **<span style="color:blue">FAIRest Dataset Award</span>** 🧭.

<img src="figures/fair_patrick.png" width="50%" />

<img src="figures/fair_code.png" width="48%" /><img src="figures/fair_data.png" width="48%" />

---

## December 13: WGS84 – The Coordinate System of the World

🌍 Nearly all GPS coordinates and web maps are based on a common reference system: **<span style="color:blue">WGS84</span>**, the <span style="color:blue">World Geodetic System 1984</span>.
It represents the Earth as a mathematical ellipsoid centered on the Earth’s core.

<img src="figures/wgs84.png" width="50%" />

WGS84 greatly facilitates data exchange between countries, technologies, and web services.

📐 In Europe, **<span style="color:blue">ETRS89</span>** is often used instead. It is fixed to the European continental plate 🌍📍.
The (apparent) positional difference between the two systems is less than one meter.

🧭 The two systems shouldn’t be mixed up when detecting slope movements or surveying land parcels!
When measuring the movement rates of rock glaciers, for example, we made sure to use consistent reference systems:

<div class="figure">
<img src="figures/gps_rgl_creep.jpg" alt="Movement rates of a rock glacier in the Chilean Andes. (c) X. Bodin." width="70%" />
<p class="caption"><span id="fig:unnamed-chunk-20"></span>Figure 1: Movement rates of a rock glacier in the Chilean Andes. (c) X. Bodin.</p>
</div>

---

## December 12: The Ecological Fallacy

The **<span style="color:blue">ecological fallacy</span>** occurs when relationships observed at an aggregated level (e.g., municipalities or districts) are mistakenly assumed to apply to individuals. 📊

<img src="figures/ecological_fallacy.png" width="50%" />

**Example:** Regions with many universities often show higher crime rates 🏙️🎓.
This does *not* mean that educated people—or students—commit more crimes.
University towns are larger and have different risk factors. Moreover, who says that the recorded crimes are committed by the local residents?

👉 In <span style="color:blue">spatial analysis</span>, this is especially relevant: many geospatial datasets are only available in aggregated form.
Interpreting such data carelessly risks a false conclusion. 🗺️

---

## December 11: Crowdsourcing and Mapathons

🌍 In **<span style="color:blue">crowdsourcing</span>**, geospatial data are collected collaboratively—often through platforms such as **<span style="color:blue">OpenStreetMap</span>**.
Thousands of volunteers digitize buildings, roads, and land use, creating open and up-to-date maps used worldwide.

<img src="figures/mapathon.png" width="50%" />

At the [Mapathon organized by EGEA Jena](https://www.instagram.com/p/DR_4fgMiBTW/), students meet to do exactly that: collaboratively map regions with incomplete coverage—for humanitarian or environmental purposes 🤝.

---

## December 10: Geo-AI

**<span style="color:blue">Geo-AI</span>** refers to methods of <span style="color:blue">artificial intelligence</span> that are tailored to the specific characteristics of geographic data—particularly spatial dependence and proximity.

<img src="figures/geo_ai.png" width="50%" />

Such methods can automatically detect spatial patterns, model processes, and predict changes—such as the impacts of extreme weather events.

Within the [GENAI-X Project](https://www.genai-x.uni-jena.de/), we are developing **<span style="color:blue">generalizable AI models for environmental processes</span>**.
The goal is to make AI more robust under changing environmental conditions and to adapt it to future climates and data-sparse regions.

Geo-AI is not a replacement for scientific reasoning but an extension of our analytical toolkit—we must apply it responsibly and ensure it remains reliable and explainable 🌍.


---

## December 9: Big Geospatial Data

💾 Modern Earth observation generates enormous volumes of data every day — not only images, but also multispectral scans, sensor network streams, spatiotemporal data cubes, and derived simulation outputs.

<img src="figures/big_geodata.png" width="50%" />

A single satellite constellation such as [Planet Labs](https://en.wikipedia.org/wiki/Planet_Labs)’ *Dove* fleet, with several hundred small satellites, can image the entire land surface of the Earth almost daily — producing terabytes of data **per satellite per day**, day after day, year after year.

🌍 **Why it matters:**

- For <span style="color:blue">environmental and climate research</span>, such data make it possible to monitor land-use change, vegetation dynamics, and urbanization almost in real time.
- For <span style="color:blue">disaster management and risk assessment</span>, they provide rapid information on floods, wildfires, or landslides.
- For <span style="color:blue">mobility and spatial planning</span>: traffic patterns, land use, settlement development — all can be represented and analyzed through geospatial data.

<img src="figures/bigdata_esdl.png" width="50%" />

🔧 But **<span style="color:blue">Big Data</span>** also brings challenges:

- <span style="color:blue">Storage and computing demands</span> grow rapidly — data must be processed and archived efficiently.
- <span style="color:blue">Interpretation</span>: large datasets without context offer little value — good metadata and sound analytical design are essential.
- <span style="color:blue">Law, ethics, and privacy</span>: Who owns the data? Who can analyze it? How can privacy be protected when dealing with sensitive information such as health or land use?


---

## December 8: QGIS

**[<span style="color:blue">QGIS</span>](https://qgis.org/)** is a free and open-source GIS application — a Geographic Information System.

<img src="figures/qgis.png" width="50%" />

It allows users to create, analyze, and visualize geospatial data — from simple maps to complex #geoprocessing workflows.
Thanks to a wide range of plugins, QGIS covers nearly all aspects of modern #geospatial analysis: from terrain and network analysis to 3D visualization.

We make extensive use of QGIS in teaching — especially in the <span style="color:blue">B.Sc. Geography</span> program — and it is also employed by the [City of Jena](https://rathaus.jena.de/de/team-geoinformation).

<div class="figure">
<img src="figures/teaching_qgis.jpg" alt="QGIS in teaching. Photo: (c) S. Hese." width="60%" />
<p class="caption"><span id="fig:unnamed-chunk-27"></span>Figure 2: QGIS in teaching. Photo: (c) S. Hese.</p>
</div>

Because QGIS is freely available, it serves not only as a tool for research and public administration,
but also as a symbol of open science and global collaboration 🌍.

---

## December 7: Catchment Areas

<img src="figures/catchment.png" width="50%" />

A **<span style="color:blue">catchment area</span>** describes the region from which a location “draws its influence” – in GIScience, often the result of a **<span style="color:blue">network analysis</span>**.

<div class="figure">
<img src="figures/catchment_firestations.jpg" alt="Arrival times of fire brigades in the city of Jena. (c) City of Jena / antwortING / otz." width="50%" />
<p class="caption"><span id="fig:unnamed-chunk-29"></span>Figure 3: Arrival times of fire brigades in the city of Jena. (c) City of Jena / antwortING / otz.</p>
</div>

It can be used to calculate which street segments belong to a fire station 🚒 or from which regions the members of [FC Carl Zeiss Jena](https://www.fc-carlzeiss-jena.de/) come ⚽ — or, in the words of the fans: “Hier regiert der FCC!” (“The FCC rules here!”). 🌍

Unfortunately, [the 10-minute catchment of Jena’s fire brigades doesn’t cover the entire city area](https://www.otz.de/lokales/jena/article410477795/gutachter-alarm-die-feuerwehr-kommt-nicht-schnell-genug-in-jena.html) — and today [the opponent’s goal was within the FCC attackers’ catchment only once](https://www.mdr.de/sport/fussball_rl/spielbericht-regionalliga-nordost-mdr-sport-im-osten-fcc-fc-carl-zeiss-jena-sv-babelsberg-svb-100.html)...

<div class="figure">
<img src="figures/catchment_fcc.jpg" alt="The catchment area of FC Carl Zeiss Jena based on the spatial distribution of its members. (c) Thüringer Allgemeine." width="50%" />
<p class="caption"><span id="fig:unnamed-chunk-30"></span>Figure 4: The catchment area of FC Carl Zeiss Jena based on the spatial distribution of its members. (c) Thüringer Allgemeine.</p>
</div>

<div class="figure">
<img src="figures/fcc.png" alt="The “Südkurve” (South Stand) at the Ernst Abbe Stadium. Their catchment area? Wherever FC Carl Zeiss Jena is playing!" width="50%" />
<p class="caption"><span id="fig:unnamed-chunk-31"></span>Figure 5: The “Südkurve” (South Stand) at the Ernst Abbe Stadium. Their catchment area? Wherever FC Carl Zeiss Jena is playing!</p>
</div>

---

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
<p class="caption"><span id="fig:unnamed-chunk-33"></span>Figure 6: Drone imagery of Adélie and Gentoo penguin colonies on Ardley Island, Antarctica. Pfeifer et al. (2025) in Ecological Indicators.</p>
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
<p class="caption"><span id="fig:unnamed-chunk-36"></span>Figure 7: Geostatistical interpolation of exceedance probabilities for a nitrate threshold of 50 mg/l in an undisclosed pilot area.</p>
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
<p class="caption"><span id="fig:unnamed-chunk-42"></span>Figure 8: Movement rates of a rock glacier in the Chilean Andes. (c) X. Bodin.</p>
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
<p class="caption"><span id="fig:unnamed-chunk-44"></span>Figure 9: Geocoded police reports in Jena.</p>
</div>

By the way, a colleague here in Jena, [Dr. Xuke Hu](https://scholar.google.com/citations?hl=en&user=xCj17L0AAAAJ&view_op=list_works&sortby=pubdate) at the [DLR Institute of Data Science](https://www.dlr.de/en/dw/about-us/departments/dmo?page=3), is a leading expert in geoparsing, or geocoding of unstructured texts.

---

## Dec. 1: Geographic Information Science

<img src="figures/giscience.png" width="50%" />

**<span style="color:blue">Geographic Information Science (GIScience)</span>** is the science of acquiring, managing, analyzing, and visualizing geospatial data.

It combines computer science, geography, and statistics to make location-based phenomena measurable and modelable, and to solve geographical problems in research and applied contexts.

From traffic patterns to species distribution and climate change – wherever place matters, GIScience is there. 🌍


<img src="http://vg09.met.vgwort.de/na/93198bf7237842bd8d5ac9f172a26812" width="1" height="1" alt="">
