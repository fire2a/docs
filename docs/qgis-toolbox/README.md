---
layout: default
title: QGIS Fire Analytics Toolbox
nav_order: 1
has_children: true
has_toc : false
---
<h1>
Fire Analytics Toolbox
</h1>
{: .no_toc}
<details closed markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>
# Overview
Our applied fire research as **user friendly graphical GIS tools**:
- *Simulate* large scale wildfires using Cell2Fire++
- Get threat and risk *metrics*
- Use the firebreak location *decision support system*
- *Combine* our algorithms with any other [QGIS] algorithms easily

Without leaving the graphical environment of [QGIS], just by installing our **processing algorithm plugin** *fire2a-toolbox*.

This type of plugins differ from the regular plugins -by being much more than a pop-up dialog- because they follow a data-science-pipeline architecture. 
Clearly delimites: inputs, outputs, algorithms and contexts; achieving seamless integration with all other provided algorithms in the [toolbox], providing 5 ways of being run.

# Usage alternatives
1. Simple as *filling a **[form dialog]*** (checkboxes, dropdowns, file-choosers, etc.); with the minimal inputs being a fuel raster and a weather scenario. 
2. **[Batch of forms]**: Execute sequential runs configuring them in data-sheet-style where each row is one (column-wise displayed) form, *easily experiment parameter sensitivities*.
3. As part of a **[graphical model] workflow**: Drag and drop boxes of parameters and algorithms, conect arrows as input-ouputs between them, into a [custom] *GIS-data-science-pipeline*.
4. From a **command line tool**, run `qgis_process` [cli wrapper] to call any processing algorithm *without QGIS graphical overhead*.
5. **Python script**, working *both* [calling it] from the QGIS [python console] *or* as [standalone code]

