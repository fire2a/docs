---
layout: default
title: QGIS Management
nav_order: 5
has_children: true
has_toc: false
---
## [Install & Setup](./install.html)
__tl;dr:__ 
- prefer the latest over the LTR (long term release) of QGIS 
- __Linux__: setup an system aware python virtual environment for QGIS
- __MacOS__: use the bundled python directly
- __Windows__:
    - `WSL` >> `OSGeo4W installer` >> `Standalone` installer
    - make your python environment writable 
    - use the bundled python directly

## [Plugins](./plugins.html)
__tl;dr:__ 
- There are store plugins, custom store plugins, zip releases and manual installations
- Must have plugins: Save All, Serval, IPyConsole, Plugin Reloader, Plugin Builder
- Python dependencies are up to the user to install, but our plugin has a built-in dependency installer
