---
title: "Pflanzenbestimmung mit Künstlicher Intelligenz"
subtitle: "Von Spargel-Weihnachtsbäumen und den Vorzügen von Ensemble-Vorhersagen im Maschinellen Lernen"
author: Alexander Brenning
date: '2022-01-04'
slug: plant-id
categories: ["Maschinelles Lernen", "Künstliche Intelligenz"]
tags: ["Klassifikation", "Adversarial Attack", "Ensemble-Klassifikation", "Pflanzenbestimmung"]
summary: 'Künstliche Intelligenz hat bemerkenswerte Fortschritte bei der Pflanzenbestimmung in Fotos gemacht. Doch was sagt sie zu meinem Weihnachtsbaum oder zu Plastikpflanzen in rumänischen Hotels?'
lastmod: '2022-01-04'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
draft: true
---
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />





Hast du schonmal eine dieser KI-Apps ausprobiert, die nur anhand eines Handy-Fotos einer Pflanze ihre Art bestimmen? Klingt nach einem ziemlich coolen Werkzeug für alle, die sich für Natur interessieren und im Pflanzenbestimmungskurs nicht aufgepasst haben. Vor einiger Zeit habe ich daher angefangen, mit solchen Apps herumzuspielen, um (1) mit ihnen Unfug zu machen und (2) wenn das nicht klappt, beim Wandern die eine oder andere Pflanzenart zu entdecken.

Nun ja, zum Glück habe ich es geschafft, Unfug damit zu machen, denn beim Wandern mit schwerem Rucksack habe ich nur zu selten die Geduld, das Handy zu zücken, überlebenswichtigen Akku zu verschwenden, und mich zum Fotografieren zu bücken während mein Mitwanderer steten Schrittes davontrottet...

<div class="figure">
<img src="figures/Enzian.jpg" alt="Einem Enzian in den Pyrenäen auf der Spur. Foto (c) Stefan Lüdke 2021." width="40%" />
<p class="caption">Figure 1: Einem Enzian in den Pyrenäen auf der Spur. Foto (c) Stefan Lüdke 2021.</p>
</div>

So blieb es also beim Unfug und den Lektionen, die man aus diesen über Maschinelles Lernen und Künstliche Intelligenz lernen kann.

