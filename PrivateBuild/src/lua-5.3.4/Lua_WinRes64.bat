@echo off
rem by Joe DF
rem This was tested with 'mingw' as the build platform
rem After running the makefile,
rem run this file to add the resources to lua.exe, luac.exe and lua52.dll
rem Outputs to 'bin' folder
cd src
mkdir bin64 >nul 2>&1

windres64 WinResource\lua.rc lua.rc.o
windres64 WinResource\luac.rc luac.rc.o
windres64 WinResource\dll.rc dll.rc.o

gcc64 -shared -o bin64\lua53.dll dll.rc.o lapi.o lcode.o lctype.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o lmem.o lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o ltm.o lundump.o lvm.o lzio.o lutf8lib.o loadlib.o linit.o lauxlib.o lbaselib.o lbitlib.o lcorolib.o ldblib.o liolib.o lmathlib.o loslib.o lstrlib.o ltablib.o
strip64 --strip-unneeded lua53.dll
gcc64 -o bin64\lua.exe -s  lua.o lua.rc.o lua53.dll -lm
gcc64 -o bin64\luac.exe   luac.o luac.rc.o liblua.a -lm

del WinResource\*.o >nul 2>&1
