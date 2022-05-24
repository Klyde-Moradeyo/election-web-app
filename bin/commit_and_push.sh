#!/bin/sh
git fetch --all
git add .

git stash
git checkout --force $1 
git checkout stash -- . # git pop

git add .
git commit -m "$2"
git push origin
git checkout --force $3
