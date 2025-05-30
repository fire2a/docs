---
layout: default
title: Firebreak location with Protected Areas
nav_order: 3
has_children: false
has_toc : false
parent: QGIS Fire Analytics Toolbox
---
## Decision optimization of firebreaks with untreatable protected areas

{: .info}
*It's recommened to be familiar with the simpler [raster knapsack](./algo_knapsack.html) first*

### Description

This algorithm is an extension of the [raster knapsack](./algo_knapsack.html) algorithm, which allows for the inclusion of protected areas (e.g., biodiversity conservation areas, natural sanctuaries, wilderness refuge, etc.) that cannot be treated. The algorithm optimizes the placement of firebreaks while respecting these protected areas.

There are two flavors or ways to achieve this:
1. Make the protected area unselectable by the optimization engine
2. Run the optimization twice to reasign what would've been selected inside the protected area into the borders of it
3. (unplanned future) an explicit MIP that constrains equating total border selection to protected selection and weights this agains normal selection

To run it, you'll need 3 rasters and a budget:
1. A values layer (the higher the value the more important the area, can include negative)
2. One cost (or weight) layer (For example they can be proportional to the slope to represent that a steeper slope is more expensive to treat)
3. A total budget number; represented as a % of the total sum of the cost layer
4. One protected area layer. Must be a binary layer where 1 is protected area and 0 isn't.
On the special case all weights are equal, the cost represents treated area

### Portezuelo case study

In the following video a full case study is performed where:

1. The protected area raster is hand made using the serval plugin
2. The values layer is made using the risk metric Downstream Protected Value:
    - Using values created as a normally distributed random valued raster, but then multiplying the protected areas by 100 to make them more important
    - Using 300 random ignited fire simulations for the fire paths (messages)
3. The cost layer is ommited, defaulting to a equal cost layer representing treated area. a 15% budget is used, which is 15% of the total area.
4. The protected area flavor of border selection is used
5. The gurobi solver is used, but the same can be done with the open source solver (but slower)

<video controls loop style="width: 95%;">
  <source src="./img/algo_knapsack_pa.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>


