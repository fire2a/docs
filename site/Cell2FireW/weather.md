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

Following the <b>meteorological standard, wind direction is indicated by the direction from which the wind originates</b>. For example, a north or northerly wind blows from the north to the south. The wind direction is measured in degrees, from 0º to 360º, rotating clockwise in the horizontal plane. 

<div style="text-align: justify;">
  <table>
    <tr>
      <td style="text-align: center;"><img src="img/meteo_angulos.png" alt="meteo" width="50%"></td>
      <td style="text-align: center;"><br>Values close to 0º and 360º indicate north wind<br>90º indicate east wind<br>180º south wind<br>270º west wind.</td>
    </tr>
    </table>
</div>

## Wind direction in Cell2FireW versions prior to 1.0.0

In previous versions of Cell2FireW, the wind direction was dictated by the direction <b>towards</b> which the wind is blowing.
It is also measured in degrees from 0° to 360°, rotating clockwise in the horizontal plane, but 0° means "South".

<div style="text-align: justify;">
  <table>
    <tr>
      <td style="text-align: center;"><img src="img/Cell2Fire_angulos.png" alt="meteo" width="50%"></td>
      <td style="text-align: center;"><br>Values close to 0º and 360º indicate south wind<br>90º indicate west wind<br>180º north wind<br>270º east wind.</td>
    </tr>
    </table>
</div>

