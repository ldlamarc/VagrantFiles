#!/bin/bash
function install {
    if [ -z `which $@` ]; then
      echo Installing $1
      shift
      apt-get -y install "$@" >/dev/null 2>&1
    else
      echo Already installed: $1
    fi
}

echo Dev_tools.sh

install 'Build-essential' build-essential
install 'PwGen' pwgen
install 'Git' git
install 'NodeJS' nodejs
