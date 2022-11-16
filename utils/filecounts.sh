#!/bin/bash

basedir=$(dirname $0)

find "${1}" -type d -maxdepth 1 ! -path "${1}" -exec ${basedir}/count.sh {} \; | sort -n
