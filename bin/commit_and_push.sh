#!/bin/sh
git fetch --all
git stash
git checkout --force BUILD_STATS
git stash pop;
git add .
git commit -m "$1"
git push origin