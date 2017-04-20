#!/bin/bash

export VMWAREDIR="${HOME}/Documents/Virtual Machines.localized"

function vmstart {
  vmxfile=$(find "${VMWAREDIR}/${1}" -type f -name "*.vmx" -print -quit)
  vmrun -T fusion start "$vmxfile" nogui
}

function vmstop {
  vmxfile=$(find "${VMWAREDIR}/${1}" -type f -name "*.vmx" -print -quit)
  vmrun -T fusion stop "$vmxfile"
}

function vmautocomplete () {
  local cur=${COMP_WORDS[COMP_CWORD]}
  lsout=$(ls "${VMWAREDIR}")
  COMPREPLY=( $(compgen -W "$lsout" -- $cur) )
}

complete -F vmautocomplete vmstart
complete -F vmautocomplete vmstop
