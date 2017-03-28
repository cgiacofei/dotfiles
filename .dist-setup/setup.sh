#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/scripts"

for script in "$DIR"/*
do
    if [ -x "$script" ]; then
        "$script"
    fi
done
