#!/bin/bash

alias ll='ls -l'
alias mvn='mvn -U'
alias pidport='lsof -i -n -P'
alias psa='ps auwx'
alias psu='ps auwx | grep tom.artale'
alias ssh='ssh -t -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias scp='scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias git=hub
alias gcw='git commit -vm WIP'
alias cdp="cd $PROJECTS"
alias cdgo="cd $(firstGoPath)/src"
alias cdgol="cd $(firstGoPath)/src/github.com/logrhythm"
alias cdgot="cd $(firstGoPath)/src/github.com/tartale"
alias up1='cd ..'
alias up2='cd ../../'
alias up3='cd ../../../'
alias up4='cd ../../../../'
alias up5='cd ../../../../../'
alias allgit='find $PROJECTS -name ".git" -exec dirname {} \;'

