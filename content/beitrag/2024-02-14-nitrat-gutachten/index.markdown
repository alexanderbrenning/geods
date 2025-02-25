---
title: "Ausweisung nitratbelasteter Gebiete"
author: "Alexander Brenning"
authors: ["Alexander Brenning"]
date: '2024-04-17'
slug: nitrate
categories: ["Geostatistik", "Grundwasser"]
tags: ["Geostatistik", "Interpolation", "Kriging", "inverse Distanzgewichtung", "Nächster-Nachbar-Interpolation", "Voronoi-Verfahren", "bedingte geostatistische Simulation", "Überschreitungsgebiete", "Nitrat", "Grundwasser", "Umweltverschmutzung"]
subtitle: 'Sachverständigengutachten zu Regionalisierungsverfahren im Auftrag des Umweltbundesamtes'
summary: 'Zusammenfassung meines Sachverständigengutachtens zu Regionalisierungsverfahren für die Ausweisung von Gebieten mit nitratbelastetem Grundwasser, erstellt im Auftrag des Umweltbundesamtes...'
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

Vor Kurzem hatte ich die Ehre, ein Sachverständigengutachten für das Umweltbundesamt zu erstellen, in dem ich Regionalisierungsverfahren für die Ausweisung nitratbelasteter Gebiete nach AVV GeA bewerten sollte. Dabei ist es wichtig zu verstehen, dass es sich hierbei um eine Überschreitungsmodellierung handelt, nicht nur um eine Interpolation. Geeignete geostatistische Verfahren berücksichtigen räumliche Heterogenität und Nichtstationarität.

