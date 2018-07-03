#!/bin/bash

export PROJECTS=$HOME/Projects
export PROTOROOT=$PROJECTS/Protobuffers/thirdParty/dist/protobuf
export PROTOINCLUDE=$PROTOROOT/include

export GITHUBUSER=Tom-Artale
export GITHUB=git@github.schq.secious.com:Logrhythm
export MYGITHUB=git@github.schq.secious.com:$GITHUBUSER

export GOPATH=$PROJECTS/go
#export GOPATH=$GOPATH:$GOPATH/src/github.schq.secious.com/DataIndexer/Godeps/_workspace
export GOBIN=$PROJECTS/go/bin
export GO15VENDOREXPERIMENT=1

export SOURCEDIRS=($PROJECTS $GOPATH/src/github.schq.secious.com/Logrhythm $GOPATH/src/github.schq.secious.com/DataIndexer)

export DEPLOYIFIER_HOME=$PROJECTS/Deployifier

export PATH=$PATH:/Users/tom.artale/SideProjects/bin:/opt/local/bin:$PROTOROOT/bin
export PATH=$PATH:$GOBIN

thisScriptDir=$(realpath $(dirname $BASH_SOURCE))
thisOS=$(uname)
source "${thisScriptDir}/env-${thisOS}.sh"
