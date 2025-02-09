---
title: "OVG Niedersachen und die Regionalisierung"
author: "Alexander Brenning"
authors: ["Alexander Brenning"]
date: '2025-02-09'
slug: ovg-nitrat
categories: ["Geostatistik", "Grundwasser"]
tags: ["Geostatistik", "Interpolation", "Kriging", "Überschreitungsgebiete", "Nitrat", "Grundwasser", "Umweltverschmutzung"]
subtitle: 'Messdaten optimal zur Ausweisung von Nitratbelastung nutzen'
summary: 'Das OVG-Urteil zur Ausweisung nitratbelasteter „roter Gebiete“ in Niedersachsen wirft die Frage auf, wie wir empirisch fundiert die Gefährdung natürlicher Ressourcen abschätzen....'
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









Das [OVG-Urteil zur Ausweisung nitratbelasteter „roter Gebiete“ in Niedersachsen](https://www.ndr.de/nachrichten/niedersachsen/lueneburg_heide_unterelbe/Nitratbelastung-im-Grundwasser-OVG-kippt-Duengeverordnung-in-Teilen,nitrat226.html) lässt mich aus fachlicher Sicht schon ein wenig die Stirn runzeln. Es geht hier auch grundlegend um <span style="color:red">die Frage, wie wir ---empirisch fundiert--- die Gefährdung natürlicher Ressourcen abschätzen</span>.

Hier meine Anmerkungen, bezugnehmend auf die [Pressemitteilung des OVG](https://oberverwaltungsgericht.niedersachsen.de/aktuelles/presseinformationen/ausweisung-der-roten-gebiete-in-niedersachsen-ist-unwirksam-239116.html):


1️⃣ **<span style="color:red">Grundwasserkörper (GWK) sind verwaltungsrechtliche Einheiten --- keine hydrogeologisch scharfen Grenzen</span>.**
Nitrat kann über GWK-Grenzen hinweg eingetragen und transportiert werden. Die vom OVG geforderte harte Trennung bei der Interpolation ignoriert diese Realität. Hier ein Beispiel von GWK und modellierter GW-Fließrichtung (sowie zwei Nitrat-Messstellen) in einem Beispiel hier in der Region. 



<div class="figure">
<img src="figures/GWK.png" alt="Die Grenzen von Grundwasserkörper (mittelblaue Linien) werden häufig durch modellierte Grundwasser-Strömungslinien gekreuzt --- zwar ist auch das nur eine vereinfachte Darstellung ohne Berücksichtigung der Grundwasser-Stockwerke, jedoch verdeutlicht dies, dass es sich bei einem GWK offensichtlich nicht um eine abgeschlossene "Badewanne" handelt. Quelle: Kartendienst des TLUBN." width="60%" />
<p class="caption"><span id="fig:unnamed-chunk-2"></span>Figure 1: Die Grenzen von Grundwasserkörper (mittelblaue Linien) werden häufig durch modellierte Grundwasser-Strömungslinien gekreuzt --- zwar ist auch das nur eine vereinfachte Darstellung ohne Berücksichtigung der Grundwasser-Stockwerke, jedoch verdeutlicht dies, dass es sich bei einem GWK offensichtlich nicht um eine abgeschlossene "Badewanne" handelt. Quelle: Kartendienst des TLUBN.</p>
</div>



2️⃣ **<span style="color:red">Auch meine geostatistischen Analysen bestätigen, dass GWK keine echten Barrieren für den Informationsgehalt von Nitratmessstellen sind.</span>** Wissenschaftlich fundierte Regionalisierung sollte deshalb nicht an administrativen GWK-Grenzen Halt machen. Hier auf Grundlage [meines Gutachtens](https://geods.netlify.app/beitrag/nitrate/) für das Umweltbundesamt empirische Semivariogramme von Nitratgehalten in ganz Deutschland --- es sind keine klaren Unterschiede zwischen Messstellenpaaren innerhalb von GWK und über GWK-Grenzen hinweg zu erkennen.

<div class="figure">
<img src="figures/Svgm_Barriere.png" alt="Empirische Semivariogramme der Nitratbelastung innerhalb von GWK (blau) und über deren Grenzen hinweg (rot). (Semivariogramm der Residuen eines linearen Modells Box--Cox-transformierter Daten; robuste Berechnung nach Cressie, Detailbetrachtung verglichen mit Abbildung im Gutachten.)" width="60%" />
<p class="caption"><span id="fig:unnamed-chunk-3"></span>Figure 2: Empirische Semivariogramme der Nitratbelastung innerhalb von GWK (blau) und über deren Grenzen hinweg (rot). (Semivariogramm der Residuen eines linearen Modells Box--Cox-transformierter Daten; robuste Berechnung nach Cressie, Detailbetrachtung verglichen mit Abbildung im Gutachten.)</p>
</div>


3️⃣ Wichtige Einflussfaktoren wie Niederschlag, Landnutzung und atmosphärische Deposition sind GWK-übergreifend. Sie erklären in manchen Regionen rund 60% der räumlichen Variabilität der Nitratkonzentration. **<span style="color:red">Nur eine Regionalisierung, die nicht GWK-fixiert ist, kann diese großräumigen Faktoren berücksichtigen, um Verzerrungen zu vermeiden.</span>**


<div class="figure">
<img src="figures/Linear_Model_R2.png" alt="Übersicht über den Anteil der deutschlandweiten räumlichen Variabilität der Nitratkonzentrationen, der durch (nach AVV GeA zulässigen) Zusatzvariablen erklärt werden kann. Quelle: Brenning (2024)." width="60%" />
<p class="caption"><span id="fig:unnamed-chunk-4"></span>Figure 3: Übersicht über den Anteil der deutschlandweiten räumlichen Variabilität der Nitratkonzentrationen, der durch (nach AVV GeA zulässigen) Zusatzvariablen erklärt werden kann. Quelle: Brenning (2024).</p>
</div>



4️⃣ **<span style="color:red">Evidenzbasierte Ausweisung nitratbelasteter Gebiete sollte alle verfügbaren Datenquellen optimal nutzen.</span>** Wie in [meinem Gutachten](https://geods.netlify.app/beitrag/nitrate/) dargelegt, ist Kriging mit externer Drift ein etabliertes, transparentes Verfahren, das Messwerte mit Zusatzvariablen kombiniert und unter nachprüfbaren Bedingungen optimale Vorhersagen ermöglicht. Nur so können die mit hohem Aufwand erhobenen Messdaten auch optimal genutzt werden.

### Literatur und Links

Brenning, A. (2024). Evaluierung und Weiterentwicklung der Regionalisierungsverfahren zur Ausweisung nitratbelasteter Gebiete nach AVV GeA in Deutschland. TEXTE 67/2024, 54 pp. Umweltbundesamt, Dessau. <https://www.umweltbundesamt.de/publikationen/evaluierung-weiterentwicklung-der>

NDR (2025). Nitratbelastung im Grundwasser: OVG kippt Düngeverordnung in Teilen. <https://www.ndr.de/nachrichten/niedersachsen/lueneburg_heide_unterelbe/Nitratbelastung-im-Grundwasser-OVG-kippt-Duengeverordnung-in-Teilen,nitrat226.html>

Pressemitteilung des OVG Niedersachen (2025). Ausweisung der „roten Gebiete“ in Niedersachsen ist unwirksam. <https://oberverwaltungsgericht.niedersachsen.de/aktuelles/presseinformationen/ausweisung-der-roten-gebiete-in-niedersachsen-ist-unwirksam-239116.html>
