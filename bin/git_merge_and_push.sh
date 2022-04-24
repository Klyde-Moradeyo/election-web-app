#!/bin/sh
git fetch --all
git stash
git checkout -b $1
git stash pop;

# Remove build files before commit
[ ! -e VERSION ] || rm -rf VERSION
[ ! -e .jx/variables.sh ] || rm -rf .jx/variables.sh

git add .
git commit -m "$2"
git checkout $3
git merge $1
git checkout --force $3