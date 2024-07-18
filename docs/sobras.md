
{: .warning}
Windows users must set `.tif` as their default raster format
![](assets/windows_tif.png)


2. fire2a-toolbox installation can *almost* be done straight forward from QGIS **[plugin manager]** *but*:
    - Python [dependencies][requirements.txt] must be manually resolved  
    - fire2a's plugin repo/store [link][toolbox-server] must be added as a custom plugin source (*)  



(*) : Because it contains compiled c++ binary code -for Cell2Fire simulator, but binary code cannot be easily verified hence the plugin is not allowed on the [regular repo/store](https://plugins.qgis.org/). Nevertheless all our code is open source, its build is "reproducible" by an automated action; all can be audited on [fire2a@github](https://github.com/fire2a)

* **Testers** should instead install by `.zip` file from fire2a-toolbox [releases][toolbox-releases]
* **Developers** should clone our repos ([toolbox-repo], [c2f-repo], [fire2a-lib-repo]), compile cell2fire, symlink and setup additional python dependencies to contribute ([tl;dr](/docs/docs/Cell2Fire/README.html#unix-overview))