Das fing wohl damit an, dass ich als Allererstes die für etwa $5 erstandene App namens [Plant Identifier 1.4](https://play.google.com/store/apps/details?id=org.plantidentification.plantidentifier&hl=en_US&gl=US) an unserem Lehrstuhl-Weihnachtsbaum aus Plastik ausprobierte, mit goldenem und rotem Schmuck mitten im Bild. Im Handumdrehen spuckte die App aus, dass es sich wohl um einen [Gemeinen Wacholder](https://de.wikipedia.org/wiki/Gemeiner_Wacholder) handelt -- mit goldenen, faustgroßen Früchten, echt jetzt? Oder um eine [Douglasie](https://de.wikipedia.org/wiki/Gew%C3%B6hnliche_Douglasie). Oder dann doch eine [Eibe](https://de.wikipedia.org/wiki/Europ%C3%A4ische_Eibe), jetzt aber wirklich, mit einer *accuracy* von 67,21%.


<div class="figure">
<img src="figures/lehrstuhl/Gemeine_Eibe_reduced.png" alt="Der künstliche Lehrstuhl-Weihnachtsbaum ist also eine Gemeine Eibe?" width="40%" />
<p class="caption">Figure 2: Der künstliche Lehrstuhl-Weihnachtsbaum ist also eine Gemeine Eibe?</p>
</div>


Mit der Zeit kamen Versuche an Plastikpflanzen in rumänischen Hotels dazu -- z.B. einem prächtigen [Madeira-Natternkopf](https://de.wikipedia.org/wiki/Madeira-Natternkopf) (accuracy: 77,52%, wow!), jedenfalls behauptete das die App.

<!--
<img src="figures/hotel/Madeira-Natternkopf_reduced.png" width="40%" />
-->


Erst nach den Weihnachtstagen 2021 packte mich jedoch ein wenig wissenschaftlicher Ehrgeiz und ich sah mir die Fähigkeiten der App ein bisschen systematischer an... anhand unseres dekorierten Weihnachtsbaums, einer **Nordmann-Tanne**.

Um bei allem Jux fair zu sein, sei gleich hier angemerkt: Ich bin eigentlich begeistert von dieser App und anderen, die ich nur mal kurz ausprobiert habe, namentlich [Flora Incognita](https://play.google.com/store/apps/details?id=com.floraincognita.app.floraincognita&hl=de&gl=US) von der TU Ilmenau und [PlantNet](https://play.google.com/store/apps/details?id=org.plantnet&hl=de&gl=US) von einem französischen Forschungskonsortium. Sie alle liefern erstaunlich gute Ergebnisse. Ich beschränke mich hier aber auf [Plant Identifier 1.4](https://play.google.com/store/apps/details?id=org.plantidentification.plantidentifier&hl=en_US&gl=US) für Android von TAPCURATE, weil es irre einfach zu bedienen ist: Foto machen, fertig. Für die Bedienung der PlantNet-App bin ich dagegen offenbar zu doof, und Flora Incognita ist mir zu akademisch: ich hätte im Gelände keine Lust, in einen Dornbusch hineinzukriechen, um seine Rinde bildfüllend zu fotografieren, und zwar bitte auf Brusthöhe. (Okay, ich glaube das könnte man überspringen.) Eine aktuelle Übersicht über ähnliche Apps gibt es bei [lifewise.com](https://www.lifewire.com/best-plant-identification-apps-5083625).

### Eine semi-wissenschaftliche Analyse

Also, jetzt zur semi-wissenschaftlichen Inspektion von Plant Identifier 1.4 zur Identifikation einer Nordmann-Tanne unter realen Geländegerödel-Bedingungen im nachweihnachtlichen Wohnzimmer. Hierzu gehören durchwachsene Beleuchtungsverhältnisse (Lichterkette an, draußen dunkel; Lichterkette aus, Sonne scheint rein), variierende Motive (Kugeln, Engel, ... und äh... ja, auch Zweige und Stamm). Das klingt zunächst unfair, aber wer schonmal in einem echten, dichten Waldbestand war, der weiß, dass dort Zweige von Nachbarbäumen hineinragen können, Unterwuchs, Vogelnester, Stacheldrahtzaun. Auch hat sich die App nie über die Qualität meiner Bilder beschwert -- also muss sie auch mit meinen suboptimalen Studienbedingungen zurechtkommen.

{{% callout warning %}}

Hilfe! Mein Weihnachtsbaum ist ein Feder-Spargel!

{{% /callout %}}

So nahm ich also unter den fragenden Blicken meiner Familie nach und nach 69 Fotos dieser stolzen Nordmann-Tanne (Abies nordmanniana) auf, und sieh da: es handelt sich in Wirklichkeit um einen [Feder-Spargel](https://de.wikipedia.org/wiki/Feder-Spargel). Nein, [Granatapfel](https://de.wikipedia.org/wiki/Granatapfel). Oder doch eine peruanische [Cantuta](https://de.wikipedia.org/wiki/Cantua_buxifolia)? Vielleicht eine Japanische [Stechpalme](https://de.wikipedia.org/wiki/Stechpalmen) oder eine neukaledonische [Araukarien-Art](https://de.wikipedia.org/wiki/Araukarien)? All das wurde auch ausgespuckt, doch allen voran die Nordmann-Tanne (48%) und die ähnliche (aber in Deutschland nur selten als Weihnachtsbaum genutzte) Edel-Tanne (25%).

<img src="figures/Feder-Spargel_reduced.png" width="40%" /><img src="figures/Granatapfel_reduced.png" width="40%" />

Hier eine Übersicht aller Ergebnisse für die dekorierte Nordmann-Tanne:

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> Art laut App </th>
   <th style="text-align:right;"> Häufigkeit </th>
   <th style="text-align:right;"> Mittlere *accuracy* </th>
   <th style="text-align:right;"> Maximale *accuracy* </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> [Nordmann-Tanne (*Abies nordmanniana*)](https://de.wikipedia.org/wiki/Nordmann-Tanne) </td>
   <td style="text-align:right;"> 33 </td>
   <td style="text-align:right;"> 37.32 </td>
   <td style="text-align:right;"> 70.41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> [Edel-Tanne (*Abies procera*)](https://de.wikipedia.org/wiki/Edel-Tanne) </td>
   <td style="text-align:right;"> 17 </td>
   <td style="text-align:right;"> 34.16 </td>
   <td style="text-align:right;"> 62.74 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> [Hinoki-Scheinzypresse (*Chamaecyparis obtusa*)](https://de.wikipedia.org/wiki/Hinoki-Scheinzypresse) </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 29.22 </td>
   <td style="text-align:right;"> 53.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> [Neuguinea-Araukarie (*Araucaria cunninghamii*)](https://de.wikipedia.org/wiki/Neuguinea-Araukarie) </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 34.42 </td>
   <td style="text-align:right;"> 41.32 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> [Araucaria columnaris (*Araucaria columnaris*)](https://de.wikipedia.org/wiki/Araucaria_columnaris) </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 13.62 </td>
   <td style="text-align:right;"> 25.65 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> [Feder-Spargel (*Asparagus setaceus*)](https://de.wikipedia.org/wiki/Feder-Spargel) </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 32.44 </td>
   <td style="text-align:right;"> 32.44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> [Pracht-Tanne (*Abies magnifica*)](https://de.wikipedia.org/wiki/Pracht-Tanne) </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 35.77 </td>
   <td style="text-align:right;"> 35.77 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> [Granatalpfel (*Punica granatum*)](https://de.wikipedia.org/wiki/Granatapfel) </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 40.28 </td>
   <td style="text-align:right;"> 40.28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> [Cantua (*Cantua buxifolia*)](https://de.wikipedia.org/wiki/Cantua_buxifolia) </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 41.97 </td>
   <td style="text-align:right;"> 41.97 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> [Norfolk-Tanne (*Araucaria heterophylla*)](https://de.wikipedia.org/wiki/Zimmertanne) </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 13.84 </td>
   <td style="text-align:right;"> 13.84 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> [Beschuppter Wacholder (*Juniperus squamata*)](https://de.wikipedia.org/wiki/Beschuppter_Wacholder) </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 17.17 </td>
   <td style="text-align:right;"> 17.17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> [Japanische Stechpalme (*Ilex crenata*)](https://de.wikipedia.org/wiki/Stechpalmen) </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 21.46 </td>
   <td style="text-align:right;"> 21.46 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> [Purpur-Tanne (*Abies amabilis*)](https://de.wikipedia.org/wiki/Purpur-Tanne) </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 56.42 </td>
   <td style="text-align:right;"> 56.42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> [Gemeine Eibe (*Taxus baccata*)](https://de.wikipedia.org/wiki/Europ%C3%A4ische_Eibe) </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 24.40 </td>
   <td style="text-align:right;"> 24.40 </td>
  </tr>
</tbody>
</table>

### *Adversarial attacks*

Wie würde es weitergehen, wenn ich weiter drauf los fotografieren würde? Oder wenn ich ein bisschen mit dem Schmuck spielen würde? Würde irgendwann auch mal ein Foto als Säulenkaktus oder als Gänseblümchen klassifiziert werden? Kann ich das vielleicht sogar durch gezielte, kaum erkennbare Bildmanipulation herbeiführen?

Vielleicht. So etwas nennt man in der KI-Forschung eine **_adversarial attack_**, also einen "feindlichen Angriff".

{{% callout warning %}}

Hausaufgabe: Eine _adversarial attack_ auf die Plant-Identifier-App durchführen, durch die der Weihnachtsbaum als Säulenkaktus oder Gänseblümchen klassifiziert wird.

{{% /callout %}}


### Fluch und Segen von Kontextinformationen in der KI

Ob der Weihnachtsbaum-Schmuck nun dabei behilflich oder eher hinderlich war, ausgerechnet zwei Weihnachtsbaumarten so weit oben zu platzieren, lässt sich nur spekulieren. Für eine Gegenprobe ohne Schmuck ist es leider inzwischen zu spät.

Manche Apps verwenden übrigens auch Kontextinformationen wie zum Beispiel den Standort, um bei Wildpflanzen exotische Arten auszuschließen. Allerdings besteht dabei die Gefahr, eingeschleppte Pflanzen nicht zu erkennen, weil das KI-System sie hier nicht erwartet -- das kann natürlich auch uns Menschen passieren. Solche potenziell nützlichen Informationen über die *a priori*-Wahrscheinlichkeit einer Art in einem bestimmten Kontext können also auch den Blick auf Neues versperren und sind somit ein zweischneidiges Schwert: sie sind Wissensvorsprung und Vorurteil zugleich.


### Mit Ensemble-Methoden Klassifikationen verbessern

Nun waren die mit nur einem Foto erzielten Ergebnisse schon sehr ermutigend, auch wenn die Fehlklassifikationen reichlich Anlass zu Spott geben. Lässt sich die Klassifikation verbessern, indem man die Ergebnisse mehrerer Fotos kombiniert? Welche Strategie ist am erfolgreichsten?

Ein im Maschinellen Lernen verwendeter Ansatz besteht darin, auf der Grundlage mehrerer Klassifikationsergebnisse eine Mehrheitsentscheidung zu treffen. Diese Strategie ist die Grundlage äußerst erfolgreicher Verfahren wie des 2001 von Leo Breiman entwickelten *Random Forest*. Doch anstelle eines reinen Mehrheitsentscheids wäre es auch denkbar, die einzelnen Klassifikationsergebnisse nach ihrer Qualität (*accuracy*) zu gewichten, uneindeutige Fotos somit weniger stark zu berücksichtigen. Und schließlich könnte man auch einfach diejenige Klassifikation auswählen, die die höchste *accuracy* erzielt hat ("Maximalselektion").

Mit der Weihnachtsbaum-Bilddatenbank lassen sich diese Strategien vergleichen: Wir ziehen zufällig z.B. fünf Fotos (bzw. deren Klassifikationsergebnisse) aus der Datenbank und treffen einen Mehrheitsentscheid nach der gewählten Methode. Das wiederholen wir viele (hier: 2000) Male und berechnen, wie oft beim Mehrheitsentscheid "Nordmann-Tanne" herauskommt:

<div class="figure">
<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-6-1.png" alt="Zunahme der Klassifikationsgüte mit zunehmender Anzahl verwendeter Fotos für unterschiedliche Ensemble-Verfahren." width="80%" />
<p class="caption">Figure 3: Zunahme der Klassifikationsgüte mit zunehmender Anzahl verwendeter Fotos für unterschiedliche Ensemble-Verfahren.</p>
</div>

Mit nur fünf Fotos lassen sich somit beachtliche Verbesserungen erzielen. Wenn unsere App in der Lage wäre, aus einer Videosequenz eine Reihe unterschiedlicher Fotos der gleichen Pflanze zu extrahieren, könnte man mühelos 10 oder 20 Fotos von unterschiedlichen Pflanzenteilen aufnehmen und damit zumindest bei meinem Weihnachtsbaum eine Erfolgsquote von 90% erzielen.
Gewichtete und ungewichtete Mehrheitsentscheide sind dabei vielversprechender als die Maximalselektion.

Diese Strategien lassen noch weiter perfektionieren -- so fordern manche Apps Fotos bestimmter Pflanzenteile (Blätter, Stamm, Blüte) an, wodurch mit einer geringeren Anzahl Fotos (und größerer Sorgfalt) bessere Ergebnisse erzielt werden.


## Was haben wir gelernt?

- KI-basierte Apps zur Pflanzenbestimmung in Fotos sind erstaunlich erfolgreich.
- Dennoch: Es kann auch Unfug herauskommen. Ob ich es wohl schaffe, einen Weihnachtsbaum als Gänseblümchen klassifiziert zu bekommen (*adversarial attack*)?
- Eine Ensemble-Klassifikation mit Hilfe mehrerer Aufnahmen würde die Genauigkeit erheblich verbessern.
- Die Einbeziehung von Kontextinformationen, z.B. Standortdaten, ist ein zweischneidiges Schwert: Vorwissen oder Vorurteil?


## Weiterführende Links und Literatur

Über die von mir genutzte App [Plant Identifier](https://plantidentificationapp.wordpress.com/) gibt es leider nur wenige Hintergrundinfos, aber...:
- [PlantNet](https://plantnet.org/en/2018/08/01/a-book-to-thank-you-and-to-advance-research/) ist eine hervorragende App und Web-Plattform für die Pflanzenbestimmung mit KI. Einen Überblick über die Architektur von PlantNet gibt ein Artikel von [Affouard et al. (2017) in ICLR](https://openreview.net/pdf?id=HJVJpENFg).
- Aus PlantNet ist eine [Buchpublikation](https://link.springer.com/book/10.1007/978-3-319-76445-0#toc) hervorgegangen, die die wissenschaftlichen Hintergründe im Detail darstellt, etwa in [diesem Kapitel](https://link.springer.com/chapter/10.1007/978-3-319-76445-0_8).

<img src="https://vg09.met.vgwort.de/na/b9e5f50f04f94c6db5096da4e69d8546" width="1" height="1" alt="">
