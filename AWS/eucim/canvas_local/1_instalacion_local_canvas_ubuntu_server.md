# instalacion localde canvas lms


# 1. Instale el administrador de versiones de Ruby (rvm) y los requisitos previos.

fuente y tutorial oficial de RVM
- https://rvm.io/
```shell
sudo apt-get --assume-yes update
# aqui hay dos  repos
  # Opcion 1:
  command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
  # Opcion 2: 
  command curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -

# descargamos e instalamos el script
curl -L https://get.rvm.io | bash -s stable
# ponemos en ccontexto el sccript descargado
source ~/.rvm/scripts/rvm
```  


# 2. Use rvm para instalar Ruby.
Por ejemplo, instale la versión 2.6.6 de Ruby:

```shell
rvm install 2.6.6
# poner como defecto la version de ruby
rvm use 2.6.6 --default
ruby -v
# ----instalamos ruby rails
gem install rails -v 6.0.4.1
gem install bundler

# verificar nuestra version de rials
rails -v


```  
## 2.2 tambien instalamos nodeJS
```shell
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash 
sudo apt-get install -y nodejs
```

## 2.3 Instalar pqeues app test
```shell
cesar@cesarserver:~$ rails new appdemo

```
  
# 3. instalar postgreSql
```shell
# instalamos
sudo apt -y install postgresql postgresql-contrib postgresql-client

sudo apt-get install -y git-core
```

```shell
sudo apt-get install ruby2.6-dev zlib1g-dev libxml2-dev \
                       libsqlite3-dev postgresql libpq-dev \
                       libxmlsec1-dev curl make g++
                       
# desde al pagina de canvas lms                       
sudo apt install git curl autoconf libxml2-dev libsqlite3-dev libpq-dev 
sudo apt install libxmlsec1-dev make g++ 
# extras
sudo apt install -y bison build-essential libssl-dev libyaml-dev
sudo apt install -y libreadline6-dev zlib1g-dev libncurses5-dev
sudo apt install -y libffi-dev libgdbm6 libgdbm-dev libdb-dev                       
                       
```
