---
layout: default
title: QGIS cookbook
nav_order: 4
has toc: false
---
<h1>
QGIS cookbook
</h1>
{: .no_toc}
<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>
# Getting Help 🚑

Before reaching out, make the sanity test:
* QGIS is updated (please try switching from LTR to latest)
* Fire2a toolbox is updated (`Menu : Plugins > Manage and Install Plugins... > Installed > Fire Analytics Processing-Toolbox > Upgrade`)
* Your Operating System (OS e.g. Linux, Windows, MacOS) is updated
* No funny formats in `Options > Processing > default raster & vector layers, set to tif & gpkg`  
    ![](img/qgis_set_default_formats.png){: width="50%"}
* Restart your computer and try again on a fresh QGIS project on a directory that is *not shared* (no OneDrive, GoogleDrive, network drive, etc.) and has no spaces in its name

If the problem persists, follow the next steps to create an issue [here](https://github.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/issues): 

1. Look for similar issues beforehand

2. Identify your OS, Fire2a toolbox plugin, and QGIS versions:
   - **Operating System:**  
       -- Windows : `press Win key > type About > Windows specifications section : click Copy button`  
       -- MacOS : `Apple > TODO`  
       -- Linux: `$ uname -a`
   - **Plugin Version:** Navigate to `Plugins > Manage and Install Plugins... > Installed > Fire Analytics Processing-Toolbox > Installed version`. 
  ![](img/plugins_version.png){: width="75%" }
   - **QGIS Version:** `Menu :Help > click About` copy at least the first paragraph
  
3. **Include Relevant Files:**
   - Compress and attach the instance and/or results (make a `.zip` file) you were using when the error occurred.
   - If not already in results, attach the corresponding `algorithmName_log.html` file (`Menu : View > Panels > Log Messages > fire2a`)
  
Clear and concise descriptions are paramount when submitting a bug report. Please focus on **details about the issue encountered, including your goal and the unexpected behavior you experienced.** Then, provide the **steps to reproduce the issue. Include any error messages or other relevant observations you encountered.**

<a href="#top">back to top</a>
{: style="text-align: right;"}

# <img src="../assets/qgis-favicon.ico"  alt='icon-missing' style="height: 18px"> Plugin Management

There are 3 ways of installing plugins, the recommended (using a our custom repo source) takes care of prompting the user in QGIS's message bar for updates. "Install from ZIP" is for testers looking for beta versions, and "placing a directory" is for developers symlinking their repo.

## Install fire2a toolbox
(check explainer video after for steps 3 and 4)
1. Install QGIS for [Linux🗽](#linux-), [MacOS](#macos-) or [Windows](#windows-)
   _English language version is more reliable_
   __Don't open it yet!__
   _Decision Optimization algorithm users __beware__: At the moment (May 1st 2024, and for the last year), IBM has not released a python >3.10 compatible version. So QGIS<=3.36.0 is required for using CPLEX (CBC is included and works fine except for large rasters)_
2. Install python dependencies for [Linux🗽](#python), [MacOS](#python-1), [Windows](#python-2) ... or [last resort](forcing-python-requirements.html)
3. Add fire2a's plugin repo/store [URL][toolbox-server] to custom plugin sources *(open here!)*
   * [tutorial][custom]
   * `Menu: 'Plugins' > 'Manage and Install Plugins...' > 'Settings' > Plugin Repositories 'Add' > fill Name & paste URL > Ok`<br>
     ![](img/tldr_add_plugin_source.png){: width="55%" }<br>
     <a name="anchor"> </a>
     <video controls loop style="width: 75%;">
       <source src="img/install_plugin_server.mp4" type="video/mp4">
       Your browser does not support the video tag.
     </video>
   * Note: removing the repo server does not uninstall its plugins

4. Do a regular new plugin installation
   * [tutorial][new plugin]
   * `Menu: 'Plugins' > 'Manage and Install Plugins...' > 'Not installed' > search box 'fire' > select > 'Install Plugin' > 'Ok'`
   * Note: *At the time of writing the `Plugin Dependencies Manager` wait wheel spins forever, press `Ok` right away; you already installed them in step 2*
   * If it doesn't appear right away on the Processing Toolbox panel:<br>
         A. toggle the checkbox next to its name in the `Installed` section of the `Plugin Manager`<br>
         B. restart QGIS<br>
   <img src="img/tldr_install_plugin.png" style="width: 55%;" alt="Plugin Installation">
   <video controls loop style="width: 95%;">
         <source src="img/install_fire2a_toolbox.mp4" type="video/mp4">
         Your browser does not support the video tag.
   </video>

<a href="#top">back to top</a>
{: style="text-align: right;"}

## Other options
### Install from ZIP
1. Browse to:
* [releases](https://github.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/releases)
* [latest release](https://github.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/releases/latest)
2. Download a release from a tag section, in the Assets part, it looks like `fireanalyticstoolbox_v1818.5.5-beta.zip`
3. `Menu: 'Plugins' > 'Manage and Install Plugins...' > 'Install from ZIP' > '...' > 'Install Plugin'` (also dropping the zip into the input works)

### Place a folder
Download & unzip a release from the repo [toolbox-releases] or sample [release](https://github.com/fdobad/qgis-processingplugin-template/releases) sections.

For example, unzip `example_plugin_v1.2.3.zip`, inside, a folder named `example_plugin` must be moved to: 
```
# linux (symbolic link it!)
~/.local/share/QGIS/QGIS3/profiles/default/python/plugins/example_plugin
# macos
~/Library/Application Support/QGIS/QGIS3/profiles/default/python/plugins/example_plugin
# windows
%APPDATA%\QGIS\QGIS3\profiles\default\python\plugins\example_plugin
```

<a href="#top">back to top</a>
{: style="text-align: right;"}

## Must have plugins!

<img src="https://plugins.qgis.org/media/cache/be/d4/bed435e6a44e6d32cebb7e3af2f584ce.png"  alt='icon-missing' style="height: 16px">
: [Save All](https://plugins.qgis.org/plugins/SaveAllScript/), choose a location, name a new directory, done! everything gets written to disk, never worry again about temp folders or in memory layers!

<img src="https://plugins.qgis.org/media/cache/ee/38/ee380afa16e4be33e53defd07b8d6ccc.png"  alt='icon-missing' style="height: 16px">
: [Serval](https://plugins.qgis.org/plugins/Serval/), Modify your rasters as if you were using paint!

<img src="https://plugins.qgis.org/media/cache/b1/4b/b14beb4a67135e9ebf4cbdfbc2a206dc.png"  alt='icon-missing' style="height: 16px">
: [IPyConsole](https://plugins.qgis.org/plugins/IPyConsole/), "No offense, but QGIS python console just sucks." ([sic](https://www.itopen.it/qgis-and-ipython-the-definitive-interactive-console/#comment-140751)) [documentation](http://www.itopen.it/qgis-and-ipython-the-definitive-interactive-console/), [fix to use latest qtconsole](https://github.com/elpaso/qgis-ipythonconsole/compare/master...fdobad:qgis-ipythonconsole:master)

<img src="https://plugins.qgis.org/media/cache/0f/ac/0faca0282837983e3b2cad151c05844e.png"  alt='icon-missing' style="height: 16px">
: [Plugin Reloader](https://plugins.qgis.org/plugins/plugin_reloader/), If a plugin starts misbehaving easier to reload it than to restart QGIS

<img src="https://plugins.qgis.org/media/cache/e5/09/e5090f072bef93fb4344067026148210.png"  alt='icon-missing' style="height: 16px">
: [Plugin Builder](https://plugins.qgis.org/plugins/pluginbuilder3), Jumpstart your plugin development!

<a href="#top">back to top</a>
{: style="text-align: right;"}

## Install/Update troubleshoot
Sometimes after an update, the plugin doesn't appear on the Processing Toolbox panel: Reload it by pressing on the checkbox next to its name in the `Installed` section of the `Plugin Manager` or restart QGIS.

<video controls loop style="width: 95%;">
  <source src="./img/checkbox_refresh_reloads_plugin.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>
<a href="#top">back to top</a>
{: style="text-align: right;"}

# Linux 🗽
## QGIS install
* On Debian getting the Long Term Release is easy as: 
    * Gnome: `Super (or Meta) Key > type 'QGIS' > Click 'Install' on the Software app dialog`
    * Synaptic: search for qgis, click install
    * Terminal: `sudo apt install qgis qgis-plugin-grass`
* Getting the Latest Release on Debian: add QGIS [apt source](https://qgis.org/en/site/forusers/alldownloads.html#debian-ubuntu)
* [Other distributions](https://qgis.org/en/site/forusers/alldownloads.html#linux)

<a id="linux-python-environment"></a>
## Python

{: .warning}
`sudo pip` is insecure and may break your system!

{: .info}
expert tl;dr: `-m venv --system-site-packages -r` [requirements.txt], [requirements.dev.txt]

### setup a virtual environment
Handle separate dependencies but share system packages because installing QGIS brings addional packages through `python3-qgis` that binds c binaries such as GDAL.
1. Download [requirements.txt] list (2ndary clicking the link and Save Link As...)
2. Open a terminal
```bash
# good practice: a directory to keep all venvs 
mkdir -p ~/pyenv
# recommended: name this venv qgis
python3 -m venv --system-site-packages ~/pyenv/qgis
# activate it
$ source ~/pyenv/qgis/bin/activate
# from activated venv, upgrade tools
(qgis) $ python -m pip install --upgrade pip wheel setuptools
# install requirements (check where you saved it)
(qgis) $ pip install -r ~/Downloads/requirements.txt 
# related bug: matplotlib can't find qt backend
(qgis) $ pip install --upgrade matplotlib
```

### usage: activate venv, launch qgis
```bash
$ source ~/pyenv/qgis/bin/activate
(qgis) $ qgis
```

### handy terminal aliases
```bash
# appending to .bashrc:
echo 'alias pyqgis="source ~/pyenv/qgis/bin/activate"'>>~/.bashrc
echo 'alias myqgis="source ~/pyenv/qgis/bin/activate && qgis"'>>~/.bashrc
# NOTE: must source bashrc for aliases to work
$ source ~/.bashrc
# NOTE: or restart same shell (every time a bash terminal is launched it gets sourced)
$ bash 
# first alias: to activate venv
$ pyqgis
# second alias: to launch with venv activated
$ myqgis
```

### activated ~~icon~~ desktop environment launcher

{: .success}
Avoid `ModuleNotFoundError` when QGIS starts from the default launcher or associated (i.e. Open with) files (e.g., .shp, .gpkg), by activating the venv before starting QGIS

To do this, edit the QGIS ~~icon~~ launcher. Some Desktop Environments (xfce, gnome?) allow editing the launcher by 2ndary clicking on the QGIS icon; then edit the launch command on the displayed menu:
```bash
# From
Exec=qgis %F
# To
Exec=bash -c 'source ~/pyenv/qgis/bin/activate && qgis %F'

# It's the same as editing this file 
~/.local/share/applications/org.qgis.qgis.desktop

# If not found on your user's files it's on system launchers, copy it:
cp /usr/share/applications/org.qgis.qgis.desktop ~/.local/share/applications/.
# then edit

# GNOME
update-desktop-database ~/.local/share/applications/
```
### other useful locations
```bash
# user plugin directory
~/.local/share/QGIS/QGIS3/profiles/default/python/plugins/fireanalyticstoolbox
# processing plugin directory
/usr/share/qgis/python/plugins/processing
```

<a href="#top">back to top</a>
{: style="text-align: right;"}

# MacOS 💰
## QGIS Install
Download it [here](https://qgis.org/en/site/forusers/download.html#mac) also read the instruction to not get security blocked at startup.
## Python
This QGIS version includes its own python, so be careful to use it instead of systems's python
```zsh
# optional or pro: be extra careful confirming is the right python
# these are not the same:
% ./python3 -c "import sys;print(sys.prefix)"
% python3 -c "import sys;print(sys.prefix)"
```

### installing requirements
1. Download [requirements.txt] list (2ndary clicking the link and Save Link As...)
2. Open a terminal
```zsh
# go to QGIS python location
% cd /Applications/QGIS.app/Contents/MacOS/bin
# install into qgis python environment
% ./python3 -m pip install -r ~/Downloads/requirements.txt
# matplotlib bug: can't find qt_backend
% ./python3 -m pip install --upgrade matplotlib
```

### other useful locations
```zsh
# user plugin folder
~/Library/Application\ Support/QGIS/QGIS3/profiles/default/python/plugins/fireanalyticstoolbox
# python location
/Applications/QGIS.app/Contents/MacOS/bin
```

<a href="#top">back to top</a>
{: style="text-align: right;"}

# Windows 💩™
## QGIS Install
A. Web install [link](https://qgis.org/en/site/forusers/download.html#windows), there are 3 flavors:
- Latest version is recommended
- LTR works with some issues
- OSGeo4W Network Installer can be upgraded in place

B. "Terminal" install
0. Using `winget` cli, if not available, activate it in Microsoft Store
1. Open a "privileged terminal", e.g. On your keyboard press the 'Win' button > type 'cmd' > 2dary click on the app > Click 'Run as administrator'
2. Input `winget install -e --id OSGeo.QGIS --scope machine` (`--scope machine` option is recommended to making launcher icons for all users)
3. Follow on screen instructions (all defaults are ok)

<a id="windows-python-environment"></a>
## Python
Windows version of QGIS comes bundled with its own python, a special launcher must be used to access it
### installing requirements
1. Download [requirements.txt] list (2ndary clicking the link and Save Link As...)
2. Activate QGIS python by starting `OSGeo4W Shell` app `Win button > type OSGeo > select & click` to launch a CMD terminal 
3. Type `pip install -r "%USERPROFILE%\Downloads\requirements.txt"` press Enter. (Adjust the path as needed, on Windows 11 you can select the file with the secondary button then click 'Copy path', use 2ndary click to paste into CMD terminal)

<video controls loop style="width: 95%;">
  <source src="img/install_win_pip_requirements.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

If you couldn't understand last 2 steps, try the [last resort](forcing-python-requirements.html) solution.

__All ready!__

__Except__ if you'll be running our _Decision Optimization algorithms, specially on big rasters_; then the next two steps are required to use CPLEX as a MIP solver from within QGIS.

<a href="#top">back to top</a>
{: style="text-align: right;"}

### make it writable
Recommended for machines with a single user, or to share modifications to the environment to all users (explainer video after)

Also to integrate a local cplex install with QGIS python environment (see our decision optimization algorithms)

1. Open QGIS install folder, open the `bin` folder
    - probably: `C:\Program Files\QGIS 3.45.6\bin` (adjust version)
    - surely: `Win button > type QGIS > 2ndary click > Open file location > 2ndary click > Open file location > click 'bin' folder`
2. Select `Python39` (check same version), properties, security, ... full control for user.

<video controls loop style="width: 95%;">
  <source src="./img/qgis_windows_single_user.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

Also on the video, a success install of qtconsole being installed on `Program Files\Qgis` and not on user's `%APPDATA%` path, meaning success in making the python environment writable

### setup CPLEX solver 

__At the moment (May 1st 2024, and for the last year), IBM has not released a python >3.10 compatible version. So QGIS<=3.36.0 is required.__  

0. Make your QGIS python environment writable by users (see previous section)
1. Download and install the CPLEX solver from IBM's website (tested with CPLEX_Studio2211)
2. Open OSGeo4W Shell as administrator
3. Execute changing directory to the CPLEX install location, python folder, then run setup.py with the install argument:
```batch
cd ..\IBM\ILOG\CPLEX_Studio2211\python
python setup.py install
```
Now you can just select CPLEX on any decision [optimization](/docs/docs/qgis-toolbox/README.html#deployed-algorithms) algorithm (advanced parameters section, on the dropdown form)
![](img/doop_advancedoptions.png){: width="75%" }

### making a python environment launcher for developers

To have a location independent launcher that activates the environment in a CMD terminal; 
- for running python scripts using QGIS without the application raised
- that could be chained into VSCode for development [.vscode\settings.json](https://raw.githubusercontent.com/fire2a/fire2a-lib/main/.vscode/settings.json)

Copy and modify `python-qgis.bat` that comes in QGIS `bin` folder, in these 3 steps (explainer video after, [sample](https://raw.githubusercontent.com/fire2a/fire2a-lib/main/python-qgis-cmd.bat)):

1. Open QGIS install folder, open the `bin` folder
    - probably: `C:\Program Files\QGIS 3.45.6\bin` (adjust version)
    - surely: `Win button > type QGIS > 2ndary click > Open file location > 2ndary click > Open file location > click 'bin' folder`
2. Copy and rename `python-qgis.bat` to a location and name of your choosing
3. Edit the 2nd and last line with:
```batch
    REM call it from an absolute path
    REM adjust location and version
    call "%PROGRAMFILES%\QGIS 3.45.6\bin\o4w_env.bat"  (adjust version)

    REM print the prefix as check
    echo python sys says:
    python -c "import sys; print('prefix:', sys.prefix, '\npath:', sys.path)"
    REM leave the terminal running
    cmd.exe /k
```

<video controls loop style="width: 95%;">
  <source src="img/qgis_windows_activate_venv.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

### other useful locations
```batch
# user plugin folder
%AppData%\QGIS\QGIS3\profiles\default\python\plugins\fireanalyticstoolbox
# shell location
%ProgramFiles%\QGIS 3.36.1\OSGeo4W.bat
# python location
%ProgramFiles%\QGIS 3.36.1\apps\Python39
```

---
[QGIS]: https://qgis.org
[requirements.txt]: https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/requirements.txt 
[requirements.dev.txt]: https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/requirements.dev.txt
[Scott&Burgan-dialog-server]: https://fdobad.github.io/qgis-processingplugin-template/plugins.xml
[Kitral simulator dialog-server]: https://fdobad.github.io/fire2am-kitral/plugins.xml 
[Processing-Toolbox-server]: https://fire2a.github.io/fire-analytics-qgis-processing-toolbox-plugin/plugins.xml
[toolbox-releases]: https://fire2a.github.io/fire-analytics-qgis-processing-toolbox-plugin/releases
[toolbox-repo]: https://www.github.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin
[kitral-dialog-requirements.txt]: https://raw.githubusercontent.com/fdobad/fire2am-kitral/main/requirements.txt
[TODO-Cell2Fire-requirements.txt]: https://github.com/fire2a/C2F-W

[toolbox-server]: https://fire2a.github.io/fire-analytics-qgis-processing-toolbox-plugin/plugins.xml
[fetching plugins]: https://docs.qgis.org/latest/en/docs/training_manual/qgis_plugins/fetching_plugins.html
[custom]: https://docs.qgis.org/latest/en/docs/training_manual/qgis_plugins/fetching_plugins.html#basic-fa-configuring-additional-plugin-repositories
[new plugin]: https://docs.qgis.org/3.28/en/docs/training_manual/qgis_plugins/fetching_plugins.html#basic-fa-installing-new-plugins
