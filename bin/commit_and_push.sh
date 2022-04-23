#!/bin/sh
git fetch --all
git stash
git checkout --force $1 
git stash pop;
git add .
git commit -m "$2"
git push origin
git checkout --force main