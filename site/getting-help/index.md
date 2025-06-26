---
layout: default
title: Getting Help
nav_order: 6
has_children: true
has_toc: false
---
# Getting Help 🚑
## How to reach us

1. Public relations  <a href="mailto: fire2a@fire2a.com">mail</a> (ask to join our mailing list!) or [linkedin](https://www.linkedin.com/company/fire2a).
2. Chat with us at [discord](https://discord.gg/wSuSFjrt).
3. Post a Github Issue

## Before getting help checklist

1. Avoid cloud drives and network shared folders
   - Use QGIS temporary outputs.
   - Create `C:\local` or `~/local` folder for your work.
2. Avoid funny characters (` `,`á`,`é`,`í`,`ö`, etc.) in directories, files and names.
   - Using QGIS in the default English language is strongly suggested, <a href="{{ site.baseurl }}/qgis-cookbook/#override-qgis-language">change it!</a>
3. Avoid funny formats for rasters and vectors
   - `Options > Processing > default raster & vector layers` formats set to `tif & gpkg` respectively
   - Save all input and output layers in these formats.
4. Update or reinstall -if apply:
   - Cell2FireW release
   - Algorithms Library: fire2a-lib package (further see into recreating the virtual environment)
   - QGIS Fire Analytics Toolbox Plugin.
5. Update and restart: QGIS, your OS, your computer.
6. Try again in a new, clean project; if the problem persist, gather these details:

## Help message indispensables

1. [If using] QGIS system info: `Help > About > Copy to clipboard`
2. Your goal, expectations and unexpected behavior
3. Clear steps to reproduce the issue (fullscreen video recording is a plus)
4. Specific logs and error messages (full QGIS processing log is a plus) 
5. [If using] Other QGIS log messages: `View > Panels > Log Messages` (Plugins, Processing, Python, fire2a)
6. [If using] Cell2FireW simulator, zip the input instance folder and attach it. If possible, the output log file.

## Github Issues

1. [Cell2FireW](https://www.github.com/fire2a/C2F-W/issues)
2. [QGIS Fire Analytics Toolbox](https://github.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/issues)
3. [Algorithms Library](https://www.github.com/fire2a/fire2a-lib/issues)
4. [This very documentation](https://www.github.com/fire2a/docs/issues)
