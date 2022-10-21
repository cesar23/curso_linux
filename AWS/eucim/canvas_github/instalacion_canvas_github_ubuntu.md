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
# si hay erroers  ejecutar
rm -rfv gems/plugins/*/node_modules
bundle exec rake canvas:compile_assets


```


## Canvas default configuration
Before we set up all the tables in your database, our Rails code depends on a small few configuration files, which ship with good example settings, so, we'll want to set those up quickly. We'll be examining them more shortly. From the root of your Canvas tree, you can pull in the default configuration values like so:

```shell
sysadmin@appserver:/var/canvas$ for config in amazon_s3 database \
delayed_jobs domain file_store outgoing_mail security external_migration; \
do cp config/$config.yml.example config/$config.yml; done
```


## Dynamic settings configuration
This config file is useful if you don't want to run a consul cluster with canvas. Just provide the config data you would like for the DynamicSettings class to find, and it will use it whenever a call for consul data is issued. Data should be shaped like the example below, one key for the related set of data, and a hash of key/value pairs (no nesting)

```shell
sysadmin@appserver:/var/canvas$ cp config/dynamic_settings.yml.example config/dynamic_settings.yml
sysadmin@appserver:/var/canvas$ nano config/dynamic_settings.yml
```

## Database configuration
Now we need to set up your database configuration to point to your Postgres server and your production databases. Open the file config/database.yml, and find the production environment section. You can open this file with an editor like this:

```shell
sysadmin@appserver:/var/canvas$ cp config/database.yml.example config/database.yml
sysadmin@appserver:/var/canvas$ nano config/database.yml
```


## Outgoing mail configuration
For Canvas to work properly, you need an outgoing SMTP mail server. All you need to do is get valid outgoing SMTP settings. Open config/outgoing_mail.yml:

```shell
sysadmin@appserver:/var/canvas$ cp config/outgoing_mail.yml.example config/outgoing_mail.yml
sysadmin@appserver:/var/canvas$ nano config/outgoing_mail.yml
```

Find the production section and configure it to match your SMTP provider's settings. Note that the domain and outgoing_address fields are not for SMTP, but are for Canvas. domain is required, and is the domain name that outgoing emails are expected to come from. outgoing_address is optional, and if provided, will show up as the address in the From field of emails Canvas sends.

If you don't want to use authentication, simply comment out the lines for user_name, password, and authentication.


## URL configuration
In many notification emails, and other events that aren't triggered by a web request, Canvas needs to know the URL that it is visible from. For now, these are all constructed based off a domain name. Please edit the production section of config/domain.yml to be the appropriate domain name for your Canvas installation. For the domain field, this will be the part between http:// and the next /. Instructure uses canvas.instructure.com.
```shell

sysadmin@appserver:/var/canvas$ cp config/domain.yml.example config/domain.yml
sysadmin@appserver:/var/canvas$ nano config/domain.yml
```


## Security configuration
You must insert randomized strings of at least 20 characters in this file:

```shell
sysadmin@appserver:/var/canvas$ cp config/security.yml.example config/security.yml

sysadmin@appserver:/var/canvas$ nano config/security.yml
```

## Generate Assets
Canvas needs to build a number of assets before it will work correctly. First, create the directories that will store the generated files. See the Canvas ownership section below in case you want to plan to assign ownership to canvasuser and the user does not exist yet.

```shell
sysadmin@appserver:~$ cd /var/canvas
sysadmin@appserver:/var/canvas$ mkdir -p log tmp/pids public/assets app/stylesheets/brandable_css_brands
sysadmin@appserver:/var/canvas$ touch app/stylesheets/_brandable_variables_defaults_autogenerated.scss
sysadmin@appserver:/var/canvas$ touch Gemfile.lock
sysadmin@appserver:/var/canvas$ touch log/production.log
sysadmin@appserver:/var/canvas$ sudo chown -R $USER config/environment.rb log tmp public/assets \
app/stylesheets/_brandable_variables_defaults_autogenerated.scss \
app/stylesheets/brandable_css_brands Gemfile.lock config.ru

```
Then will need to run:

```shell
sysadmin@appserver:/var/canvas$ sudo yarn install # Error aqui 🟠🔴
sysadmin@appserver:/var/canvas$ npm install
sysadmin@appserver:/var/canvas$ sudo RAILS_ENV=production bundle exec rake canvas:compile_assets
sysadmin@appserver:/var/canvas$ sudo chown -R canvasuser public/dist/brandable_css
```
Subsequent Updates (NOT NEEDED FOR INITIAL DEPLOY)

If you are updating code, and you run canvas:compile_assets in a place that does not have a database connection, then you'll also want to run the following once code is in place and an active DB connection exists, in order to full update existing themes:

sysadmin@appserver:/var/canvas$ sudo RAILS_ENV=production bundle exec rake brand_configs:generate_and_upload_all
