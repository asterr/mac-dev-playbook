#!/bin/bash

basedir=$(dirname $0)

find "${1}" -type d -maxdepth 1 ! -name . -exec ${basedir}/count.sh {} \; | sort -n
