#!/bin/bash

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.121-0.b13.el7_3.x86_64
export MAVEN_HOME="/usr/share/maven"

export PATH=$PATH:$JAVA_HOME/bin:"$MAVEN_HOME/bin"

source $HOME/.go_profile
