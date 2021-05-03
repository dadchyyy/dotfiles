#!/usr/bin/env sh

git add $(git ls-files)
local timestamp=$(date '+%Y-%m-%d %H;%M:%S')
git commit -m "Automatically updated on ${timestamp}"
git push
