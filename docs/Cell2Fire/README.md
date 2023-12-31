---
layout: default
title: Cell2Fire++
nav_order: 2
has_children: true
has_toc: false
---
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

__Currently an effort to unify and gather improvements of the three different versions is being done [HERE](https://github.com/fire2a/c2f-w)__

Cell2Fire is a 2D-grid-based forest and wildland landscape fire simulator, focused on large scale areas and fast simulations to provide robust risk spatial analyitics, harnessing c++ parallel computation methods.

Released flavors:
- [Scott & Burgan](https://github.com/fire2a/C2FSB)  
- [Kitral](https://github.com/fire2a/C2FK)  
- [FBP](https://github.com/fire2a/C2FFBP)

The [OG](https://github.com/cell2fire/Cell2Fire/)


# Output examples

## Scott & Burgan
### Previncat's Zone 60 (Catalonian Instance): forest and a simulated fire spread with its corresponding scar and growth propagation tree. 
![Example-Instance_Scar](./img/c2fsb-example-scar.png)
### Risk metrics: Burn Probability (BP), Betweenness Centrality (BC), Downstream Protection Value (DPV), and Growth Propagation Tree (GPT). 
![Example-Risck_Metrics](./img/c2fsb-example-metrics.png)

## Kitral
### El Portillo, simulation with crown fire behavior.
![Example-El Portillo-Crown fire](./img/c2fk-El_portillo.png)

## Canadian Forest Fire Behavior Prediction System

|:-------------|:------------------|
| Dogrib forest, Canada ![](./img/c2fFBP-Example4.png){: width="100%" } | shortest paths propagation ![](./img/c2fFBP-Example1.png){: width="80%" } |
| Shortest paths propagation and ROS intensity ![](./img/c2fFBP-Example2.png){: width="100%" } | Burn-Probability ![](./img/c2fFBP-Example3.png){: width="80%" } |

# Compiling
Releases are bundled with pre-compiled binaries, normal users probably don't need this guide.

Check the [repo's action artifacts](https://github.com/fire2a/C2F-W/actions) for the latest info on automated builds

## Overview
```bash
# install build-essentials, gcc-12, boost, eigen3 & openmp
cd Cell2FireC
make clean
# sample makefiles for linux & macos provided
make [-f custom_makefile]

# integrate with qgis-toolbox:
ext=`python3 -c "import platform;print(f'.{platform.system()}.{platform.machine()}')"`
mv Cell2Fire Cell2Fire$ext
```
## Linux
[Make](compile_linux.html)

## Macos
[Make](compile_macos.html)

## Windows
[Using Visual Studio](compile_windows.html)
