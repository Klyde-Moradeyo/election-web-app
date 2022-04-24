#!/bin/sh
git fetch --all
git stash
git checkout --force $1 
git stash pop;

# Move build files before commit
[ ! -e VERSION ] || mv VERSION .. 
[ ! -e .jx/variables.sh ] || mv .jx/variables.sh ..

git add .
git commit -m "$2"
git push origin
git checkout --force main

# Move build files after commit
[ ! -e ../VERSION ] || mv ../VERSION . 
[ ! -e ../variables.sh ] || mv ../variables.sh ./.jx