#!/bin/bash

function publicIPFor() (
  local interface="${1}"

  if [ -z "${interface}" ]
  then
    >&2 echo "usage: publicIPFor <interface>"
    return 1
  fi

  ip=$(ifconfig "${interface}" | awk '/inet / {print $2}')
  if [ -z "${ip}" ]
  then
    >&2 echo "unable to find public IP for ${interface}"
    return 1
  fi

  echo "${ip}"
  return 0
)

