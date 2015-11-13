Perfect for simple Rails projects.

By Laurens De la Marche

##Description

Ubuntu trusty64 (14) provisioned by Vagrant. Includes Ruby v2.2, bundler, Git, MariaDB, GarphViz.

##Prerequisites
Vagrant and Virtualbox.

##Installation

```console
vagrant up
```

You will be asked for your password, this is to setup the NFS between local host and Ubuntu image.

###MariaDB Root Passwords

They are generated randomly and stored in .mysql-passes in your vagrant directory (on your host). See Vagrantfile for more details.

##Usage

```console
vagrant ssh
```

Folders inside your vagrant folder (folder in which the Vagrantfile is found) will be available in your Ubuntu image (via NFS).

To find the NFS

```console
cd ../../vagrant
```

```console
exit
```

exits image.

##RVM

ruby -v returns 1.9.3 in your image.

But if you switch to the project, RVM uses ruby 2.2.1 (it looks at the gemfile)

Do not use 'sudo gem install ...'! https://rvm.io/rubies/rubygems

You might still be required to run non_gemfile_gems.sh in your Ubuntu image if bundler/listen isn't correctly installed.

```console
sh non_gemfile_gems.sh
```


###Upgrading ruby?

```console
rvm install 2.2.3
```

In Gemfile

ruby '2.2.3'


##Git

Configure your git details in your Ubuntu image:
```console
git config --global user.name "YOUR NAME"
```
```console
git config --global user.email "YOUR EMAIL ADDRESS"
```

No need to install Git on your host.

Git clone the project (inside your vagrant folder (on host or on image))

```console
git clone https://github.com/user/sample_app.git
```

##Programming

You can use your favorite editor on your local host machine. Direct it to the files in the NFS. You can also chose to issue git commands on your host machine instead of in your Ubuntu image.

##Starting Rails server

This is done inside your Ubuntu image. No need to install Rails/MariaDB/bundler on your host.

```console
rails s -b 0.0.0.0
```

##Guard

If you edit files on your host then Guard (which runs on your Ubuntu image) doesn't pick them up. You can send notifications via

```console
listen -f 192.168.50.1:4000 -v -r
```
Listen need to be installed. This is a Ruby gem so it does require ruby on the host machine.

Tested with:
listen (2.10.1)

Running Guard on Ubuntu image:

```console
guard --no-bundler-warning -o '192.168.50.1:4000' -w '<local base folder on host>/<app_directory>'
```

where 'local_base_folder' is the folder that contains your Vagrant file on you local host.

app_directory is the path in your NFS to the app, example: workspace/sample_app

## License

MIT License
















