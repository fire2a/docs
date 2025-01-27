---
layout: default
title: Data preparation
parent: Cell2FireW simulator
nav_order: 1
has_children: false
has_toc: false
---

{: .success}
Real, validated and ready to use instances available using "instance downloader" algorithm of our [Fire Analytics Toolbox QGIS plugin](/qgis-toolbox)

tl;dr:
- _At least you need to map the fuels of a landscape and the wind speed and direction per hour_
- Supported raster formats: `AAIGrid` (.asc) and `GeoTiff` (.tif -partially supported)
- Wind data goes in a `Weather.csv` (with other weather parameters)
- All input data must be put in the same directory with standarized names

# Rasters
- All rasters [and qgis-project] must be projected in the same CRS, in squared meters
- `AAIGrid` (.asc) raster format is fully supported unlike `GeoTiff` (.tif) that only reads a `fuels.tif` raster (ignoring the rest, still on development)
- When using QGIS, there's a sanity check: 
  - Using the fuel raster as base, rasters must match
  - In number of pixels in both direction
  - At most one pixel offset in each direction
  - Hence pixel size must be very close [~mm]

| rasters | purpose | units |
| --- | --- | --- |
| fuels | encode landscape | fuel model table |
| elevation | dem data elevation model | meters |
| cbh | canopy base height is where the lowest branch is | meters |
| cbd | canopy bulk density | kg/m3 |
| ccf | canopy cover fraction is like cloud cover indicator | [0,1] |
| hm | canopy top height | meters |
| py | probability density map is to draw ignitions | [0,1] |

<a href="#top">back to top</a>
{: style="text-align: right;"}

# Fuel model
To encode the landscape in the simulator, you'll need to map the fuels according to one of the 3 supported models:
- [Spain or Scott&Burgan](https://github.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/raw/refs/heads/main/fireanalyticstoolbox/simulator/spain_lookup_table.csv)
- [Chile or Kitral](https://github.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/blob/main/fireanalyticstoolbox/simulator/kitral_lookup_table.csv)
- [Canada or FBP](https://github.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/blob/main/fireanalyticstoolbox/simulator/fbp_lookup_table.csv)

These fuel model tables assign a type of fuel model or category to each pixel of the landscape using the integer map defined on the look up tables (.csv)

<a href="#top">back to top</a>
{: style="text-align: right;"}

# Weather
**Weather.csv table specification:**
* minimal columns: `name,timestamp,wind-speed,wind-direction`
* rows: by default each row lasts one hour
* fuel model dependant columns:

Canada
: `Scenario,datetime,APCP,TMP,RH,WS,WD,FFMC,DMC,DC,ISI,BUI,FWI`  

Kitral
: `Instance,datetime,WS,WD,TMP,RH`  

Scott&Burgan
: `Scenario,datetime,WS,WD,FireScenario`  

* FireScenario was deprecated by "Live & Dead Fuel Moisture Content Scenario [1=dry..4=moist]"
* There's no need to be consistent with the timestamps, but isoformat `YYYY-MM-DDTHH:MM:SS` should be followed
* WIP: unifying weather formats, relying on column names instead of order to read them

<a href="#top">back to top</a>
{: style="text-align: right;"}
