#!/bin/sh
git fetch --all
git stash
git checkout --force $1 

rm -rf public/coverage # Delete public/coverage if exist
git stash pop;

git add .
git commit -m "$2"
git push origin
git checkout --force $3
