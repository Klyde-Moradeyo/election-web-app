#!/bin/sh
git fetch --all
git stash
git checkout BUILD_STATS
git stash pop   
git clean -df
git commit .
git commit -m "$1"
git push origin