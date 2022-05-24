#!/bin/sh
git fetch --all
git stash
git checkout -b $1
git stash pop;

# Move build files before commit
[ ! -e VERSION ] || mv -v VERSION .. 
[ ! -e .jx/variables.sh ] || mv -v .jx/variables.sh ..

git add $4
git commit -m "$2"
git checkout $3
git merge $1
git checkout --force $3
git push origin

# Move build files after commit
[ ! -e ../VERSION ] || mv -v ../VERSION . 
[ ! -e ../variables.sh ] || mkdir -v --parents ./.jx; mv -v ../.jx/variables.sh ./.jx/variables.sh