#!/bin/bash

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_05.jdk/Contents/Home
export JAVAH=/usr/bin/javah
export MAVEN_HOME="/Applications/NetBeans/NetBeans 8.0.1.app/Contents/Resources/NetBeans/java/maven"

export GOROOT=/usr/local/Cellar/go16/1.6.3/libexec

export PATH=$PATH:$JAVA_HOME/bin:"$MAVEN_HOME/bin"
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
