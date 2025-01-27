---
layout: default
title: user manual
nav_order: 1
parent: QGIS dialog DEPRECATED
---

        Fire 2 Advanced Analytics & Management Research Center,

            Fire Analytics Management
                (fire2am QGIS plugin)

                    USER GUIDE

# Getting the software
## Installation
1. Getting QGIS
2. Getting the plugin

## Files Preparation
#### 0. Formats:
 
- Locale is plain english without special chars (á, é, ... ñ)  
- Dates are isoformated (YYmmDD HH:MM:SS)  
- Spanish localized files using `,` as decimal separator, __must be replaced to `.`__  
    - Linux solution: `$ sed -i -e 's/,/\./g' *.asc`

#### 1. Project location:  
- File and folder names __must avoid the space character__ (also avoid cloud folders that modify your files without asking)  
- The safest is to start in a empty folder and save a new empty qgis project. _This will enable the 'Project Home' folder in the 'Browser' panel (to drag & drop things into)._  
- Setup its Coordinate Reference System (CRS):  
     - By clicking on the bottom right corner (left to the 'Messages' button that opens the very useful log panel btw) world icon  
     - Or by `Menu > Project > Properties > CRS (on the vertical left tab)`  
     - Or keyboard shortcut `Ctrl+Shift+P`  

    Known used CRSs:
     - PREVINCAT : UTM 31N ETRS89
     - Chile North : PSAD56 / UTM zone 19S
        
#### 2. Instance Rasters:  
- All layers must be ascii AAIGrid formatted .asc files with matching CRS, extent and resolution. _Use QGIS processing algorithm clip to polygon if they don't match!_  

- The header (first 6 lines) for asc files __must have 1 space__ between its data, i.e., `ncols 40` not `ncols    40`
    - _This happens on PREVINCAT data_
    - Linux solution `$ sed -i -e '1,6 s/\s\+/ /g' *asc`

1. Copy the ascii raster files into the 'Project Home' folder  
2. Drag and drop from 'Project Home' (Browser panel) into the 'Layers panel'  
3. Set up the proper CRS for each layer by: `Select layer(s) > 2dary click > 'Set CRS...'`  
    
__Expect errors if layers and project CRS are not set!__

#### 3. Weather files:
Cell2Fire simulator currently support a single wind direction and speed for the whole grid. This vector can change overtime and between scenarios.
- There are two flavors: whether a single `Weather.csv` file or a folder with sequentially numerated `Weather/Weather1..N.csv` files.  

    Headers: Instance,datetime,WD,WS,FireScenario  
    Instance: any string  
    datetime: YYYY-mm-DD[T]HH:MM:SS format HOURLY spaced!!  
    Wind Direction: 0-359 integer  
    Wind Speed: positive integer  
    FireScenario: integer (deprecated?)  

