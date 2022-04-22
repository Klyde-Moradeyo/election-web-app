#!/bin/bash  
MSG = $1
git commit .
git commit -m $msg
git push origin main