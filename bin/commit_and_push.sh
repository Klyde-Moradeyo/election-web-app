#!/bin/sh
MSG = $1
git checkout main
git commit .
git commit -m "$MSG"
git push origin main