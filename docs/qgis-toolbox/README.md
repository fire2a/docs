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
[Full guide here](/docs/docs/qgis-cookbook/README.html) or overview:
1. [QGIS] version > 3.28.12 (LTR version is mostly compatible but misses, for example, grouping simulation results; latest version is recommended)
2. fire2a-toolbox installation can *almost* be done straight forward from QGIS **[plugin manager]** *but*:
    - Python [dependencies][requirements.txt] must be manually resolved  
    - fire2a's plugin repo/store [link][toolbox-server] must be added as a custom plugin source (*)  

**Done!** *fire2a-toolbox icon <img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/bonfire.svg"  alt='icon-missing' style="height: 16px"> will appear on the algorithms list of the Processing Toolbox Panel*


(*) : Because it contains compiled c++ binary code -for Cell2Fire simulator, but binary code cannot be easily verified hence the plugin is not allowed on the [regular repo/store](https://plugins.qgis.org/). Nevertheless all our code is open source, its build is "reproducible" by an automated action; all can be audited on [fire2a@github](https://github.com/fire2a)

* **Testers** should instead install by `.zip` file from fire2a-toolbox [releases][toolbox-releases]
* **Developers** should clone our repos ([toolbox-repo], [c2f-repo], [fire2a-lib-repo]), compile cell2fire, symlink and setup additional python dependencies to contribute ([tl;dr](/docs/docs/Cell2Fire/README.html#unix-overview))

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

<video controls loop style="width: 95%;">
  <source src="./img/algo_sim-first_run.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

# Deployed algorithms

**Fire Analytics Toolbox** <img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/bonfire.svg"  alt='icon-missing' style="height: 16px">

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/forestfire.svg"  alt='icon-missing' style="height: 16px">
: [(Cell2)Fire Simulator](./algo_simulator.html)

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/downloader.svg"  alt='icon-missing' style="height: 16px">
: (Simulator) Instances Downloader

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

**Simulator Post Processing (simpp)**

Bundle: all post processing combined for convenience

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/ignitionpoint.svg"  alt='icon-missing' style="height: 16px">
: Ignition Point(s)

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/bodyscar.svg"  alt='icon-missing' style="height: 16px">
: (Propagation) Fire Scar(s)

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/burntime.svg"  alt='icon-missing' style="height: 16px">
: Propagation Digraph

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/fireface.svg"  alt='icon-missing' style="height: 16px">
: Spatial Statistics, any of: Hit Rate Of Spread, Flame Length, Byram Fire Line Intensity, Crown Fire Scar, Crown Fire Fuel Consumption Ratio, Surface Burn Fraction

**simpp Risk Metrics**

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/dpv.svg"  alt='icon-missing' style="height: 16px">
: DownStream Protection Value

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/bc.svg"  alt='icon-missing' style="height: 16px">
: Betweenness Centrality

<img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/bodyscar.svg"  alt='icon-missing' style="height: 16px">
: Burn Probability

**Auxiliary**

Match AII Grid Rasters : Simplifies using gdal translate thrice, to clip extent, then resize and replace geotransform to match an ascii raster into another


---
[QGIS]: https://qgis.org

[requirements.txt]: https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/requirements.txt 
[requirements.dev.txt]: https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/requirements.dev.txt

[Scott&Burgan-dialog-server]: https://fdobad.github.io/qgis-processingplugin-template/plugins.xml
[Kitral simulator dialog-server]: https://fdobad.github.io/fire2am-kitral/plugins.xml 
[toolbox-repo]: https://www.github.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin
[c2f-repo]: https://www.github.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin
[fire2a-lib-repo]: https://www.github.com/fire2a/fire2a-lib


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
