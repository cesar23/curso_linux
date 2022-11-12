# instalacion localde canvas lms


# 1. Instale el administrador de versiones de Ruby 


```shell
sudo apt-get install -y software-properties-common
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update

# install ruby
sudo apt-get install -y ruby2.6 ruby2.6-dev zlib1g-dev libxml2-dev \
                       libsqlite3-dev postgresql libpq-dev \
                       libxmlsec1-dev curl make g++

# instalar  rails                       
sudo gem install rails -v 6.0.4.1              

```  


## 2.2 tambien instalamos nodeJS 14 y Yarn
```shell

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install nodejs
#sudo npm install -g npm@latest
sudo npm install -g npm@6.14.15 # se uso en canvas del aws



curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash 
sudo apt-get install -y nodejs

# 👁‍🗨 Y Importante YARN 
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt -y update
sudo apt -y install yarn
yarn --version

```
## 2.3 Actualizar postgresql
```shell
sudo -u postgres createuser $USER
sudo -u postgres psql -c "alter user $USER with superuser" postgres
```

## 2.4 Yarn Installation
```shell
sysadmin@appserver:/var/canvas$ curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sysadmin@appserver:/var/canvas$ echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sysadmin@appserver:/var/canvas$ sudo apt-get update && sudo apt-get install yarn=1.19.1-1
```
Also, make sure python is installed (needed for contextify package)

```shell
sysadmin@appserver:/var/canvas$ sudo apt-get install python
```
Then install the node modules:

```shell
sysadmin@appserver:/var/canvas$ sudo yarn install
```
-- -----------------------------------------------------------------------

# 4. Instalar  NGINX 

```shell
sudo apt-get install -y nginx-extras
```

# 5. configurar Nginx
configurar `nvim /etc/nginx/conf.d/canvas.conf`

```shell

server {
        listen 80;
        server_name canvas.cesar.com;
        access_log /var/log/nginx/canvas.cesar.com-access.log ;
        error_log  /var/log/nginx/canvas.cesar.com-error.log info;
        root /srv/canvas/current/public;

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

#### reiniciamos ngnix
```shell
sudo nginx -t
sudo systemctl restart nginx
```

# 6. configurar servicios

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
WorkingDirectory=/srv/canvas/current
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
## 7. instalar en el directorio de canvas
```shell
cd  /srv/canvas/current
sudo gem install bundler
bundle install
bundle install --path vendor/bundle

# ::limpieza si  sale  mal
rm -rf ./build/* && rm -rf ./vendor/* && rm -rf ./gems/*
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
cd  /srv/canvas/current


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
directory '/srv/canvas/current'
environment ENV.fetch('RAILS_ENV', 'production')
# prune_bundler
preload_app!
```

probar configuracion con socket
```shell
puma -b 'unix:///run/puma/canvas/canvas.socket'
```


# modificar archivos
```shell
cd /srv/canvas/current/
nvim config/database.yml
nvim config/outgoing_mail.yml
# Security: Random hashing at 
nvim config/security.yml
nvim config/domain.yml
nvim config/dynamic_settings.yml
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
tail -f /srv/canvas/current/log/production.log
systemctl status canvas.service
```
