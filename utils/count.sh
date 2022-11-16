#!/bin/bash

cd "$1"
files=`find . | wc -l`

printf "%-12s %-50s\n" " $files `pwd -P`"

