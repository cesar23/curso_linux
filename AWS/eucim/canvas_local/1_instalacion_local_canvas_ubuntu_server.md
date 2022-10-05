# instalacion localde canvas lms


# 1. Instale el administrador de versiones de Ruby (rvm) y los requisitos previos.

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
```  
  
  
# 3. instalar postgreSql
```shell
# instalamos
sudo apt -y install postgresql postgresql-contrib postgresql-client

sudo apt-get install -y git-core
```
