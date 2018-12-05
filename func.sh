#!/bin/bash

function interface()(
  netstat -rn | grep default | head -1 | awk '{print $6}'
)

function mvlink(){
  if [ -z $1 ] || [ -z $2 ]; then
    echo "usage: $0 sourceLink target"
    return 1
  fi

  if [ ! -L $1 ]; then
    echo "$1: not a symbolic link"
    return 1
  fi

  rm -f $1 && ln -s $2 $1
}

thisScriptDir=$(realpath $(dirname $BASH_SOURCE))
thisOS=$(uname)
source "${thisScriptDir}/func-${thisOS}.sh"


