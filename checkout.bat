@echo off
setlocal enabledelayedexpansion
cd %~dp0
set version=%1
if "%version%"=="" (
  echo ERROR: Too few arguments.
  echo USAGE: %~0 version^(or a name of tag^)
  exit /b 1
)
mkdir %version%
mkdir %version%\opencv
mkdir %version%\opencv_contrib

cd %version%
robocopy ..\opencv         .\opencv          /NDL /NFL /MIR /COPY:DAT /R:0 /W:0 /XJD /XJF
robocopy ..\opencv_contrib .\opencv_contrib  /NDL /NFL /MIR /COPY:DAT /R:0 /W:0 /XJD /XJF
cd opencv
git checkout tags/%version%
git status
cd ..\opencv_contrib
git checkout tags/%version%
git status


