## comandos para poner en marcha docker
fuente:
- https://www.youtube.com/watch?v=6qR_EpxadMo&t=613s

# 1. 🏆Entramos a Digital ocean
```shell
ssh root@142.93.195.232
root@digi-ubuntu:~# sudo apt update
root@digi-ubuntu:~# sudo apt dist-upgrade
```

# 2. 🏆instalamos NVM node ( manejo de versiones en node)
```shell
# instalamos
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# volvemos  a leer la configuracion que ah realizado nvm
source ~/.bashrc

# ahora  instalamos nodejs
 nvm install node
 # nvm install node --lts
```

# 3. 🏆Clonamos o subimos el repositorio
```shell
# git clone ...

# subir 
cd /D/repos/curso_docker/Contenedores/ubuntu_express_ngnix_pm2

tar -czvf app.tar.gz * --exclude="node_modules"  --exclude="dist" --exclude='*.md'

scp  app.tar.gz root@142.93.195.232:~ 
```
# 4. 🏆Descomprimir mos el archivo
```shell
# creamos  caprta  y movemos el zip en la carpea
root@digi-ubuntu:~# mkdir -p project && mv app.tar.gz project
# entramo a la  carpeta  y descomprimimos
root@digi-ubuntu:~# cd project && tar -xzvf app.tar.gz
```
# 5. 🏆Instalamos las dependecias del app y Instalamos `pm2`
```shell
# instalamos dependecias node
root@digi-ubuntu:~# npm install
# hacemos  el build
root@digi-ubuntu:~# npm run build
# probamos
root@digi-ubuntu:~# npm run start

# ::::::::::::::pm2 (para crera un servicio paar que  al reiniccar el server se inicie nuestra app)
root@digi-ubuntu:~# npm install pm2 -g
# -le  damos
root@digi-ubuntu:~# cd ~/project
root@digi-ubuntu:~# pm2 start node ./src/index.js --name myapp
# para  crera los servicios que se ejecutaran despue de cada reinicio
root@digi-ubuntu:~# pm2 startup
root@digi-ubuntu:~# pm2 save
```

# 6. habilitar el firewall
```shell
root@digi-ubuntu:~# sudo ufw status
root@digi-ubuntu:~# sudo ufw enable
# qeu  que  tenemos activos en el firewall
root@digi-ubuntu:~# sudo ufw app list 
root@digi-ubuntu:~# sudo ufw allow ssh &&  sudo ufw allow http &&  sudo ufw allow https
root@digi-ubuntu:~# sudo ufw allow 'Nginx HTTP'
root@digi-ubuntu:~# sudo ufw reload 
```

# 7. Instalando NGINX
```shell
root@digi-ubuntu:~# sudo apt install nginx 

```

# 8. Adjuntar un dominio a server digital ocean

<img width="70%"  src="https://i.imgur.com/7ATJqS4.png" alt="My cool logo"/>

<img  width="70%" src="https://i.imgur.com/c4XeQl7.png" alt="My cool logo"/>

<img width="70%" src="https://i.imgur.com/GIwSVjT.png" alt="My cool logo"/>

<img width="70%" src="https://i.imgur.com/HMBULHu.png" alt="My cool logo"/>


# 9. configurando NGINX como proxi inverso
```shell
sudo nano /etc/nginx/sites-available/cesarauris.win
```
configurando `/etc/nginx/sites-available/cesarauris.win`
```shell
server {

    listen 80;
    server_name cesarauris.win www.cesarauris.win;

    location / {
        # es el servidor de nodejs
        proxy_pass http://localhost:5000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_cache_bypass $http_upgrade;
        
#        proxy_set_header Host $host;
#        proxy_set_header X-Real-IP $remote_addr;
#        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```
verificar si la  configuracion a sido correcta
```shell
root@digi-ubuntu:~# nginx -t
# nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
# nginx: configuration file /etc/nginx/nginx.conf test is successful
```
Ahora los ponemos en las sitios habilitado con un enlaze simbolico
```shell
sudo ln -s /etc/nginx/sites-available/cesarauris.win /etc/nginx/sites-enabled/cesarauris.win
```

y reiniciamos el servicio
```shell
systemctl reload nginx
systemctl restart nginx
systemctl status nginx
```



# 10 .instalacion nginx con certbot
fuente: https://certbot.eff.org/instructions?ws=nginx&os=ubuntufocal

video :https://www.youtube.com/watch?v=9nq7TZFHnm4&t=577s

### Ensure that your version of snapd is up to date
asegurar la instalacion este  actualizada
```shell
sudo snap install core; sudo snap refresh core
```

### .Remove certbot-auto and any Certbot OS packages
remover algunos repositorios instalados
```shell
sudo apt-get remove certbot
sudo dnf remove certbot
sudo yum remove certbot
```
###. Install Certbot
Run this command on the command line on the machine to install Certbot.

```shell
sudo snap install --classic certbot
```

### Prepare the Certbot command
Execute the following instruction on the command line on the machine to ensure that the certbot command can be run.

_Ejecutar la siguiente instruccion en la machina y asegurar que el comando certbot pueda correr_

```shell
sudo ln -s /snap/bin/certbot /usr/bin/certbot
```

### Choose how you'd like to run Certbot _(Elija cómo le gustaría ejecutar Certbot)_
certificado y haga que Certbot edite su configuración de nginx automáticamente para servirlo, activando el acceso HTTPS en un solo paso.

```shell
# aqui se generara unas preguntas para generar el certificado
sudo certbot --nginx
```

<img width="90%" src="https://i.imgur.com/YBbwuy2.png" alt="My cool logo"/>


### Test automatic renewal _(Probar la renovación automática)_
The Certbot packages on your system come with a cron job or systemd timer
that will renew your certificates automatically before they expire.
You will not need to run Certbot again, unless you change your configuration. You can test automatic renewal for your certificates by running this command:

```shell
sudo certbot renew --dry-run
```

🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸

The command to renew certbot is installed in one of the following locations:

_(El comando para renovar certbot se instala en una de las siguientes ubicaciones:)_

```shell
/etc/crontab/
/etc/cron.*/*
systemctl list-timers
```