- Datetimes are used for timestamping the fire evolution polygons (isochrones or animation frames) on single fire simulations, so hourly separated data is recommended (if you use the same value for two rows, the animation won't work at post processing, but the simulation will be fine)  
- For PREVINCAT `.wnd` files a reformater script is provided on [extras folder](). Usage example:
```
python3 wnd2Weathercsv 40_10032007.wnd
```

## Usage
#### 1. Run the Fire2am dialog window by:  
1.1 Clicking on the fire2am icon ![icon](img/icon.png), on the Plugins Toolbar  
1.2 `Menu > Plugins > Fire Simulator Analytics Management > setup and run a forest fire simulation`  
        The other menu item is for advanced tinkering of setup of parameters, not documented!  

#### 2. The dialog will appear, its layout in tabs:  
2.1 Represents the workflow phases:  
        - Instance setup: Layers and options for Landscape, Ingnitions and Weather  
        - Run: simulator ouput window with control buttons  
        - Results: Tables and plots (data that is not spatial)  
        - Optional Rules: Such as number of cpu threads  
        
2.2 Buttons:  
       - 'Restore Defaults' : Resets all changes, implemented because they are _persisted even if you accidentally close the dialog! (including with the simulation running on the background)_  
       - 'Run', 'Kill', 'Terminate' are for managing the simulation  
       
#### 3. Running the simulator  
When pressing 'Run' the following phases are executed:  
        i. All user interface selections are gathered, compared with the simulator defaults and a a command line options string is generated (these arguments are overriden by the 2dary developer dialog if opened)  
        ii. A folder named 'Instance_YY_mm_DD_HH_MM_SS' is made, where all files for reproducing the simulation are copied. Can be renamed after finishing the simulation (just beware updating loaded layer's file sources paths)  
        iii. The simulator is ran as an external QProcess (emulating a command line call), where all outputs are displayed on the "Run" tab  
        iv. After finishing calling cell2fire, a `results` folder inside the `Instance_<timestamp>` folder is made:  
            a. At this stage, almost all spatial outputs are stored inside `outputs.gpkg` so the csv files can be deleted  
            b. If a single fire was ran, its evolution is added to the current project  
            c. Else if multiple fires were ran, the burn mean probability is added to the current project.  
            
### Detailed instance setup  
#### Landscape  
The first tab of the dialog, provides layer combo boxes with all available layers added to the project (not files in the project folder!), for selecting:
    - 'Surface fuel model SB'  
    - 'Elevation'  
    - 'Canopy Base Height'  (can be set to none)  
    - 'Canopy Bulk Density'  (can be set to none)  
    - 'Canopy Cover Fraction'  (can be set to none)  

_Again, make sure they're AAIGrid ascii formated files, they have the same CRS and extent._  

Also, on the first opening of the dialog, the plugin will try to match the available layers using it's names:  
        - 'Surface fuel model SB' : Any layer that has 'model' and 'asc' (ordered) in its name ~ 'model.*asc'. Or [Ff]uel  
        - 'Elevation' : 'mdt.*asc' or [Ee]levation  
        - 'Canopy Base Height' : '^cbh' (name starts with cbh)  
        - 'Canopy Bulk Density' :'^cbd'  
        - 'Canopy Cover Fraction' : '^ccf'  

#### Ignition  
The second tab of the dialog, sets the ignition model options for the simulation. Its main setting is the `Number of simulations to run` if set to one only one simulation will be run and the isochrones will be returned; else various simulations will be ran and the probability heat map will be calculated.  
The ignition point can be setup as:  
    - Picked at random, drawing from a uniform probability distribution  
    - Picked at random using a spatial probability distribution raster layer (each cell with values between 0 to 1)  
    - Set by a single point from a vector layer (can be of any type GeoPackage, Shapefile, SpatiaLite or temporary scratch layer). This last option additionally has the 'adjacency radius' that enables igniting many fires in a delimited area.  

#### Weather  
The third tab of the dialog, enables selecting the weather for the simulation.  
Its main setting is the weather file type provided by selecting its radio button:  
    - Constant: enables the creation 'on the fly' of a weather file; selecting the wind speed, direction and lenght (by number of rows=hrs) of the created file  
    - Single csv: provides a file selector. Can be anywhere and any file with the csv extension, will be copied and renamed to Weather.csv. Header consistency is checked.  
    - Scenario folder: provides a folder selector. Can be anywhere but must contain sequentialy numerated Weather1..N.csv files, header consistency is not checked at this time. The folder is copied as is.  

Additional option are:  
    - The Coeficient of variation for (normal distribution) Rate of Fire Spread: That emulates wind Gusts (example 0.3)  
    - Surface Moisture Content Scenario: a integer number between 1 and 4, default 3  
    - Foliar Moisture Content Percentage: a integer number between 0 200, default 100  
    
#### Run  
This tab enables running the cell2fire simulator, showing its "live" output on the text area provided by the dialog. Providing:  
    - 'Run' : starts the process  
    - 'Terminate' and 'Kill' : two level of priority for aborting the process while it runs.  
A typical run outpus:
```


```
It is normal for small number of simulations (<100) that the time spent in Cell2Fire can be even less than the postprocessing!

# Known Bugs 
1. Closing the project with the dialog open crashes the plugin!

