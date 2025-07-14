#!/bin/bash

# Update the package list and install necessary packages
sudo apt-get update
sudo apt-get install apache2 php php-mysql mysql-server sendmail -y

# Enable the MySQL extension in PHP
sudo phpenmod pdo_mysql
sudo service apache2 restart

# Download and install WordPress
cd /var/www/html
sudo rm -rf index.html
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xzvf latest.tar.gz
sudo rm latest.tar.gz
sudo mv wordpress/* .
sudo rm -rf wordpress
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

# Configure the WordPress database
sudo mysql -u root -p -e "CREATE DATABASE wordpress_db;"
sudo mysql -u root -p -e "GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password';"

# Install the newsletter plugin
cd /var/www/html/wp-content/plugins/
sudo wget https://downloads.wordpress.org/plugin/newsletter.zip
sudo unzip newsletter.zip
sudo rm newsletter.zip
sudo chown -R www-data:www-data /var/www/html/wp-content/plugins
sudo chmod -R 755 /var/www/html/wp-content/plugins

# Configure Sendmail to use the local mail server
sudo sed -i "s/^#\(.*\)\('sendmail_path'\)\(.*\)/\1\2 = '\/usr\/sbin\/sendmail -t -i'/" /etc/php/7.4/apache2/php.ini
sudo service apache2 restart

echo "WordPress and Newsletter plugin installation is complete!"
