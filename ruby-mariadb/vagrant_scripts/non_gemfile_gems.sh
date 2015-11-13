echo "Installing non_gemfile gems via RVM, ruby 2.2.1"

rvm use --default 2.2.1

echo "-Installing Bundler"
gem install bundler >/dev/null

#Listen gem for guard
echo "-Installing listen gem"
gem install listen thor celluloid-io >/dev/null
