#!/bin/bash

function firstGoPath() (
  IFS=':' read -ra GPARRAY <<< "$GOPATH"; echo "${GPARRAY[0]}"
)
