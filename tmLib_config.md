# Basic Configurations

## PHP

* Run the following command to open the PHP init file:

sudo nano /etc/php/7.1/apache2/php.ini

* Make the change the following lines below in the file and save.

file_uploads = On
allow_url_fopen = On
memory_limit = 256M
upload_max_file_size = 100M
display_errors = Off
date.timezone = America/Chicago

* Save the file and exit.

## Apache2

* Run the following command in a terminal to open the owncloud config

sudo nano /etc/apache2/sites-available/owncloud.conf

* Copy and paste the content below into the file and save it. Replace the highlighted line with your own domain name and directory root location.

<VirtualHost *:80>
     ServerAdmin admin@example.com
     DocumentRoot /var/www/html/owncloud/
     ServerName example.com
     ServerAlias www.example.com
     Alias /owncloud "/var/www/html/owncloud/"
     <Directory /var/www/html/owncloud/>
        Options +FollowSymlinks
        AllowOverride All
        Require all granted
          <IfModule mod_dav.c>
            Dav off
          </IfModule>
        SetEnv HOME /var/www/html/owncloud
        SetEnv HTTP_HOME /var/www/html/owncloud
     </Directory>
     ErrorLog ${APACHE_LOG_DIR}/error.log
     CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

* Save the file and exit.

## Enable the Owncloud and Rewrite Module

* Open a terminal and run the following commands to enable the VirtualHost
sudo a2ensite owncloud.conf
sudo a2enmod rewrite
sudo a2enmod headers
sudo a2enmod env
sudo a2enmod dir
sudo a2enmod mime


## Restart Apache2

* To load the settings, open a terminal and execute the following command:

sudo systemctl restart apache2.service

### More information can be found in https://websiteforstudents.com/install-owncloud-on-ubuntu-18-04-lts-beta-with-apache2-mariadb-and-php-7-1-support/
