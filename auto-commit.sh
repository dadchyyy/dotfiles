#!/bin/sh

FILES=`git ls-files`
TIMESTAMP=`date '+%Y-%m-%d %H:%M:%S'`

git add $FILES
git commit -m "Automatically updated on ${TIMESTAMP}"
git push
