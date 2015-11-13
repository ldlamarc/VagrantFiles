echo "Installing RVM"
if ! type rvm >/dev/null 2>&1; then
  curl -sSL https://rvm.io/mpapis.asc | gpg --import -
  curl -L https://get.rvm.io | bash -s stable
  source /home/vagrant/.rvm/scripts/rvm
fi
