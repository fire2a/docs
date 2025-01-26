---
layout: default
title: Install & Setup
nav_order: 5
parent: QGIS Management
has_children: false
has_toc: false
---
{: .no_toc}
<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>
# tl;dr:
- prefer the latest over the LTR (long term release) of QGIS 
- __Linux__: setup an system aware python virtual environment for QGIS
- __MacOS__: use the bundled python directly
- __Windows__:
    - `WSL` >> `OSGeo4W installer` >> `Standalone` installer
    - make your python environment writable 
    - use the bundled python directly

# LTR vs Latest
QGIS has two versions: Long Term Release (LTR) and Latest. The LTR may be the most stable version, but lacks new features that the Latest version has. But also [QGIS relase schedule](https://qgis.org/resources/roadmap/#schedule) moves very fast (every 3 or so months), so there's no much point into supporting old versions for long.

At the time of writing we support 3.36.2 and up.

# Linux 🗽
- Official QGIS [install tutorial](https://qgis.org/download/)
- Make a system aware python virtual environment for QGIS:
    ```bash
    # required
    sudo apt install python3-venv

    # ~/pyvenv/qgis is just an example
    python3 -m venv --system-site-packages ~/pyvenv/qgis
    ```
- Usage: activate before launching qgis
    ```bash
    source ~/pyvenv/qgis/bin/activate
    qgis
    ```
- Customize QGIS's application "icon" launcher for ease of use:
    ```bash
    # make a user copy
    mkdir -p ~/.local/share/applications
    cp /usr/share/applications/org.qgis.qgis.desktop ~/.local/share/applications/org.qgis.qgisvenv.desktop

    # edit the sections in
    nano ~/.local/share/applications/org.qgis.qgisvenv.desktop
    # rename the launcher 
        Name=QGIS Desktop (venv)

    # activate the python environment 
        Exec=bash -c 'source ~/pyvenv/qgis/bin/activate && qgis %F'

    # + make local binaries available (usually user local binaries not in PATH)
    # do you even have a ~/.local/bin?
        Exec=bash -c 'export PATH=$HOME/.local/bin:$PATH && source ~/pyvenv/qgis/bin/activate && qgis %F'

    # + all logs for developers
        Exec=bash -c 'export PATH=$HOME/.local/bin:$PATH && source ~/pyvenv/qgis/bin/activate && qgis %F | tee -a /tmp/qgis.log'
        Terminal=true

    # if the icon not showing right away
    update-desktop-database ~/.local/share/applications/
    ```

<a href="#top">back to top</a>
{: style="text-align: right;"}

# MacOS
- Official QGIS [install tutorial](https://qgis.org/resources/installation-guide/#mac-os-x--macos)

<a href="#top">back to top</a>
{: style="text-align: right;"}

# Windows
Our recommendation priorities: Use the linux subsystem for windows (WSL), else the OSGeo4W installer, else the standalone installer.

Some algorithms (DPV) don't parallelize in Windows; the standalone installer doesn't update, so upgrading is slow! Using the bundled python is difficult -it can't even make a virtual environment to isolate different plugins! So WSL FTW!

## Windows Subsystem for Linux (WSL2)
Official [guide](https://learn.microsoft.com/en-us/windows/wsl/tutorials/gui-apps), nevertheless here are the main steps for setting up Debian with QGIS:
- Prerequisites: Windows 10 Build 19044+ or Windows 11 (for WSL2 with GUI)

1. Virtualization must be enabled (usually is, but restart to bios or uefi setup and check, else the next step will fail)
2. Activate the Windows Subsystem for Linux (WSL) additional feature (Start > Search > `Turn Windows features on or off` > checkbox `Windows Subsystem for Linux`, needs restarting)
3. Install Debian Linux distribution from the Microsoft Store or type in PowerShell
    ```powershell
    wsl --install -d Debian
    ```
4. Install the graphic drivers for gui apps (Open Debian from the Start menu)
    ```bash
    # update and upgrade the system (tip: repeat monthly)
    sudo apt update && sudo apt upgrade -y

    # install the graphic drivers by allowing firmware packages
    sudo nano /etc/apt/sources.list

    # add contrib, non-free and non-free-firmware to the end of the lines (3 or 4 lines), like this:
        deb http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware

    # save and exit the editor: Ctrl+O, Enter, Ctrl+X

    # update and install the drivers
    sudo apt update && sudo apt install firmware-linux firmware-linux-nonfree -y
    sudo reboot

    # test the drivers
    sudo apt install x11-apps
    xeyes
    ```

5. Check this [tutorial](https://learn.microsoft.com/en-us/windows/wsl/filesystems?source=recommendations), tl;dr: 
  - _Linux programs should work over linux locations, mixing windows locations is slow_
  - linux path `/home/<user name>` is equivalent to `\\wsl$\debian\home\<user name>` in windows
  - `/mnt/c/Users/<user name>/` is equivalent to `C:\Users\<user name>\`
  - use the `explorer.exe .` command to open a file explorer in the current directory
6. Now you can install QGIS as in the linux section
7. Windows icon to launch QGIS: Create a batch file, e.g., `Desktop\launch_qgis.bat` with the following content:
    ```batch
    @echo off
    wsl -d Debian -- bash -c "source ~/pyvenv/qgis/bin/activate && qgis"
    ```

<a href="#top">back to top</a>
{: style="text-align: right;"}

## OSGeo4W installer
- Official [OSGeo4W installer](https://qgis.org/resources/installation-guide/#osgeo4w-installer) guide
- QGIS gets installed in `C:\OSGeo4W\bin\qgis-bin.exe`
- To use QGIS's python you must open the OSGeo4W shell and activate the environment
    ```batch
    C:\OSGeo4W> cd bin
    C:\OSGeo4W\bin> python-qgis.bat
    >>> exit()
    REM now the python environment is fully set up
    REM but this environment forgets about the user's PATH so git or cplex won't be available
    ```

## Standalone installer
- Official QGIS [standalone](https://qgis.org/resources/installation-guide/#standalone-installers) guide
- QGIS gets installed in `C:\Program Files\QGIS 3.40.2\bin\qgis-bin.exe`
- To use QGIS's python you must open the OSGeo4W shell and activate the environment
    ```batch
    C:\Program Files\QGIS 3.40.2\> cd bin
    C:\Program Files\QGIS 3.40.2\bin\> python-qgis.bat
    >>> exit()
    REM now the python environment is fully set up
    REM but this environment forgets about the user's PATH so git or cplex won't be available
    ```

