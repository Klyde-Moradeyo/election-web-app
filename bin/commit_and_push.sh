#!/bin/sh
git fetch origin
git pull origin
git commit .
git commit -m  "$1"
git push origin main