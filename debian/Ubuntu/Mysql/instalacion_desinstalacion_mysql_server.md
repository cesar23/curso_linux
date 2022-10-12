# instalcion de mysql server


# 1. instalacion de mysql
```shell
sudo apt install mysql-server

```



# 2. Desintalacion completa
```shell
sudo systemctl stop mysql

# purgar instalacion
sudo apt purge mysql-server mysql-client mysql-common mysql-server-core-* mysql-client-core-*

#Then delete all of the MySQL files:
sudo rm -rf /etc/mysql /var/lib/mysql /var/log/mysql


#Finally clean all packages that are not needed:
#List item
sudo apt autoremove
sudo apt autoclean



sudo apt-get clean &&
sudo apt-get purge mysql*
sudo apt-get update &&
sudo apt-get install -f &&
sudo apt-get install mysql-server-5.7
sudo apt-get dist-upgrade
```
