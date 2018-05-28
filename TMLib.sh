#!/bin/bash
clear

# install Apache
sudo apt install apache2

# Run the commands below to disable directory listing.
sudo sed -i "s/Options Indexes FollowSymLinks/Options FollowSymLinks/" /etc/apache2/apache2.conf

# Check that Apache works properly
sudo systemctl stop apache2.service
sudo systemctl start apache2.service
sudo systemctl enable apache2.service

# Install MySQL
sudo apt-get install mysql-server

# Check that everything is correctly installed
systemctl status mysql

mysql_secure_installation

# Testing MySQL
mysqladmin -u root -p version

# PHP  add the below third party repository to upgrade to PHP 7.1
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ondrej/php

sudo apt update

# Install PHP
sudo apt install php7.1 libapache2-mod-php7.1 php7.1-common php7.1-mbstring php7.1-xmlrpc php7.1-soap php7.1-apcu php7.1-smbclient php7.1-ldap php7.1-redis php7.1-gd php7.1-xml php7.1-intl php7.1-json php7.1-imagick php7.1-mysql php7.1-cli php7.1-mcrypt php7.1-ldap php7.1-zip php7.1-curl

# Create a dB
sudo mysql -u root -p
echo Write a name for the database?
read varname

CREATE DATABASE varname;

read -p 'Choose a Username: ' uservar
read -sp 'Write a Password: ' passvar

echo
echo A database with Username $uservar was created with success.

CREATE USER uservar@'localhost' IDENTIFIED BY passvar;

GRANT ALL ON owncloud.* TO uservar@'localhost' IDENTIFIED BY passvar WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT;


# Download and Install Owncloud
cd /tmp && wget https://download.owncloud.org/community/owncloud-10.0.3.zip
unzip owncloud-10.0.3.zip
sudo mv owncloud /var/www/html/owncloud/

# Set up permissions
sudo chown -R www-data:www-data /var/www/html/owncloud/
sudo chmod -R 755 /var/www/html/owncloud/
