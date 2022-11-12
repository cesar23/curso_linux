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
rvm use 2.6.6 --canvas.cesar.com.conf
ruby -v
# ----instalamos ruby rails
gem install rails -v 6.0.4.1
gem install bundler

# verificar nuestra version de rials
rails -v


```  
## 2.2 tambien instalamos nodeJS y Yarn
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
# instalamos bundle
cesar@cesarserver:~$ sudo gem install bundler
cesar@cesarserver:~$ bundle install
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
```
# 4. Instalar utilidades para ruby
```shell
sudo apt-get install -y git-core
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

# 4. Instalar  NGINX 

```shell
sudo apt-get install -y nginx-extras
```


# 5. configurar proyecto rails

entrar al proyecto y ejecutaar los comandos

### 5.1 configurar puma
```shell
# crear directorios
sudo mkdir -p /run/puma/canvas
# para que pueda  escribir por ahora despues le  canviamos los permisos a www-data
sudo chown -R $USER:$USER  /run/puma/canvas/
# Opcionales:
    # sudo chmod 777 -R /run/puma/canvas
    # sudo chown -R www-data:www-data  /run/puma/canvas/
```
ahora  configuraremos nuestro proyecto
```shell
# entramso  a nuestra  app
cd  /home/cesar/appdemo


RAILS_ENV=production
RAILS_ENV=production rake db:migrate
RAILS_ENV=production rails assets:precompile
# rails assets:precompile
# para  verificar
yarn install --check-files

# compilamos
bundle
bundle --deployment
bundle --no-deployment
# para  instalar  paquetes 
bundle exec rails  webpacker:install

# preferencia  ejecutar el proyecto con
bundle exec puma
# editamos el archivo del puma server
nano config/puma.rb
```
Configuraremos el puma
archivo de `nano config/puma.rb`

```shell
# cuantos procesadores tenemos: ejecutar( grep -c processor /proc/cpuinfo )
workers 2
threads 0, 1
queue_requests false
worker_boot_timeout 300

bind 'unix:///run/puma/canvas/canvas.socket'
#activate_control_app 'unix:///run/puma/canvas/canvas-pumactl.socket', { no_token: true }
directory '/home/cesar/appdemo'
environment ENV.fetch('RAILS_ENV', 'production')
# prune_bundler
preload_app!
```
probar configuracion con socket
```shell
puma -b 'unix:///run/puma/canvas/canvas.socket'
```

# 6. configurar Nginx
configurar `nano /etc/nginx/sites-available/canvas.cesar.com.conf`

```shell

server {
        listen 80;
        server_name canvas.cesar.com;
        access_log /var/log/nginx/canvas.cesar.com-access.log ;
        error_log  /var/log/nginx/canvas.cesar.com-error.log info;
        root /home/cesar/appdemo/public;

        location / {
               try_files $uri @app;
           }

        location @app {
            include fastcgi_params;
            proxy_pass http://unix:/run/puma/canvas/canvas.socket;
            # agregados
            proxy_set_header X-Real-IP  $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header Host $http_host;
            proxy_set_header X-NginX-Proxy true;
            proxy_set_header X-Forwarded-Proto: $scheme;
        }

}

```
# 7. configurar servicios


# instalar Servicios 
agregar archivo de servicio `sudo nano /etc/systemd/system/canvas.service`

```shell
[Unit]
After=network.target
#Requires=canvas.socket

[Service]
User=www-data
User=cesar
UMask=0002
RuntimeDirectory=puma/canvas
WorkingDirectory=/home/cesar/appdemo
# Greatly reduce Ruby memory fragmentation and heap usage
# https://www.mikeperham.com/2018/04/25/taming-rails-memory-bloat/
Environment=MALLOC_ARENA_MAX=2
#Environment=PUMA_DEBUG=1
#ExecStart=/bin/bash -lc 'bundle exec puma'
ExecStart=/bin/bash -lc 'puma -b unix:///run/puma/canvas/canvas.socket'
#ExecStart=/bin/bash -lc 'bundle exec --keep-file-descriptors puma'
Restart=on-failure
RestartSec=3

[Install]
WantedBy=multi-user.target
```

# si hay errores y hay que  modifcar
```shell
sudo chown -R $USER:$USER .
# despues de modificar regresarlo
sudo chown -R www-data:www-data .

# remover fichero
rm config/credentials.yml.enc
```
## Ver logs de la  aplicacion
```shell
# entrar a la app
tail -f log/development.log
tail -f log/production.log
```
