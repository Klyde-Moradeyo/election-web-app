#!/bin/sh
git fetch origin
git checkout BUILD_STATS     
git clean -df
git commit .
git commit -m  "$1"
git push origin