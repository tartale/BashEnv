#!/bin/bash

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_05.jdk/Contents/Home
export JAVAH=/usr/bin/javah
export MAVEN_HOME="/Applications/NetBeans/NetBeans 8.0.1.app/Contents/Resources/NetBeans/java/maven"

export GOROOT=/usr/local/opt/go@1.10/libexec

export PATH=$PATH:$JAVA_HOME/bin:"$MAVEN_HOME/bin"
export PATH=$PATH:$GOROOT/bin
#export PATH=$PATH:"/Applications/Xcode.app/Contents/SharedFrameworks/LLDB.framework/Versions/A/Resources"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"

export CONSUL_CONF_FILE=secureConfig.json
export CONSUL_NODE_NAME=USMAC2697TARTA.schq.secious.com
export CONSUL_BIND=$(ifconfig en0 | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2)
export CONSUL_JOIN=10.3.1.100,10.3.1.99
export CONSUL_CLIENT=true

