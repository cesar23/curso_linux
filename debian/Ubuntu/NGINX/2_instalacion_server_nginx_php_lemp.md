# 2. Instalar PHP
```shell
sudo add-apt-repository universe
# aqui instalalara php 8
sudo apt install -y php-fpm php-mysql

```
### 2.1 Configurar dominio web
editar `vim /etc/nginx/sites-available/cesar.peru.com`
```shell
server {
        listen 80;
        root /var/www/cesar.peru.com/html;
        index index.php index.html index.htm index.nginx-debian.html;

        server_name cesar.peru.com www.cesar.peru.com;

        location / {
                try_files $uri $uri/ =404;
        }
        
        # :::::: para evitar elacceso a los archivos .htaccess
        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                # aqui la version de php
                fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
        }
        
        # :::::: para evitar elacceso a los archivos .htaccess
        location ~ /\.ht {
                deny all;
        }
        
}

```

#### crasmo unarchivo de test
```shell
sudo nano /var/www/cesar.peru.com/html/info.php
```

### guardamos cambios en nginx
```shell
sudo nginx -t
sudo systemctl reload nginx
```
❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗
## ‼ Si hay error ver el log
❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗❗
```shell
tail -f /var/log/nginx/error.log
# ::::::::::: este error es por que en el archivo de configuraccion no tenemos la verion de php7.2 sino la 8.0
#    2022/10/10 04:39:30 [crit] 10617#10617: *4 connect() to unix:/var/run/php/php7.2-fpm.sock failed (2: No such file or directory) 
#    while connecting to upstream, client: 179.6.168.191, server: cesar.peru.com, request: "GET /info.php HTTP/1.1", 
#    upstream: "fastcgi://unix:/var/run/php/php7.2-fpm.sock:", host: "cesar.peru.com"
```
verificamos la version de php

```shell
root@server:~# php --version
#PHP 8.1.2 (cli) (built: Aug  8 2022 07:28:23) (NTS)
#Copyright (c) The PHP Group
#Zend Engine v4.1.2, Copyright (c) Zend Technologies
#    with Zend OPcache v8.1.2, Copyright (c), by Zend Technologies
```

modificamos el archivo  `vim /etc/nginx/sites-available/cesar.peru.com`
<img width="90%" src="https://i.imgur.com/KiGGsgg.png" alt="My cool logo"/>


```shell
server {
       ...
        # :::::: para evitar elacceso a los archivos .htaccess
        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                # aqui la version de php
                fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        }
        ...
}
```


# 2. Instalar Mysql
```shell
sudo apt install -y mysql-server php-mysql
```
Para proteger la instalación, MySQL viene con un script que preguntará si deseamos modificar algunos valores predeterminados no seguros. Inicie el script escribiendo lo siguiente:
