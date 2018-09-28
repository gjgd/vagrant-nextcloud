# Download required libs
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y remove mysql*
sudo apt-get -y install apache2 mariadb-server mariadb-client libapache2-mod-php7.0
sudo apt-get -y install php7.0-gd php7.0-json php7.0-mysql php7.0-curl php7.0-mbstring
sudo apt-get -y install php7.0-intl php7.0-mcrypt php-imagick php7.0-xml php7.0-zip
sudo apt-get -y install aptitude

# Download Nextcloud
git clone --branch v14.0.0 https://github.com/nextcloud/server.git nextcloud
cd nextcloud/
git checkout v14.0.0
git submodule update --init
cd ../
sudo cp -r nextcloud /var/www/

# Apache config
sudo cp nextcloud.conf /etc/apache2/sites-available/nextcloud.conf
sudo ln -s /etc/apache2/sites-available/nextcloud.conf /etc/apache2/sites-enabled/nextcloud.conf
sudo a2enmod rewrite
sudo a2enmod headers
sudo a2enmod env
sudo a2enmod dir
sudo a2enmod mime
sudo service apache2 restart

# Maria-db config
MYSQL_PASSWORD="root"
sudo bash mysql_secure.sh $MYSQL_PASSWORD
sudo mysql -u root -p"$MYSQL_PASSWORD" -e "create user admin@localhost identified by 'admin';"
sudo mysql -u root -p"$MYSQL_PASSWORD" -e "create database nextcloud;"
sudo mysql -u root -p"$MYSQL_PASSWORD" -e "grant all privileges on nextcloud.* to admin@localhost identified by 'admin';"
sudo mysql -u root -p"$MYSQL_PASSWORD" -e "flush privileges;"

# Nextcloud config
sudo chown -R www-data:www-data /var/www/nextcloud/
sudo -u www-data php /var/www/nextcloud/occ maintenance:install --database "mysql" --database-name "nextcloud" --database-user "admin" --database-pass "admin" --admin-user "admin" --admin-pass "admin"
echo "done";
