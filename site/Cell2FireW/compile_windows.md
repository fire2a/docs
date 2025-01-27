---
layout: default
title: compiling with Visual Studio
nav_order: 3
parent: Cell2Fire++ simulator
has_children: false
has_toc: false
---
# Using Visual Studio to compile Cell2Fire for windows  
{: .no_toc}
<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

Tested on Microsoft Visual Studio Community 2022 (64-bit) - Version 17.6.5

## Preparation  

Get Visual Studio (Community), install Visual C++ Workflow  

Get these libraries (download & un7zip them into any desired location like `c:\dev`):  

- dirent-1.23.2 : https://github.com/tronkko/dirent/releases  
- boost 1.81.0 : https://boostorg.jfrog.io/artifactory/main/release/1.81.0/source/  
- eigen 3.4.0 : https://gitlab.com/libeigen/eigen/-/releases  

## Setup the solution project  

1. Open Visual Studio

1. If not found `repo/Cell2FireC/Cell2fire.sln`:  

	- Menu > File > New > Project from existing code  
	- Type : Visual C++  
	- Project file location: Cell2FireC  
	- Project name: Cell2Fire  

Open `Cell2Fire.sln` that should placed be next to `.h` and `.cpp` files  

{:style="counter-reset:none"}
1. MenuBar : Project > Properties
1. ComboBox : Configuration : Release (then repeat with Debug)
1. Configuration Properties  

	- General > Target Name : `$(ProjectName)`  
	- C/C++ > AdditionalIncludeDirectories : `C:\dev\dirent-1.23.2\include;C:\dev\boost_1_81_0\;C:\dev\eigen-3.4.0`  
	- C/C++ > Preprocessor > PreprocessorDefinitions : `_USE_MATH_DEFINES`  
	- Debugging > Command Arguments : `--input-instance-folder C:/...repos/C2FSB/data/Hom_Fuel_101_40x40/ --output-folder C:/.../results/`  
    - Linker > System > Subsystem : `Console (/SUBSYSTEM:CONSOLE)`

Adjust if they are not located at `C:\dev`?

## Compile  
### Debug phase
You can skip debug and go right to release if you haven't made any changes.  
Press play on `Local Windows Debugger`, if any correct mistakes until you see a command window with:  

```batch
------ Command line values ------
InFolder: C:\Users\ferna\source\fire2a\C2FSB\data\Hom_Fuel_101_40x40\
OutFolder: C:\Users\ferna\source\fire2a\C2FSB\data\Hom_Fuel_101_40x40\results
------------------Forest Data ----------------------

Forest DataFrame from instance C:\Users\ferna\source\fire2a\C2FSB\data\Hom_Fuel_101_40x40\Data.csv
Number of cells: 1600
```  

### Build Release 

1. Change Debug to Release (two comboboxes to the left from play button)  
1. MenuBar : Build > Configuration Manager  
  	- Project contexts (check the project configuration to build or deploy)  
  	- Configuration : Debug  
  	- Close  
1. MenuBar : Build > Clean Solution  
1. MenuBar : Build > Build Solution  

# Distribute

Move back the created `.exe` in `x64/Release` to original solution directory.  
Backup the original file.

# test run

Open a command prompt, input:

    > cd C2F
    > python main.py --input-instance-folder data\Homogeneous --output-folder data\Homogeneous\results --grids --final-grid --verbose --nsims 333

Should see the process `Cell2Fire` using various CPUs on the monitor app.
