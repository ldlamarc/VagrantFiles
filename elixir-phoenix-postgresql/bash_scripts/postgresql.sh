#!/bin/bash
function update_packages {
    echo Updating package information
    apt-get -y update >/dev/null 2>&1
}
function install {
    if [ -z `which $@` ]; then
      echo Installing $1
      shift
      apt-get -y install "$@" >/dev/null 2>&1
    else
      echo Already installed: $1
    fi
}

echo "Postregsql.sh"

export DEBIAN_FRONTEND=noninteractive
wget --quiet -O - https://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -

update_packages

install 'PostgreSQL' postgresql postgresql-contrib
