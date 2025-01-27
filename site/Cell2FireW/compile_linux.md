---
layout: default
title: compiling on Linux
nav_order: 1
parent: Cell2Fire++ simulator
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

## Summary
```
git clone git@github.com:fire2a/C2F-W.git
cd C2F-W/Cell2FireC
make clean -f makefile.flavor
make -f makefile.flavor
```

{: .info}
Rename the compiled the binary `Cell2Fire` so the [toolbox-plugin] uses it:
```
ext=`python3 -c "import platform;print(f'.{platform.system()}.{platform.machine()}')"`
cp Cell2Fire Cell2Fire$ext
cp Cell2Fire$ext ~/.local/share/QGIS/QGIS3/profiles/default/python/plugins/fireanalyticstoolbox/simulator/C2F/Cell2FireC/.
```

## Debian based
A Cell2Fire++ binary is provided in releases; though to compile it:
```bash
sudo apt install g++ libboost-all-dev libeigen3-dev
cd C2F-W/Cell2FireC
make clean -f makefile.debian
make -f makefile.debian
```  
If it fails, is probably the `makefile` assuming `EIGENDIR = /usr/include/eigen3/`  
Correct it by locating where your distribution installs `eigen`, either using the command `nice find / -readable -type d -name eigen3 2>/dev/null` or checking your distribution's documentation for `libeigen3-dev` package [^1] [^2]. Edit `makefile` accordingly, then try building again. 

## Rocky Linux (khipu)
```
# boost was installed
# download eigen
git clone git@salsa.debian.org:science-team/eigen3.git

# locate gcc12
find /opt -name "libstdc++*" -print
/opt/gcc/gcc-12.1.0/lib64/libstdc++.so

# append to .bashrc
export LD_LIBRARY_PATH=/opt/gcc/gcc-12.1.0/lib64:$LD_LIBRARY_PATH

# use the modified makefile.khipu
EIGENDIR     = /path/to/eigen3/
CC = /opt/gcc/gcc-12.1.0/bin/g++
MPCC = /opt/gcc/gcc-12.1.0/bin/g++
OPENMP = -fopenmp
CFLAGS = -std=c++11 -O3 -I$(EIGENDIR) -fopenmp

cd C2F-W/Cell2FireC
make clean -f makefile.khipu
make -f makefile.khipu
```

----

[^1]: https://packages.debian.org/bookworm/all/libeigen3-dev/filelist
[^2]: https://packages.ubuntu.com/search?keywords=libeigen3-dev

----
[toolbox-plugin]: ../../docs/qgis-toolbox/README.html
