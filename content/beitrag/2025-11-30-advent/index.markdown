---
title: "Mein Geoinformatik-Adventskalender"
author: "Alexander Brenning"
authors: ["Alexander Brenning"]
date: '2025-11-30'
slug: advent
categories: ["GIS"]
tags: ["GIS"]
subtitle: 'Täglich aktualisiert'
summary: '24 Konzepte der Geoinformatik, die alle Geograph:innen kennen sollten...'
lastmod: "2025-12-04"
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---
<link href="{{< blogdown/postref >}}index_files/panelset/panelset.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/panelset/panelset.js"></script>







## 6. Dezember: Drohnen (UAV – Unmanned Aerial Vehicles)

🚁 Drohnen erfassen Geodaten aus der Luft – meist mit Kameras, LiDAR oder Multispektralsensoren 🎨.

<img src="figures/drone2.png" width="50%" />

Sie liefern hochaufgelöste Orthofotos und 3D-Modelle für Umweltmonitoring 🌿, Landnutzung 🏙 oder Katastrophenerfassung 🌋.

Ihr Vorteil: flexible Einsätze und Zentimeterpräzision – ihr Nachteil: begrenzte Flugzeit und rechtliche Auflagen ⚖️.

Ungefähr die coolste Sache, die man mit Drohnen machen kann, ist die Beobachtung von süßen kleinen Pinguinen 🐧. Hier Bilder [aus einer Publikation](https://doi.org/10.1016/j.ecolind.2024.113011) von <span style="color:blue">Christian Pfeifer</span> ([ThINK GmbH](https://www.think-jena.de/), Finanzierung [Umweltbundesamt](https://www.umweltbundesamt.de/), Doktorand in meiner Gruppe), der gerade wieder auf Expedition ist... ❄️🚀

<div class="figure">
<img src="figures/Pfeifer2025penguins.jpeg" alt="Drohnenaufnahmen von Adélie- und Gentoo-Pinguinkolonien auf Ardley Island, Antarktis. Pfeifer et al. (2025) in Ecological Indicators, " width="100%" />
<p class="caption"><span id="fig:unnamed-chunk-3"></span>Figure 1: Drohnenaufnahmen von Adélie- und Gentoo-Pinguinkolonien auf Ardley Island, Antarktis. Pfeifer et al. (2025) in Ecological Indicators, </p>
</div>



---

## 5. Dezember: Interpolation

🌈 **<span style="color:blue">Interpolation</span>** schätzt Werte an Orten, an denen keine Messung vorliegt.

<img src="figures/Robo-Ausweisung.png" width="50%" />

📍 Aus Messwerten an Punkten wird ein kontinuierliches Feld berechnet – etwa Lufttemperatur oder Schadstoffkonzentration.
Methoden wie Inverse Distanzgewichtung oder das geostatistische <span style="color:blue">Kriging</span>-Verfahren nutzen räumliche Nachbarschaftsbeziehungen, um glatte Oberflächen zu erzeugen.
Das Ergebnis: Karten, die Lücken im Wissen sichtbar schließen. 🌍

<img src="figures/regression_kriging.png" width="50%" />

✨ Aktuell nutzen wir am 
[Lehrstuhl für Geoinformatik](https://www.chemgeo.uni-jena.de/30778/professur-fuer-geoinformatik) im [ReGeNi-Projekt](https://www.umweltbundesamt.de/sites/default/files/medien/2875/dokumente/20241121_projektsteckbrief_regeni.pdf) (Finanzierung [Umweltbundesamt](https://www.umweltbundesamt.de/)) fortgeschrittene Kriging-Verfahren, um <span style="color:blue">Nitratkonzentrationen</span> im Grundwasser bundesweit zu ermitteln. [Unser Verfahren](https://geods.netlify.app/beitrag/nitrate/) bezieht auch Zusatzinformationen – Hydrogeologie und Landbedeckung – mit ein, um Argumente für und gegen eine Nitratbelastung statistisch fundiert abzuwägen. Das ist essenziell, um evidenzbasiert Entscheidungen zu treffen!

<div class="figure">
<img src="figures/tgrk.png" alt="Geostatistisch interpolierte Überschreitungswahrscheinlichkeiten für einen Nitratschwellenwert von 50 mg/l in einer nicht identifizierten Pilotregion." width="50%" />
<p class="caption"><span id="fig:unnamed-chunk-6"></span>Figure 2: Geostatistisch interpolierte Überschreitungswahrscheinlichkeiten für einen Nitratschwellenwert von 50 mg/l in einer nicht identifizierten Pilotregion.</p>
</div>


---

## 4. Dezember: Raster- und Vektordaten

🌍 Geodaten werden meist als **Raster- oder Vektordaten** gespeichert. Diese beiden Datenmodelle sind die Grundbausteine von GIS-Datenbanken. ✨

<img src="figures/raster_vector.png" width="50%" />

**<span style="color:blue">Raster</span>** bestehen aus regelmäßig angeordneten Zellen, die jedem Ort einen Wert zuweisen – ideal für kontinuierliche Phänomene wie Temperatur 🌡.

**<span style="color:blue">Vektordaten</span>** beschreiben Objekte durch Punkte, Linien oder Flächen – perfekt für Straßen, Flüsse oder Grundstücke.

Thüringen hat ein fantastisches Programm **<span style="color:blue">Offene Geodaten</span>**. Ich habe mir es mal mit Hilfe eines R-Skripts näher angeschaut: Von den über 1600 offenen Datensätzen sind 82 % Vektordatensätze! Viele sind allerdings kleine kommunale Datensätze wie Bebauungspläne, andere, wie die Erosionsgefährdung, decken das ganze Land ab. 🌳

Hier etwa die erosionsgefährdeten Flächen bei Jena im [Thüringer Kartenviewer](https://thueringenviewer.thueringen.de/) als Polygon-Vektordaten ((c) GDI-Th):

<img src="figures/erosion_jena.png" width="70%" />


---

## 3. Dezember: Positionsbestimmung mit GPS/GNSS

<img src="figures/gps2.png" width="50%" />

Das **<span style="color:blue">Global Positioning System (GPS)</span>** ist Teil der Familie der Globalen Navigationssatellitensysteme (GNSS).
Solche Systeme bestimmen Positionen, indem sie Signale mehrerer Satelliten messen und daraus Entfernungen berechnen.

📍 Das Ergebnis: präzise Koordinaten – meist genauer als ein paar Meter. Dein Handy weiß also ziemlich genau, wo du bist.

<img src="figures/gps_jena.jpg" width="50%" />

✨ In unserem Studiengang [B.Sc. Geographie](https://www.chemgeo.uni-jena.de/210/geographie) führen wir die Studierenden in die mobile Datenerhebung (*Mobile Mapping*) mit GNSS-Tablets ein.

🧭 In der Forschung verwenden wir dagegen hochgenaue GNSS-Vermessungsgeräte - etwa in Chile bei der Bestimmung von Bewegungsraten von Blockgletschern.

<img src="figures/gps_rgl.jpg" width="50%" />

<div class="figure">
<img src="figures/gps_rgl_creep.jpg" alt="Bewegungsraten eines Blockgletschers in den chilenischen Anden. (c) X. Bodin." width="70%" />
<p class="caption"><span id="fig:unnamed-chunk-12"></span>Figure 3: Bewegungsraten eines Blockgletschers in den chilenischen Anden. (c) X. Bodin.</p>
</div>

👉 GPS ist übrigens das amerikanische GNSS – Wusstest du, dass die Europäische Union mit [Galileo](https://de.wikipedia.org/wiki/Galileo_(Satellitennavigation)) ein eigenes GNSS betreibt?


---


## 2. Dezember: Geocodierung

<img src="figures/geocoding.png" width="50%" />

📍 **<span style="color:blue">Adress-Geocodierung</span>** übersetzt Textadressen in geografische Koordinaten.

Sie nutzt Referenzdatenbanken, die Adressen mit räumlichen Positionen verknüpfen.

🌍 So wird *„Leutragraben 1, Jena“* zu einem Punkt mit Breiten- und Längengrad – und kann auf einer Karte dargestellt oder analysiert werden. In diesem Falle führt euch die Koordinate direkt zum [Jentower](https://de.wikipedia.org/wiki/Jentower) im Zentrum Jenas, wo sich mein Büro befindet.

Auch andere Ortsangaben kann man in Koordinaten umwandeln – z.B. IP-Adressen von Computern, Ortsbezeichnungen wie *„Napoleonstein“*, oder sogar unstrukturierte Texte. Hier ein Beispiel mit [Polizeiberichten](https://geods.netlify.app/beitrag/polizeiberichte/) aus Jena.

<div class="figure">
<img src="figures/geocoding_jena.png" alt="Geocodierte Polizeiberichte." width="50%" />
<p class="caption"><span id="fig:unnamed-chunk-14"></span>Figure 4: Geocodierte Polizeiberichte.</p>
</div>

Übrigens: Ein Kollege hier in Jena, [Dr. Xuke Hu](https://scholar.google.com/citations?hl=en&user=xCj17L0AAAAJ&view_op=list_works&sortby=pubdate) vom [DLR-Institut für Datenwissenschaften](https://www.dlr.de/en/dw/about-us/departments/dmo?page=3), ist ein führender Experte für Geoparsing, also die Geocodierung unstrukturierter Texte.

---

## 1. Dezember: Was ist Geoinformatik?

<img src="figures/giscience.png" width="50%" />

Die **<span style="color:blue">Geoinformatik</span>** ist die Wissenschaft von der Erfassung, Verwaltung, Analyse und Visualisierung räumlicher Daten.

Sie kombiniert Methoden der Informatik, Geographie und Statistik, um ortsbezogene Phänomene messbar und modellierbar zu machen und geographische Fragen in Forschung und Anwendung zu beantworten.

Ob Verkehrsfluss, Artenverbreitung oder Klimawandel – wo der Ort eine Rolle spielt, ist Geoinformatik nicht weit. 🌍


<img src="http://vg09.met.vgwort.de/na/93198bf7237842bd8d5ac9f172a26812" width="1" height="1" alt="">
