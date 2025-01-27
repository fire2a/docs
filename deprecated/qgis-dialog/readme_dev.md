---
layout: default
title: expert dialog
nav_order: 2
parent: QGIS dialog DEPRECATED
---

# Developer guide

## The developer dialog

The plugin includes a secundary dialog with the icon ![img/icon_dev.png](img/icon_dev.png); that works entagled to the main simulator dialog.  
This dialog reads Cell2Fire's argument parser directly and exposes all of them in a tree view, enabling the following:  
- Easy selection and modification of all simulator parameters (by selecting its checkbox and modifying its value) overriding the normal dialog options.  
- A load and save button to persist the working configuration in the project's home folder by a pickle.dump file.  
- A text display showing how the selected command line argument looks according to the user selection  
- A checkbox enabling auto copying the selected command into the clipboard (note this is not enabled by default because has a noticeable visual refresh performance detriment)  
- A folder selection widget to change which Cell2Fire simulator will be used
- A way of overriding the normal Run command that creates a Instance folder with a copy of all data; this can be achieved by specifying the input and output folder, and then instead of pressing Run, press the [dev] button (nexto to kill and terminate ,on the Run tab of the normal dialog)

## Main routes of experimenting

- pyqgis: Open the python console, use the provided `extras/qgis_sandbox.py` to test commands  
- IPythonQgis : Install the IPython Console plugin (`pip install qtconsole` is required)  
- qgis plugin: The easiest way to get up to speed with developing QGIS plugins is using the 'Plugin Builder' plugin and build a template.  
- cell2fire: Run the included examples, visit https://github.com/fire2a 

## Clone instead of installing
The plugin and the simulator are developed in different repos so cloning both repos with one as a submodule is suggested  

    # 0. QGIS >=3.1 LTR installed (opened once else the following directory won't exist)

    # 1. 
    cd ~/.local/share/QGIS/QGIS3/profiles/default/python/plugins

    # 2. 
    git clone git@github.com:fdobad/fire2am-qgis-plugin.git fire2am
    or 
    git clone git@github.com:fdobad/fire2am-kitral.git fire2am

    # 3. (optional) submodule
    cd fire2am
    rm -r C2FSB
    git submodule init
    git submodule add git@github.com:fire2a/C2FSB.git C2FSB
    cd C2FSB
    git pull
    cd ..

    # 4. (Optional) virtual environment : Remember to activate it every time
    python3 -m venv --system-site-packages ~/pyenv/pyqgis
    echo 'alias pyqgis="source ~/pyenv/pyqgis/bin/activate"'>>~/.bashrc
    echo 'alias qgis="source ~/pyenv/pyqgis/bin/activate && qgis"'>>~/.bashrc
    bash
    pyqgis

    # 5.
    pip install --upgrade pip wheel setuptools
    pip install -r requirements.txt

    # 6. Compile
    cd C2FSB/Cell2FireC
    sudo apt install g++ libboost-all-dev libeigen3-dev
    make
     
    # If it fails check where your distribution installs eigen. Because the `makefile` assumes `EIGENDIR = /usr/include/eigen3/`  
    # Locate it with `nice find / -readable -type d -name eigen3 2>/dev/null`  
    # Then edit `makefile` accordingly & try again.  

## 1. Object Naming Convention
To coordinate `C2FSB/Cell2Fire/ParseInputs.py`, QtDesigner and the plugin code (start at `fire2am.py`), the following standard must be followed: 

Mostly when adding components in QtDesigner their object name is assigned `classType_n`, so you must change its `objectName` to `prefixName_destName`.  

1.1 Prefix simplified component type: 

| prefixName	| 	`<class type>` |
| --- | --- |
| layerComboBox	|	QgsMapLayerComboBox |
| fileWidget	|	QgsFileWidget |
| radioButton	|	QRadioButton |
| spinBox	|	QSpingBox |
| doubleSpinBox	|	QDoubleSpingBox |

1.2 Suffix, `destName` is the same used in `ParseInputs.py` by the `argparse` object:

| suffixName 	|	`<argparse.item.dest>` |
| --- | --- |
| ROS_CV	|	ROS_CV |

1.3 The results is that the ui values can be easily retrieved. For example for double|spinBoxes (example: doubleSpinBox_ROS_CV):

        args.update( { o.objectName()[ o.objectName().index('_')+1: ]: o.value() 
            for o in self.dlg.findChildren( (QDoubleSpinBox, QSpinBox), 
                                        options= Qt.FindChildrenRecursively)})

1.4 RadioButton Groups share the same startin suffix name, then camel Uppercase distinctions:  

	radioButton_weatherFile, 
	radioButton_weatherFolder, 
	radioButton_weatherRandom, 
	radioButton_weatherConst
	
	radioButton_ignitionRandom, 
	radioButton_ignitionPoints, 
	radioButton_ignitionProbMap

## 2. adding new resources
### compile resources if new icons added
```
sudo apt install pyqt5-dev-tools
cd img
pyrcc5 -o resources.py resources.qrc
```
### Qt Designer bug when adding a resource
If the plugin won't start after adding a resource with `No module named 'resources_rc'`.
Delete the line in between 
```
 <resources>
  <include location="resources.qrc"/>
 </resources>
```
Ref: [broken plugin](https://gis.stackexchange.com/questions/271848/the-plug-in-is-broken-no-module-named-resources)

## 3. Cell2fire python developer tips
- use print('...', flush=True) for rasing the message to the gui
- never use import *
- prefer np.loadtxt over pd.read_csv

## 4. References
### Required
- [qgis docs](https://docs.qgis.org/latest/en/docs/index.html)
- [pyqgis api](https://www.qgis.org/pyqgis/master/index.html)
- [qgis developer cookbook](https://docs.qgis.org/latest/en/docs/pyqgis_developer_cookbook/intro.html)
- [PyQt5.QtWidgets](https://www.riverbankcomputing.com/static/Docs/PyQt5/api/qtwidgets/qtwidgets-module.html)
### Plugin specific
- [tutorial](https://gis-ops.com/qgis-3-plugin-tutorial-plugin-development-reference-guide/)
- [minimal plugin repo](https://github.com/wonder-sk/qgis-minimal-plugin)
- [plugin debugger](https://github.com/wonder-sk/qgis-first-aid-plugin)
- [videoTutorialPluginBuilder](https://opensourceoptions.com/lesson/build-and-deploy-a-plugin-with-plugin-builder-and-pb_tool/)
- [pb_tools build tools](https://github.com/g-sherman/plugin_build_tool)
- [homepage](https://plugins.qgis.org/)
- [no binaries!!](https://plugins.qgis.org/publish/)
- [windows python packages?](https://landscapearchaeology.org/2018/installing-python-packages-in-qgis-3-for-windows/)
- [windows python packages ugly](https://www.lutraconsulting.co.uk/blog/2016/03/02/installing-third-party-python-modules-in-qgis-windows/)
### qgis
- [gisops](https://gis-ops.com/qgis-3-plugin-tutorial-background-processing/)
- [gis.ch](https://www.opengis.ch/2018/06/22/threads-in-pyqgis3/)
- [core developer tips](https://woostuff.wordpress.com/)
- [core developer tips](http://nyalldawson.net/)
- [workshop](https://madmanwoo.gitlab.io/foss4g-python-workshop/)
- [custom processing script](https://madmanwoo.gitlab.io/foss4g-python-workshop/processing/)
- [qgisblog](https://kartoza.com/search?q=qgis)
