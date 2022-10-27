#!/bin/sh

git status --porcelain
if git status --porcelain | grep --silent --extended-regexp --invert-match '(go.mod|go.sum|vendor/modules.txt)'; then
    echo "there are changes"
else
    echo "empty vendor"
    git checkout -- go.mod go.sum vendor/modules.txt
fi
