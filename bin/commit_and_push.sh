#!/bin/sh
MSG = $1
git commit .
git commit -m "$MSG"
git push origin main