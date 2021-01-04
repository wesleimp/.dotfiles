#!/usr/bin/env bash

message=""
if [ -z "$1" ]; then
    message="Auto update"
else
    message=$1
fi

git add --all;
git commit -m "$message";
git push origin master;
