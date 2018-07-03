#!/bin/bash

function interface()(
  netstat -rn | grep default | head -1 | awk '{print $6}'
)

thisScriptDir=$(realpath $(dirname $BASH_SOURCE))
thisOS=$(uname)
source "${thisScriptDir}/func-${thisOS}.sh"


