#!bin/bash
sudo -i
yum update -y --security
yum -y  install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# -- instalacion de la
yum -y install epel-release yum-utils
yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum-config-manager --enable remi-php74
yum -y install httpd php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysql
yum -y install  stress stress-ng unzip wget
sudo systemctl enable httpd
sudo systemctl start httpd

# ponemos  como admin al usuario cesar
#echo 'cesar ALL=(ALL:ALL) ALL' >> /etc/sudoers

#sudo chown -R $USER.$USER /var/www/html/
#sudo chown -R root.root /var/www/html/
cd /var/www/html
# descargamos nuestro codigo de strees para el servidor
wget https://gitlab.com/perucaos/utils_dev/-/raw/master/scripts/php/index.php

#sudo chown -R www-data.www-data /var/www/html/
#sudo chown -R root.root /var/www/html/
#chmod 0777 -R /var/www/html/*

# para  el se linux y  apache
sudo setsebool -P httpd_unified 1
sudo setsebool -P httpd_unified 1
# deshabilitamos el seLinux
sudo sed -i 's/enforcing/disabled/g' /etc/selinux/config

# para e l firewall
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
#
#sudo firewall-cmd --permanent --zone=public --add-service=http
#sudo firewall-cmd --permanent --zone=public --add-service=https
#
#sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
#sudo firewall-cmd --zone=public --add-port=443/tcp --permanent

sudo firewall-cmd --reload
