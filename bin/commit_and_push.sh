#!/bin/sh
git fetch --all
git stash
git checkout --force $1 

[ ! -e public/coverage ] || rm -rf public/coverage/{*,.*} # Delete public/coverage if exist
git stash pop;

# Move build files before commit
[ ! -e VERSION ] || mv -v VERSION .. 
[ ! -e .jx/variables.sh ] || mv -v .jx/variables.sh ..

git add $4
git commit -m "$2"
git push origin
git checkout --force $3

# Move build files after commit
[ ! -e ../VERSION ] || mv -v ../VERSION . 
[ ! -e ../variables.sh ] || mkdir -v --parents ./.jx; mv -v ../variables.sh ./.jx/variables.sh
