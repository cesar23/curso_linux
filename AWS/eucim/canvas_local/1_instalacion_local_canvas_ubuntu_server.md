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

# 👁‍🗨 Y Importante YARN 
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt -y update
sudo apt -y install yarn
yarn --version

```

## 2.3 Instalar APP test para saber qeu  funciona Rails 2.6 perfectamente
fuente: 
- https://www.youtube.com/watch?v=wSNTT8MLI90

```shell
cesar@cesarserver:~$ cd  /home/cesar
# generiamos la aplicacion
cesar@cesarserver:~$ rails new appdemo
# entramos a la  app
cesar@cesarserver:~$ cd /home/cesar/appdemo
# probamos la app
cesar@cesarserver:~$ rails server
cesar@cesarserver:~$ rails s --binding=0.0.0.0 # para  exponerlo fuera de la  red
# si da  error ejecutar
cesar@cesarserver:~$ bundle exec rails webpacker:install

```
  
# 3. instalar postgreSql
```shell
# instalamos
sudo apt -y install postgresql postgresql-contrib postgresql-client libpq-dev

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

# 4. Instalar  NGINX y Passenger

```shell
sudo apt-get install -y nginx-extras
```

Repositorio **Phusion** aloja un repositorio que contiene la última versión de Phusion Passenger. Para agregar esto al administrador de paquetes, primero instale la clave Phusion PGP:

```shell

sudo apt-get install -y dirmngr gnupg
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
sudo apt-get install -y apt-transport-https ca-certificates



#sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger stretch main > /etc/apt/sources.list.d/passenger.list'
#sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger bionic main > /etc/apt/sources.list.d/passenger.list'
echo "deb https://oss-binaries.phusionpassenger.com/apt/passenger focal main" | sudo tee /etc/apt/sources.list.d/passenger.list
sudo apt-get update
sudo apt-get install -y libnginx-mod-http-passenger
```

### Enable Passenger Support and Start NGINX
NGINX ahora está instalado en el sistema, pero la compatibilidad con Phusion Passenger no está habilitada. Como root, o con el comando sudo, abra el archivo `/etc/nginx/conf.d/mod-http-passenger.conf` y verifique que las siguientes dos líneas estén presentes y sin comentarios:

verificar qeu eesten las siguientes  lineas: `cat /etc/nginx/conf.d/mod-http-passenger.conf`
```shell
passenger_root /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini;
passenger_ruby /usr/bin/passenger_free_ruby;
```
<img width="90%" src="https://i.imgur.com/quIV28Z.png" alt="My cool logo"/>

#### habilitar pasenger en configuracion de NGinx
editar el archivo `sudo nano /etc/nginx/nginx.conf`

Now we’ll restart nginx to make our changes take effect.

```shell
sudo service nginx restart
```


### validamos  passenger

```shell
sudo /usr/bin/passenger-config validate-install
```
<img width="90%" src="https://i.imgur.com/Mu5FoTn.png" alt="My cool logo"/>

```shell
sudo /usr/sbin/passenger-memory-stats
```
<img width="90%" src="https://i.imgur.com/V4aPJjn.png" alt="My cool logo"/>




<img width="90%" src="https://i.imgur.com/JwaUOIM.png" alt="My cool logo"/>

# 5. Crear los virtaul host para Nginx


Since you are using RVM, you will need to specify which version of Ruby should be used by Passenger:

```shell
cesar@cesarserver:~/appdemo$  rvm use
# output:
#    Using /home/cesar/.rvm/gems/ruby-2.6.6



cesar@cesarserver:~/appdemo$  passenger-config --ruby-command
# output:
#   passenger-config was invoked through the following Ruby interpreter:
#     Command: /home/cesar/.rvm/gems/ruby-2.6.6/wrappers/ruby
#     Version: ruby 2.6.6p146 (2020-03-31 revision 67876) [x86_64-linux]
#     To use in Apache: PassengerRuby /home/cesar/.rvm/gems/ruby-2.6.6/wrappers/ruby
#     To use in Nginx : passenger_ruby /home/cesar/.rvm/gems/ruby-2.6.6/wrappers/ruby
#     To use with Standalone: /home/cesar/.rvm/gems/ruby-2.6.6/wrappers/ruby /usr/bin/passenger start
#   
#   
#   ## Notes for RVM users
#   Do you want to know which command to use for a different Ruby interpreter? 'rvm use' that Ruby interpreter, then re-run 'passenger-config about ruby-command'.

```


editar el archivo `sudo nvim /etc/nginx/sites-enabled/default`
```shell
server {
        listen 80 default_server;

        root /home/cesar/appdemo/public;

        index index.html index.htm index.nginx-debian.html;

        server_name _;

        # Important: delete the following 3 lines
        # location / {
        #         try_files $uri $uri/ =404;
        # }

        passenger_enabled on;
        
        # se genera con  comando : passenger-config --ruby-command
        passenger_ruby /home/cesar/.rvm/gems/ruby-2.6.6/wrappers/ruby;
}



```


# realizar el bundle
```shell

cd /home/cesar/appdemo
# darle permisos
sudo chown -R www-data:www-data .

bundle
bundle --deployment
bundle --no-deployment

# reiniciamos pasenger
passenger-config restart-app $(pwd)




```


# si hay errores y hay qeu  modifcar
```shell
sudo chown -R $USER:$USER .
# despues de modificar regresarlo
sudo chown -R www-data:www-data .

# remover fichero
rm config/credentials.yml.enc
```
