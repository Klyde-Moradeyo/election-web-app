#!/bin/sh
git fetch --all
git stash
git checkout -b $1
git stash pop;

# Move build files before commit
[ ! -e VERSION ] || mv VERSION .. 
[ ! -e .jx/variables.sh ] || mv .jx/variables.sh ..

git add .
git commit -m "$2"
git checkout $3
git merge $1
git checkout --force $3

# Move build files after commit
[ ! -e ../VERSION ] || mv ../VERSION . 
[ ! -e ../variables.sh ] || mv ../variables.sh ./.jx