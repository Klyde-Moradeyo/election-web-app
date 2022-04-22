#!/bin/sh
git fetch origin
git checkout main
git commit .
git commit -m  "$1"
git push origin main