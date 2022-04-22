#!/bin/sh
msg=$1
git commit -a -m "$msg"
git push origin main