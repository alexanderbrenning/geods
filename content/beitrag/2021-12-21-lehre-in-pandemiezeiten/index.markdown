---
title: "Lehre in Pandemiezeiten"
subtitle: 'Erfahrungen mit der automatisierten Erstellung von Moodle-Quizzen in R/exams für die Online-Lehre'
author: Alexander Brenning
date: '2021-12-21'
slug: lehre-in-pandemiezeiten
categories: ["teaching", "R", "literate programming"]
tags: ["exams", "moodle", "geostatistics"]
summary: 'Wie lässt sich das Literate Programming in R nutzen, um vielfältige Moodle-Quizze automatisiert aus Datenpools und Fragenschemata zu erzeugen?'
authors: ["Alexander Brenning"]
lastmod: '2021-12-21'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
draft: false
---

Anwendungsorientierte Übungsaufgaben, die gemeinsam mit den Studierenden bearbeitet und diskutiert werden, sind ein integraler Baustein der [Geoinformatik](https://www.uni-jena.de/msc_geoinformatik)- und Statistik-Ausbildung in den [geographischen Studiengängen](https://www.uni-jena.de/bsc_geographie) in Jena.

**Doch wie lassen sie sich in Pandemiezeiten in die asynchrone Online-Lehre retten?**

Um auch online umfangreiche Übungsmöglichkeiten mit direktem Feedback anbieten zu können, habe ich die Technik des *Literate Programming* mit [RMarkdown](https://rmarkdown.rstudio.com/) und dem fantastischen [`exams`-Package](http://www.r-exams.org/) genutzt ([Xie et al., 2018](https://bookdown.org/yihui/rmarkdown/); [Zeileis et al., 2014](https://doi.org/10.18637/jss.v058.i01)).
Hierbei werden Textschablonen automatisiert durch {{< icon name="r-project" pack="fab" >}}-Code mit Abbildungen und den Ergebnissen von Berechnungen gefüllt, um immer wieder neue, variierende Übungsaufgaben einschließlich Lösungen und Feedbacktexten zu erzeugen. Diese lade ich als Fragensammlungen nach Moodle hoch und erstelle mit ein paar Klicks ein Moodle-"Quiz" (siehe Abbildung oben).


# Pandemiesemester

Während der Pandemiesemester erzeugte ich mit dieser Methode für fünf Module über 200 einzelne Übungsaufgaben, die sich durch Randomisierung in zahllose alternative Varianten auffächern. Für mein Engagement erhielt ich den [LiP-Award der FSU](https://www.chemgeo.uni-jena.de/aktuelle+meldungen/lip-award+f%C3%BCr+alexander+brenning).

Die Aufgaben reichen von Einfachauswahl-Fragen bin hin zu mehrteiligen Komplexaufgaben. Häufig beziehen sie reale Übungsdatensätze ein, hier etwa die Temperaturverteilung in Kanada im Kontext der Geostatistik-Ausbildung im [M.Sc. Geoinformatik](https://www.uni-jena.de/msc_geoinformatik):

<img src="moodle-beispiel.jpg" width="75%" />

Die Studierenden nahmen die Online-Übungsmöglichkeiten gerne an und wünschten sich sogar eine weitere Ausweitung des Angebots. Ein bisschen Überzeugungsarbeit ist trotzdem manchmal erforderlich, da manche Studierende sich die Aufgaben gerne für die Klausurvorbereitung "aufheben" würden, anstatt sie gleich zu "verbrauchen"... Inzwischen gibt es aber zu vielen Themen genug Aufgaben, um vor der Klausur auch noch einen weiteren Satz Aufgaben spendieren zu können.

Natürlich verwende ich die Aufgabendatenbank auch zur Erstellung von Online- und Offline-Klausuren. Hierdurch stelle ich ein gleichbleibendes Anforderungsniveau sicher. Allerdings enthalten meine Klausuren stets zusätzlich Fragen mit frei zu formulierenden Antworten.


## Ausblick

In meiner Arbeitsgruppe erweitern nun auch meine Mitarbeiter [Florian Strohmaier](https://www.geographie.uni-jena.de/Strohmaier) und [Raphael Knevels](https://www.geographie.uni-jena.de/Knevels) das Aufgabenangebot systematisch. Raphael erprobt dabei im Rahmen eines [ALe](https://www.uni-jena.de/ALe)-Projekts für Innovation in der Lehre unter Anderem interaktive Darbietungsformen mithilfe von shiny-Apps in {{< icon name="r-project" pack="fab" >}}.

## Wie kannst Du selbst einsteigen?

Auf der [R/exams-Website](http://www.r-exams.org/) und in Youtube gibt es hervorragende Ressourcen, die dir den Einstieg in die Erstellung von Fragen und ihren Import nach Moodle für die eigene Lehre erleichtern.

*Welche Vorkenntnisse sind hilfreich, um komplexere Fragen mit R/exams zu erstellen?*

- **RMarkdown-Kenntnisse:** [RMarkdown](https://rmarkdown.rstudio.com/) ist nicht schwer, und es ist auch außerhalb der R/exams-Welt sehr nützlich - also höchste Zeit, sich das mal anzuschauen. In Kombination mit {{< icon name="r-project" pack="fab" >}} kann es dann doch manchmal etwas tricky werden, vor allem wenn man {{< icon name="r-project" pack="fab" >}}-Code, der in ein RMarkdown-Dokument eingebettet ist, mit `paste()`-Aufrufen versucht, für Markdown formatierten Text zu erzeugen... also am besten mit einfachen, bescheidenen Fragen beginnen! 
- **{{< icon name="r-project" pack="fab" >}}-Kenntnisse:** Das ist vor allem dann wichtig, wenn du anspruchsvolle Analysen in die Fragen einbauen möchtest - oben zum Beispiel eine gestatistische Semivariogramm-Analyse und Kriging-Interpolation mit dem `gstat`-Package. Leider kommen {{< icon name="r-project" pack="fab" >}}-Fehlermeldungen nicht in RStudio an, so dass die Fehlersuche sehr schwer sein kann. Am besten den Code vorher gut testen, oder die Ergebnisse abspeichern und sie in den R/exams-Frage dann nur `load()`en.

Also: Der beste Zeitpunkt, in RMarkdown und R/exams einzusteigen, ist genau jetzt! 😄


### Bibliographie

Xie, Y., Allaire, J.J., Grolemund, G. (2018). *R Markdown: The Definitive Guide*. Chapman and Hall/CRC. <https://bookdown.org/yihui/rmarkdown/>

Zeileis, A., Umlauf, N., Leisch, F. (2014). Flexible generation of e-learning exams in R: Moodle quizzes, OLAT assessments, and beyond. *Journal of Statistical Software*, 58(1), 1-36. <https://doi.org/10.18637/jss.v058.i01>

<img src="https://vg09.met.vgwort.de/na/8fa628beea99428491ed734413e72738" width="1" height="1" alt="">