Unten die Zusammenfassung des Gutachtens, welches in der Schriftenreihe des Umweltbundesamts publiziert wurde ([Brenning, 2024](https://www.umweltbundesamt.de/publikationen/evaluierung-weiterentwicklung-der)); Zeitschriftenartikel in Vorbereitung --- Kommentare willkommen.


## Zusammenfassung des Gutachtens

Als Grundlage für einen verbesserten Grundwasserschutz erfordert die EU-Nitratrichtlinie (91/676/EWG) in Verbindung mit der Düngeverordnung die Ausweisung nitratbelasteter Gebiete. Die Gebietsausweisung erfolgt gemäß der Allgemeinen Verwaltungsvorschrift zur Ausweisung von mit Nitrat belasteten und eutrophierten Gebieten (AVV GeA) anhand von Messwerten an derzeit rund 13.500 Grundwassermessstellen. Hierfür sind in Abhängigkeit von der Messstellendichte deterministische Verfahren (Inverse Distanzgewichtung, IDW, sowie Voronoi-Verfahren bzw. Nächster-Nachbar-Interpolation, NNI) oder geostatistische Regionalisierungsverfahren zu verwenden. Die aktuelle Ausweisungspraxis auf Landesebene soll in ein bundesweit einheitliches geostatistisches Regionalisierungsverfahren überführt werden.

### Ziele des Gutachtens

Das vorliegende Gutachten verfolgt vor diesem Hintergrund die folgenden Ziele:

1. Die bisherigen Verfahren zur Gebietsausweisung sollen hinsichtlich ihrer Eignung zur flächenhaften Abgrenzung von Nitrateintragsgebieten aus fachlicher Sicht evaluiert und bewertet werden.
2. Es soll eruiert werden, ob und wenn ja, wie die bisherigen Verfahren weiterentwickelt werden könnten, um die Flächenabgrenzung unter den gegebenen Randbedingungen maximal robust und verursachergerecht vorzunehmen.
3. Über die bisherigen Verfahren zur Gebietsausweisung hinaus soll untersucht werden, inwieweit neue oder alternative Methoden der räumlichen Statistik besser geeignet sind. Dabei soll auch eine Empfehlung abgegeben werden, wie mit der verpflichtenden Einführung geostatistischer Verfahren bis Ende 2028 umzugehen ist und wie diese umgesetzt werden könnte.

### Problemanalyse

Die Problemanalyse in Abschnitt 2 des Gutachtens formalisiert die Aufgabe der Gebietsausweisung als **Überschreitungsregionsproblem**, welches im Gegensatz zur herkömmlichen Betrachtung als Regionalisierungsproblem steht, und zeigt damit eine mögliche Quelle erheblicher Verzerrungen auf. Analysen in einer Pilotregion sowie deutschlandweit dienen der Veranschaulichung. Grundsätzlich bieten Regionalisierungsmodelle und insbesondere das **Regressionskriging (Kriging mit externer Drift, KED)** umfassende Gestaltungsmöglichkeiten für die Modellierung von räumlicher Heterogenität mit Hilfe flächenhaft verfügbarer Zusatzinformationen. Aus der Problemanalyse werden anschließend die quantitativen Bewertungskriterien und qualitativen Anforderungen an datengetriebene Modelle der Nitratbelastung abgeleitet. Die deterministischen Verfahren der AVV GeA (IDW, NNI) erfüllen diese Kriterien im Vergleich zu KED nicht, und das SIMIK+-Regressionskriging weist vermeidbare Einschränkungen und Mängel auf. Die **bedingte geostatistische Simulation** (BGS) wird als Verfahren eingeführt, welches Wahrscheinlichkeiten der Überschreitung des Nitratschwellenwertes regionalisieren kann und es ferner erlaubt, die tatsächlich nitratbelastete Gesamtfläche unverzerrt zu berechnen. Die Charakterisierung der Gebietsausweisung als Diagnoseproblem eröffnet hierbei den Blick auf eine Abwägung der Folgen falsch-positiver gegenüber falsch-negativen Gebietsausweisungen. Des Weiteren werden technische Aspekte wie die Modellierung nichtstationärer Trends und Abhängigkeiten sowie nicht-normalverteilter Daten adressiert und die Potenziale von Modellen des maschinellen Lernens diskutiert. Die Kombination mit dem sekundären Ausweisungskriterium, dem Vorliegen eines ansteigenden Trends bei Nitratgehalten über 37,5 mg/l, wird abschließend skizziert.


<div class="figure">
<img src="figures/pred_comparison.png" alt="Beispielhafte Anwendung verschiedener Regionalisierungsverfahren zur Interpolation der Nitratkonzentration des Grundwassers in einer Pilotregion. NNI: Nächter-Nachbar-Interpolation (Voronoi-Verfahren); IDW: Inverse Distanzgewichtung; OK: Ordinary Kriging; KED: Kriging mit externer Drift (Regressionskriging); RF: Random forest." width="100%" />
<p class="caption"><span id="fig:unnamed-chunk-2"></span>Figure 1: Beispielhafte Anwendung verschiedener Regionalisierungsverfahren zur Interpolation der Nitratkonzentration des Grundwassers in einer Pilotregion. NNI: Nächter-Nachbar-Interpolation (Voronoi-Verfahren); IDW: Inverse Distanzgewichtung; OK: Ordinary Kriging; KED: Kriging mit externer Drift (Regressionskriging); RF: Random forest.</p>
</div>


### Datengrundlagen für Zusatzinformationen

Flächenhaft vorliegende Datengrundlagen werden anschließend hinsichtlich ihrer Eignung als **Zusatzinformationen** oder erklärende Variablen in der Regionalisierung der Nitratbelastung untersucht (Abschnitt 3 des Gutachtens). Dabei können allgemeine geoökologische Raumgliederungen von prozessbezogenen Umweltvariablen unterschieden werden. Eine dritte Gruppe sind abgeleitete prozessbezogene Merkmale, wie beispielsweise die Einzugsgebietsmittelwerte erklärender Variablen (z.B. landwirtschaftlicher Flächenanteil im Anstrombereich). Eine erkundende Analyse der Daten weist insbesondere auf einen Nutzen von Boden-Klima-Räumen, hydrogeologischen Großräumen, geochemischen Gesteinstypen und landwirtschaftlichen Flächenanteilen im Einzugsgebiet hin. Eine separate Berücksichtigung dieser Variablen innerhalb der hydrogeologischen Großräume (Interaktionsterme) erhöht die erklärte Varianz substanziell. Die Zusatzinformationen liegen jedoch teils in groben Detaillierungsgraden vor (Maßstäbe bis 1:1.000.000 und Auflösungen bis 1 km × 1 km bzw. Gemeindeebene), woraus sich Unsicherheiten vor allem entlang von Zonengrenzen ergeben. Grundsätzlich ist vor diesem Hintergrund der in der AVV GeA geforderte Zielmaßstab von 1:25.000 kritisch zu hinterfragen.

### Anforderungen an Regionalisierungsverfahren

Aufbauend auf den vorangegangenen Abschnitten werden in Abschnitt 4 des Gutachtens Anforderungen an Regionalisierungsverfahren formuliert:

1.	Regionalisierungsverfahren müssen in der Lage sein, Überschreitungs-Wahrscheinlichkeiten --- und nicht lediglich erwartete Nitratgehalte --- räumlich vorherzusagen. Adäquate Verteilungsmodelle sind hierfür erforderlich.
2.	Sie müssen hierbei in der Lage sein, erklärende Variablen unterschiedlicher Merkmalstypen einzubeziehen, um räumliche Muster und Trends prozessadäquat und verursachergerecht zu berücksichtigen.
3.	Da heterogene (nichtstationäre) räumliche Abhängigkeiten nachgewiesen wurden, sind diese adäquat zu modellieren.
4.	Des Weiteren ist gegebenenfalls der Skalenwechsel von Punktmessungen zu Kleinflächen (Rasterzellen) zu modellieren, wobei Zielmaßstab oder -auflösung kritisch hinterfragt werden sollten.

Es wird darauf hingewiesen, dass es für einen ausgewogenen Grundwasserschutz weiterhin der Bestimmung eines geeigneten Überschreitungswahrscheinlichkeits-Entscheidungswertes bedarf. Die AVV GeA trifft hierzu keine spezifischen Festlegungen.


### Schlussfolgerungen und Empfehlungen

Auf Grundlage dieser Anforderungen ergeben sich folgende Schlussfolgerungen hinsichtlich der Ziele des Gutachtens. Zu Ziel 1 wird festgestellt, dass von den in der AVV GeA betrachteten Verfahren lediglich die geostatistischen Methoden den Anforderungen genügen. Eine Verwendung von IDW oder NNI (Voronoi-Verfahren) wird nicht empfohlen, und zwar unabhängig von den in der AVV GeA formulierten, für nicht zweckmäßig erachteten Kriterien für die Messstellendichte. Das einzige bisher verwendete geostatistische Verfahren, SIMIK+, weist ferner Einschränkungen und technische Fehler auf; allgemeinere, gut etablierte geostatistische Verfahren (KED, BGS) existieren, weshalb eine Weiterentwicklung nicht sinnvoll erscheint (Ziel 2).



<div class="figure">
<img src="figures/prob_BGS.png" alt="Beispielhafte Anwendung der bedingten geostatistischen Simulation in Verbindung mit externer Drift zur Berechnung der Überschreitungswahrscheinlichkeiten für einen Nitratschwellenwert von 50 mg/l in einer Pilotregion." width="50%" />
<p class="caption"><span id="fig:unnamed-chunk-3"></span>Figure 2: Beispielhafte Anwendung der bedingten geostatistischen Simulation in Verbindung mit externer Drift zur Berechnung der Überschreitungswahrscheinlichkeiten für einen Nitratschwellenwert von 50 mg/l in einer Pilotregion.</p>
</div>


Im Hinblick auf Ziel 3 des Gutachtens wird eine Vorgehensweise aus dem Bereich der geostatistischen Regionalisierung vorgeschlagen, die etablierte Werkzeuge nutzt und auch kurzfristig deutschlandweit umsetzbar ist. Dieser nutzt im Kern BGS oder KED für die Abschätzung von Überschreitungswahrscheinlichkeiten und -flächenanteil. Ein lineares, ggf. nichtlineares räumliches Trendmodell erfasst dabei prozessbezogene Muster und räumliche Abhängigkeiten, wobei Teilmodelle innerhalb hydrogeologischer Großräume regionale Heterogenität berücksichtigen können. Von einer separaten Modellierung der Nitratbelastung auf Bundeslandebene wird dagegen abgeraten. Datentransformationen, Merkmalsextraktion und datengetriebene Modellselektion sind weitere erforderliche Schritte der Modellbildung. Die Frage eines möglichen Skalenwechsels von der Punkt- zur Rasterzellen-Ebene in geeigneter Auflösung ist zu klären und kann durch Block-Geostatistik umgesetzt werden. 

Es wird weiterhin empfohlen, die genutzten geostatistischen Modelle auch zur optimalen Standortauswahl in der weiteren Verdichtung des Messstellennetzes zu nutzen, um mit dem erforderlichen Ressourceneinsatz den bestmöglichen Nutzen zu erzielen.

Hinsichtlich des Potenzials von Verfahren des maschinellen Lernens, deren Nutzung jedoch derzeit nicht explizit durch die AVV GeA abgesichert ist, muss konstatiert werden, dass derzeit keine belastbaren Hinweise auf verbesserte räumliche Vorhersagen vorliegen und die eingeschränkten Interpretationsmöglichkeiten von Black-Box-Modellen neue Fragen hinsichtlich der Nachvollziehbarkeit von Entscheidungen aufwerfen. Weitere Untersuchungen und Methodenentwicklungen im Hinblick auf längerfristige Nutzungsperspektiven werden empfohlen.

Abschließend ist zu konstatieren, dass die die Ausweisung nitratbelasteter Gebiete spezielle Anforderungen an Regionalisierungsverfahren stellt, und ihr unreflektierter Einsatz in systematischen Unter- oder Überausweisungen resultieren kann. Das weite Feld der geostatistischen Regressionskriging-Verfahren bietet einen etablierten methodischen Werkzeugkasten für eine prozessadäquate Modellierung und transparente Entscheidungsfindung.

## Quelle

Brenning, A. (2024). Evaluierung und Weiterentwicklung der Regionalisierungsverfahren zur Ausweisung nitratbelasteter Gebiete nach AVV GeA in Deutschland. TEXTE 67/2024, 54 pp. Umweltbundesamt, Dessau, Germany. Available online at <https://www.umweltbundesamt.de/publikationen/evaluierung-weiterentwicklung-der>
