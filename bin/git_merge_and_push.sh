#!/bin/sh
git fetch --all
git stash
git checkout -b $1
git stash pop;

git add $4
git commit -m "$2"
git checkout $3
git merge $1
git checkout --force $3
git push origin