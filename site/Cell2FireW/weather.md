---
layout: default
title: Wind direction
parent: Cell2FireW simulator
nav_order: 2
has_children: false
has_toc: false
---

# Wind direction 
How wind direction should be indicated in weather files depends of which version of the simulator or QGIS plugin you use.

## Wind direction in Cell2FireW version 1.0.0 or greater

Following the meteorological standard, wind direction is indicated by the direction from which the wind originates. For example, a north or northerly wind blows from the north to the south. The wind direction is measured in degrees, from 0º to 360º, rotating clockwise in the horizontal plane. 

* Values close to 0º and 360º indicate north wind
* 90º indicate east wind
* 180º south wind
* 270º west wind.

## Wind direction in Cell2FireW versions prior to 1.0.0

In previous versios of Cell2FireW, the wind direction was dictated by the direction towards which the wind is blowing.
It is also measured in degrees from 0° to 360°, rotating clockwise in the horizontal plane, but 0° means "South".

* Values close to 0° or 360° indicate south wind
* 90° indicate west wind
* 180° north wind
* 270° east wind 


| Metereological | Cell2FireW | 
| --- | --- |
| ![meteo](img/meteo_angulos.png)| ![angulos](img/Cell2Fire_angulos.png)  |


