#!/bin/bash
version=$1
mkdir -p $1
cd $1
cp -a ../opencv .
cp -a ../opencv_contrib .
cd opencv
git checkout tags/$version
git status
cd ../opencv_contrib
git checkout tags/$version
git status
cd ../
mkdir build

