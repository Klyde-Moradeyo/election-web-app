#!/bin/sh
git fetch --all
git stash
git checkout --force $1 
git stash pop;

# Remove build files before commit
[ ! -e VERSION ] || rm -rf VERSION
[ ! -e .jx/variables.sh ] || rm -rf .jx/variables.sh

git add .
git commit -m "$2"
git push origin
git checkout --force $3

# Move build files after commit
[ ! -e ../VERSION ] || mv -v ../VERSION . 
[ ! -e ../variables.sh ] || mkdir -v --parents ./.jx; mv -v ../variables.sh $_
