#!/usr/bin/bash

echo "ddd"
exit
#sudo -i # para  centos

sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443
sudo ufw enable


sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2


sudo apt install php libapache2-mod-php php-mysql php-common php-opcache  php-cli php-gd php-curl -y
sudo apt install  stress stress-ng unzip wget -y

# ponemos  como admin al usuario cesar
#echo 'cesar ALL=(ALL:ALL) ALL' >> /etc/sudoers

#sudo chown -R $USER.$USER /var/www/html/
#sudo chown -R root.root /var/www/html/
cd /var/www/html/
# descargamos nuestro codigo de strees para el servidor
wget https://gitlab.com/perucaos/utils_dev/-/raw/master/scripts/php/index.php

sudo rm /var/www/html/index.html
#sudo chown -R www-data.www-data /var/www/html/
#sudo chown -R root.root /var/www/html/
#chmod 0777 -R /var/www/html/*
