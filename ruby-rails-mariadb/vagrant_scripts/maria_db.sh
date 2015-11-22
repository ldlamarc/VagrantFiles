#MariaDB, this is a bit more complex, based on https://github.com/Lukx/vagrant-lamp/blob/master/components/mariadb.sh

# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.

echo "Installing MariaDB"


export DEBIAN_FRONTEND=noninteractive
MYSQL_PASS=$(pwgen -s 12 1);
MYSQL_VAGRANT_PASS=vagrant

debconf-set-selections <<< "mariadb-server-5.5 mysql-server/root_password password $MYSQL_PASS"
debconf-set-selections <<< "mariadb-server-5.5 mysql-server/root_password_again password $MYSQL_PASS"
apt-get -y install --allow-unauthenticated mariadb-server-5.5 mariadb-client-5.5 >/dev/null

if [ -f $VAGRANT_SYNCED_DIR/vagrant/.mysql-passes ]
  then
    rm -f $VAGRANT_SYNCED_DIR/vagrant/.mysql-passes
fi

echo "root:${MYSQL_PASS}" >> ${VAGRANT_SYNCED_DIR}/vagrant/.mysql-passes
echo "vagrant:${MYSQL_VAGRANT_PASS}" >> ${VAGRANT_SYNCED_DIR}/vagrant/.mysql-passes

mysql -uroot -p$MYSQL_PASS -e "CREATE USER 'vagrant'@'localhost' IDENTIFIED BY '$MYSQL_VAGRANT_PASS'"

echo "MariaDB Root Passwords has been stored to .mysql-passes in your vagrant directory."
mysql -uroot -p$MYSQL_PASS -e "CREATE DATABASE vagrant DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;"
mysql -uroot -p$MYSQL_PASS -e "GRANT ALL ON vagrant TO 'vagrant'@'localhost';" mysql

echo "Created vagrant database"
