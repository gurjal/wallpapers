#!/bin/bash

_MV_FILE=false
_TARGET_RES="0"
_TARGET_DIR="4k"

for f in ./*
do
  _CUR_RES=$(file $f | awk -F, '{print $(NF-1)}' | awk -Fx '{print $1}')
  # equal
  #if [ $_CUR_RES -eq $_TARGET_RES ]
  # greater than or equal
  if [ $_CUR_RES -eq $_TARGET_RES ] || [ $_CUR_RES -gt $_TARGET_RES ]
  then
    echo $_CUR_RES $f
    if $_MV_FILE ; then
      mv $f $_TARGET_DIR
    fi
  fi
done
