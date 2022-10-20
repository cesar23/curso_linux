# instalar Canvas LMS - Repositorio

## 1. Database installation and configuration
```shell
sysadmin@dbserver:~$ sudo apt update && sudo apt-get install -y postgresql-12
```
Configuring Postgres
```shell
# createuser will prompt you for a password for database user
sysadmin@dbserver:~$ sudo -u postgres createuser canvas --no-createdb \
   --no-superuser --no-createrole --pwprompt
   
sysadmin@dbserver:~$ sudo -u postgres createdb canvas_production --owner=canvas
```

## 2. Getting the code
Descargar El tar oficial
<img width="90%" src="https://i.imgur.com/1zZY3Fy.png" alt="My cool logo"/>

2.1 instalacion y descarga
```shell
sudo mkdir -p /var/canvas
sudo chown -R $USER:$USER /var/canvas
cd /var/canvas

curl -A 'Mozilla/3.0 (Win95; I)' -L -o /var/canvas/prod.tar.gz  "https://github.com/instructure/canvas-lms/archive/prod.tar.gz"
cesar@canvas:/var/canvas$ ll
# drwxr-xr-x  3 cesar cesar     4096 Oct 19 17:49 ./
# drwxr-xr-x 14 root  root      4096 Oct 19 17:43 ../
# drwxrwxr-x 26 cesar cesar     4096 Oct 14 15:23 canvas-lms-prod/
# -rw-rw-r--  1 cesar cesar 60929823 Oct 19 17:47 
cesar@canvas:/var/canvas$ tar -xzvf prod.tar.gz
cesar@canvas:/var/canvas$ cp -av canvas-lms-prod/* /var/canvas
cesar@canvas:/var/canvas$ rm ./prod.tar.gz && rm -rf canvas-lms-prod

# ya  aqui estaria listo en nuestra  carpeta /var/canvas

```


## 3. Dependency and Installation

#### 3.1 Instalacion de Ruby
Instalacion de dependencias de ruby
```shell
cesar@canvas:/var/canvas$ sudo apt-get install software-properties-common
cesar@canvas:/var/canvas$ sudo add-apt-repository ppa:brightbox/ruby-ng
cesar@canvas:/var/canvas$ sudo apt-get update
```

Instalacion de ruby 2.7
```shell
cesar@canvas:/var/canvas$ sudo apt-get install ruby2.7 ruby2.7-dev zlib1g-dev libxml2-dev \
                       libsqlite3-dev postgresql libpq-dev \
                       libxmlsec1-dev curl make g++
```

#### 3.2 isntalaciond e Node y Yarn
```shell
#cesar@canvas:/var/canvas$ curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
# sudo apt purge nodejs -y
cesar@canvas:/var/canvas$ curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
cesar@canvas:/var/canvas$ sudo apt-get install nodejs
# ::::::::::  ya no  es  necesario
# cesar@canvas:/var/canvas$ sudo npm install -g npm@latest
```
After installing Postgres, you will need to set your system username as a postgres superuser. You can do so by running the following commands:
```shell
cesar@canvas:/var/canvas$ sudo -u postgres createuser $USER
cesar@canvas:/var/canvas$ sudo -u postgres psql -c "alter user $USER with superuser" postgres
```

## 4. Ruby Gems

```shell
cesar@canvas:/var/canvas$ sudo gem install bundler --version 2.2.19 --default
cesar@canvas:/var/canvas$ RAILS_ENV=production bundle 2.2.19 exec rake canvas:compile_assets
cesar@canvas:/var/canvas$ bundle _2.2.19_ install --path vendor/bundle
cesar@canvas:/var/canvas$ bundle install --path vendor/bundle
# :---------------------------------------------------
# :::opcion que  funciono
sudo apt-get install -y libldap2-dev
sudo apt-get install -y libidn11-dev
sudo apt-get install -y libghc-gnuidn-dev

sudo gem install bundler 
# bundle config set --local path 'vendor/bundle'
bundle install --path vendor/bundle

```

## 5. Yarn Installation
```shell
cesar@canvas:/var/canvas$ curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
cesar@canvas:/var/canvas$ echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
cesar@canvas:/var/canvas$ sudo apt-get update && sudo apt-get install yarn=1.19.1-1
```
Also, make sure python is installed (needed for contextify package)

```shell
sysadmin@appserver:/var/canvas$ sudo apt-get install python
```

Instalaremos  los  modulos por Yarn

```shell
sysadmin@appserver:/var/canvas$ sudo yarn install
```