# Installing
[Full guide here](/docs/docs/qgis-cookbook/README.html) or overview (with video):
1. Install [QGIS] latest version 
   - Support >= 3.36.1 
   - CPLEX Solver in Windows? Stick to 3.36.1 version, read [this now](/docs/docs/qgis-cookbook/README.html#setup-cplex-solver)

1. Add fire2a's [plugin store URL][toolbox-server] as a custom plugin source
   - `QGIS menu > Plugins > Manage and Install Plugins > Settings > Add > paste the URL > Ok`
   - _Why custom? Audit our [binaries](https://github.com/fire2a/C2F-W/actions)_

1. Click "Not installed" tab, search "fire", select and install "Fire Analytics Processing-Toolbox"

1. Accept on the dialog asking permission to install the plugin's python dependencies (if needed)
   - _Save any open work before installing/updating the plugin. Installing & reloading dependencies on the fly_ __could crash QGIS__
   - You can deny and disable this check, that happens every time the plugin is loaded. ([Manually][fire2a-lib-pypi] install [them](https://github.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/blob/b7af87e35a021005a3d55f7d0d802431296ef196/fireanalyticstoolbox/dependencies_handler.txt#L2))
   - Restart QGIS if any install or reloading doesn't succeed (details at: Log Messages > Plugins)
   - Toggle the plugin checkbox (left of <img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/forestfire.svg" style="height: 16px"> its icon on the Manager list) if it doesn't appear immediately on the Processing Toolbox Panel

**All Done!** On the Processing Toolbox Panel, look for "<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/bonfire.svg"  alt='icon-missing' style="height: 16px"> Fire Analytics"

<video controls loop style="width: 95%;">
  <source src="./img/installation.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

# First test run
(Check the video at the end!) Getting or generating a fuel model raster can be challenging (tutorial coming soon), so the simplest way is to:
1. Use the downloader algorithm <img src="./img/downloader.svg"  style="height: 16px"> to get a prepared instance
2. Save an empty [project] into the downloaded folder (where fuels, elevation and Weather.csv files are)
3. Drag and drop layers from the project home (file Browser Panel) into the Layer Panel
4. Set the same CRS to the layers and project (any in meters suffices)
5. Open the simulator algorithm <img src="./img/forestfire.svg"  style="height: 16px">, select the proper fuelmodel (Canada, Kitral or S&B), select the fuel layer in the fuel dropdown, press run.

<a name="anchor"> </a>
<video controls loop style="width: 100%;">
  <source src="./img/first_run.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

Note: Step 2 can be skipped but it is cumbersome to select each layer from file explorers than to use the dropdown to select between current loaded layers; Also `Weather.csv` is automatically selected when there's a saved project.

# Deployed algorithms

## **<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/bonfire.svg"  alt='icon-missing' style="height: 24px"> Fire Analytics Toolbox** 

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/forestfire.svg"  alt='icon-missing' style="height: 16px">
: [**Cell2 Fire Simulator**](./algo_simulator.html)

**Utils**

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/downloader.svg"  alt='icon-missing' style="height: 16px">
: Simulator **Instances Downloader**, gets ready to simulate instances

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/match_aii.svg"  alt='icon-missing' style="height: 16px">
: **Match AII Grid** Rasters: Simplifies using gdal translate thrice, to clip extent, then resize and replace geotransform to match an ascii raster into another

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/meteo.svg"  alt='icon-missing' style="height: 16px">
: **Meteo**: Simplifies creating Chilean -Kitral fuel model compatible- weather files

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/polygonize.png"  alt='icon-missing' style="height: 16px">
: **Polygonize weighted rasters**: A pipeline for creating polygons from multiple raster layers; with nodata and scaling strategies, categorical rasters handling and weight attribute. [algorithm][fire2a-lib-clustering-docs]

**Simulator Post Processing (simpp)**

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/cog.svg"  alt='icon-missing' style="height: 16px">
: **Bundle**: all following algorithms combined for convenience

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/ignitionpoint.svg"  alt='icon-missing' style="height: 16px">
: **Ignition Point(s)**: reads the ignition history file from the simulator outputs, creates a point layer

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/bodyscar.svg"  alt='icon-missing' style="height: 16px">
: **Fire Scar(s)**: reads the csv.Grids files from the simulator outputs, creates: final scars raster layer, propagation scars polygons & burn probability

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/burntime.svg"  alt='icon-missing' style="height: 16px">
: **Propagation Digraph**: reads the csv.Messages files from the simulator outputs, creates a directed graph of the fire propagation, each arrow labeled with the time spread

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/fireface.svg"  alt='icon-missing' style="height: 16px">
: **Spatial Statistics**:, any of: Hit Rate Of Spread, Flame Length, Byram Fire Line Intensity, Crown Fire Scar, Crown Fire Fuel Consumption Ratio, Surface Burn Fraction

**Simulator Risk Metrics**

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/dpv.svg"  alt='icon-missing' style="height: 16px">
: **DownStream Protection Value**

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/bc.svg"  alt='icon-missing' style="height: 16px">
: **Betweenness Centrality**

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/bodyscar.svg"  alt='icon-missing' style="height: 16px">
: **Burn Probability**,  a subset of the fire scar algorithm

**Decision optimization**

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/firebreakmap.svg"  alt='icon-missing' style="height: 16px">
: [Raster knapsack optimization](./algo_knapsack.html)

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/firebreakmap.svg"  alt='icon-missing' style="height: 16px">
: Polygon knapsack optimization : Optimizes the classical knapsack problem using polygons with values and/or weights attributes, returns a polygon layer with the selected polygons.

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/firebreakmap.svg"  alt='icon-missing' style="height: 16px">
: Polygon treatment optimization : Using possible treatments for each polygon, Maximize the changed value of the treated polygons

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/firebreakmap.svg"  alt='icon-missing' style="height: 16px">
: Raster treatment optimization : Maximize the changed value of the treated raster, deciding which treatment to apply to each pixel (or no change), subject to budget and area constraints

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/firebreakmap.svg"  alt='icon-missing' style="height: 16px">
: Raster treatment & teams optimization : Maximize the changed value of the treated raster, deciding which treatment to apply by which team to each pixel (or no change), subject to budget, area constraints and team capabilities

{: .warning}
By default QGIS limits the processing algorithms log to about 5000 lines. In the rare case you really need the full log, see running in the console

---
[QGIS]: https://qgis.org

[requirements.txt]: https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/requirements.txt 
[requirements.dev.txt]: https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/requirements.dev.txt

[Scott&Burgan-dialog-server]: https://fdobad.github.io/qgis-processingplugin-template/plugins.xml
[Kitral simulator dialog-server]: https://fdobad.github.io/fire2am-kitral/plugins.xml 
[toolbox-repo]: https://www.github.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin
[c2f-repo]: https://www.github.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin
[fire2a-lib-repo]: https://www.github.com/fire2a/fire2a-lib
[fire2a-lib-requirements]: https://github.com/fire2a/fire2a-lib/blob/d6a08bd78ba1388e6548170ebfcc20077eff7f5e/pyproject.toml#L20
[fire2a-lib-pypi]: https://pypi.org/project/fire2a-lib/
[fire2a-lib-clustering-docs]: https://fire2a.github.io/fire2a-lib/fire2a/agglomerative_clustering.html


[graphical model]: https://docs.qgis.org/latest/en/docs/user_manual/processing/modeler.html
[toolbox]: https://docs.qgis.org/latest/en/docs/user_manual/processing/toolbox.html
[form dialog]: https://docs.qgis.org/latest/en/docs/user_manual/processing/toolbox.html#the-algorithm-dialog
[Batch of forms]: https://docs.qgis.org/latest/en/docs/user_manual/processing/batch.html#processing-batch
[cli wrapper]: https://docs.qgis.org/latest/en/docs/user_manual/processing/standalone.html
[python console]: https://docs.qgis.org/latest/en/docs/user_manual/plugins/python_console.html#console
[calling it]: https://docs.qgis.org/latest/en/docs/user_manual/processing/console.html
[standalone code]: https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/script_samples/standalone.py
[custom]: https://github.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/tree/main/graphical_models
[plugin manager]: https://docs.qgis.org/latest/en/docs/training_manual/qgis_plugins/fetching_plugins.html

[toolbox-server]: https://fire2a.github.io/fire-analytics-qgis-processing-toolbox-plugin/plugins.xml
[toolbox-releases]: https://github.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/releases
[project]: https://docs.qgis.org/3.28/en/docs/user_manual/introduction/project_files.html

[forestfire]: https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/forestfire.svg
