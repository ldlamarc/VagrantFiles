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

echo Init.sh

update_packages

install language-pack-en
update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8
