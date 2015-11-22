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

function update_packages {
    echo Updating package information
    apt-get -y update >/dev/null 2>&1
}
