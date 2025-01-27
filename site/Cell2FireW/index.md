---
layout: default
title: Cell2Fire++ simulator
nav_order: 2
has_children: true
has_toc: false
---
{: .warning}
CLI C++ code; Check the graphical user friendly version: [fire2a toolbox](docs/qgis-toolbox/README.html)
# Cell2Fire++
{: .no_toc}
<details closed markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

Cell2Fire is a 2D-grid-based forest and wildland landscape fire simulator, focused on large scale areas and fast simulations to provide robust risk spatial analytics, harnessing c++ parallel computation methods.

Current Version:
- [W](https://github.com/fire2a/c2f-w) bundles all three fuel model behaviors!

Released flavors (*no longer maintained*):
- [Scott & Burgan](https://github.com/fire2a/C2FSB)
- [Kitral](https://github.com/fire2a/C2FK)
- [FBP](https://github.com/fire2a/C2FFBP)

The [OG](https://github.com/cell2fire/Cell2Fire/)

# Output examples

## Scott & Burgan
### Previncat's Zone 60 (Catalonian Instance): forest and a simulated fire spread with its corresponding scar and growth propagation tree. 
![Example-Instance_Scar](img/c2fsb-example-scar.png)
### Risk metrics: Burn Probability (BP), Betweenness Centrality (BC), Downstream Protection Value (DPV), and Growth Propagation Tree (GPT). 
![Example-Risck_Metrics](img/c2fsb-example-metrics.png)

## Kitral
### El Portillo, simulation with crown fire behavior.
![Example-El Portillo-Crown fire](img/c2fk-El_portillo.png)

## Canadian Forest Fire Behavior Prediction System

|:-------------|:------------------|
| Dogrib forest, Canada ![](img/c2fFBP-Example4.png){: width="100%" } | shortest paths propagation ![](img/c2fFBP-Example1.png){: width="80%" } |
| Shortest paths propagation and ROS intensity ![](img/c2fFBP-Example2.png){: width="100%" } | Burn-Probability ![](img/c2fFBP-Example3.png){: width="80%" } |


# Compiling
Releases are bundled with pre-compiled binaries, normal users probably don't need this guide.

Check the [repo's action artifacts](https://github.com/fire2a/C2F-W/actions) for the latest info on automated builds

## UNIX Overview
```bash
# install build-essentials, gcc-12, boost, eigen3 & openmp

cd
git clone git@github.com:fire2a/C2F-W.git

# go to c++ files
cd C2F-W/Cell2FireC

# clean & build [select platform makefile]
make clean [-f custom_makefile]
make [-f custom_makefile]

```
### developer setup
```bash
# rename binary for the QGIS toolbox plugin
ext=`python3 -c "import platform;print(f'.{platform.system()}.{platform.machine()}')"`
cp Cell2Fire Cell2Fire$ext

cd
git clone git@github.com:fire2a/fire-analytics-qgis-processing-toolbox-plugin.git fire-toolbox

source ~/your/venv/bin/activate
(venv) $ pip install -r fire-toolbox/fireanalyticstoolbox/requirements.txt

git clone git@github.com:fire2a/fire2a-lib
cd fire2a-lib
(venv) $ pip install -e .

# symlink C2F-W repo into C2F directory of the fire2a-toolbox repo
ln -s C2F-W fire-toolbox/fireanalyticstoolbox/simulator/C2F

cd ~/.local/share/QGIS/QGIS3/profiles/default/python/plugins
ln -s ~/source/fire-toolbox/fireanalyticstoolbox .
```
Next time you start QGIS, look for fire2a-toolbox icon <img src="https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/assets/bonfire.svg"  alt='icon-missing' style="height: 16px">, on the Processing Toolbox panel.

## Linux
[Make](compile_linux.html)

## Macos
[Make](compile_macos.html)

## Windows
[Using Visual Studio](compile_windows.html)
