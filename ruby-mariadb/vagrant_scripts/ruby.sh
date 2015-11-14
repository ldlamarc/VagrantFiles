 #!/usr/bin/env bash
 # https://rvm.io/integration/vagrant#using-rvm-with-vagrant

 source $HOME/.rvm/scripts/rvm

 echo "Installing ruby and basic gems using RVM"

 rvm use --default --install $1

 shift

 if (( $# ))
 then gem install $@
 fi

 rvm cleanup all

