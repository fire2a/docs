---
layout: default
title: compiling on MacOS
nav_order: 2
parent: Cell2Fire++ simulator
has_children: false
has_toc: false
---
# MacOS
This instructions work for either M1 or intel CPU

0. check your architecture executing `arch` on the terminal app
1. app store > install xcode
2. https://github.com/Homebrew/brew/releases/latest > install homebrew
3. install xcode essentials?
4. run brew shellenv:
```
fdo@MacBook-Air ~ % cat .zprofile 
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
```
5. open new terminal

## compile
```
# Install dependencies 
#  maybe missing boost-mpi boost-build, llvm for intel?
$ brew install boost eigen gcc libopenmpt
$ cd Cell2FireC
$ make clean -f makefile.macos
$ make -f makefile.macos
```
Something failed? If homebrew was installed for all users (instead of the default), choose your `makefile`: 

{: .info}
Rename the compiled the binary `Cell2Fire` so the [toolbox-plugin] uses it:
```
ext=`python3 -c "import platform;print(f'.{platform.system()}.{platform.machine()}')"`
cp Cell2Fire Cell2Fire$ext
cp Cell2Fire$ext ~/.local/share/QGIS/QGIS3/profiles/default/python/plugins/fireanalyticstoolbox/simulator/C2F/Cell2FireC/.
```

```
# makefile.macos:
/opt/homebrew/include

# makefile.macos-latest:
/usr/local/include
```
Further adjustments probably start at editing directories in `makefile`

## Notes when installing LVM
```
==> llvm
To use the bundled libc++ please add the following LDFLAGS:
  LDFLAGS="-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++"

llvm is keg-only, which means it was not symlinked into /opt/homebrew,
because macOS already provides this software and installing another version in
parallel can cause all kinds of trouble.

If you need to have llvm first in your PATH, run:
  echo 'export PATH="/opt/homebrew/opt/llvm/bin:$PATH"' >> ~/.zshrc

For compilers to find llvm you may need to set:
  export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
```

## TBD Next steps:

1. Make a macos-universal binary
https://github.com/manojkarthick/macos-universal-binary-action
2. When github enables arm64 arch, compile using matrix actions
https://github.com/kryptokrona/njord/actions/runs/3602943270/workflow

## Notes c++ on global variables
`fls` in `Kitral.cpp` was colliding with system `strings.h:fls`

```
# from /Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/strings.h:78
/* Darwin extensions */
#if __DARWIN_C_LEVEL >= __DARWIN_C_FULL
__BEGIN_DECLS
int	 ffsl(long) __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0);
int	 ffsll(long long) __OSX_AVAILABLE_STARTING(__MAC_10_9, __IPHONE_7_0);
int	 fls(int) __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0);
```

----
[toolbox-plugin]: ../../docs/qgis-toolbox/README.html
