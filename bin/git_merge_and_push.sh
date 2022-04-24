#!/bin/sh
git fetch --all
git stash
git checkout -b BUILD_$VERSION
git stash pop;

# Remove build files before commit
[ ! -e VERSION ] || rm -rf VERSION
[ ! -e .jx/variables.sh ] || rm -rf .jx/variables.sh

git add .
git commit -m "$2"
git push origin
git checkout --force main