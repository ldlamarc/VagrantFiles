# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

install 'development tools' build-essential

#Required for MariaDB setup
install 'PwGen' pwgen

install Git git

#Can be used to visualize DB schema
install 'GraphViz' graphviz

# Needed for docs generation.
update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8
