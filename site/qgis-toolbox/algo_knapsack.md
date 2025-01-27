---
layout: default
title: Raster knapsack optimization
nav_order: 2
has_children: false
has_toc : false
parent: QGIS Fire Analytics Toolbox
---
## Raster knapsack optimization
### Intro
_A proof-of-concept integration of mathematical programming solvers to model and solve optimization problems with GIS entities._

Users can create a new raster layer that selects the most valuable pixels in a raster, according to a capacity constraint defined by another -optional- raster and a fractional ratio.

Several solvers can be used (cbc, glpk, cplex_direct, gurobi, ipopt, NEOS, etc.), thanks to the MIP being modeled and solved through [pyomo](http://www.pyomo.org).

Before running this algorithm, make sure that you have installed the corresponding solvers that you want to use. See [pyomo documentation](https://pyomo.readthedocs.io/en/stable/installation.html#conditional-dependencies) for more  details.

| screenshot |
| --- |
|<img src="img/algo_knapsack_screenshot.png"  alt='cannot load image' height=400px >|

### Detailed description
By selecting a Values layer and/or a Weights layer, and setting the bound on the total capacity, a layer that maximizes the sum of the values of the selected pixels is created.

The capacity constraint is set up by choosing a ratio (between 0 and 1), that multiplies the sum of all weights (except no-data). Hence 1 selects all pixels that aren't no-data in both layers.

This raster knapsack problem is NP-hard, so a MIP solver engine is used to find "nearly" the optimal solution, because -often- is asymptotically hard to prove the optimal value. So a default gap of 0.5% and a timelimit of 5 minutes cuts off the solver run. The user can experiment with these parameters to trade-off between accuracy, speed and instance size(*). On Windows closing the blank terminal window will abort the run!

By using Pyomo, several MIP solvers can be used: CBC, GLPK, Gurobi, CPLEX or Ipopt; If they're accessible through the system PATH, else the executable file can be selected by the user.

Installation of solvers is up to the user, although the windows version is bundled with CBC unsigned binaries, so their users will face a "Windows protected your PC" warning, please avoid pressing the "Don't run" button, follow the "More info" link, scroll then press "Run anyway".

(*): Complexity can be reduced greatly by rescaling and/or rounding values into integers, or even better coarsing the raster resolution (see gdal translate resolution).
