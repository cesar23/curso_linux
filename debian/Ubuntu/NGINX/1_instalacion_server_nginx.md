# instalaciond e servidor ngnix





## 1. instalacion de paquete
```shell
sudo apt update && \
sudo apt -y install nginx 
```

## 2. verificar firewall
```shell
sudo ufw app list
sudo ufw allow ssh
sudo ufw allow 'Nginx HTTP'
sudo ufw status
sudo ufw enable
```

## 3.Processos
```shell
sudo systemctl stop nginx
sudo systemctl start nginx
sudo systemctl restart nginx
sudo systemctl reload nginx

# habilitar y Deshabilitar servicio
sudo systemctl disable nginx
sudo systemctl enable nginx

# Reinicar Servicio
pkill -9 nginx   &&  nginx -c /etc/nginx/nginx.conf &&  nginx -s reload

```
## 4. Configurar bloques de servidor (recomendado)
```shell
# creamos el directorio
sudo mkdir -p /var/www/cesar.peru.com/html
# le asignamos los permisos
sudo chown -R $USER:$USER /var/www/cesar.peru.com/html
# o cambiar
sudo chown -R www-data:www-data /var/www/cesar.peru.com/html
# le asignamos los permisos
sudo chmod -R 755 /var/www/cesar.peru.com
# creamos un  index
nano /var/www/cesar.peru.com/html/index.html
```
ingresmao el contenido en el `index.html`
```html
<html>
    <head>
        <title>Welcome to cesar.peru.com</title>
    </head>
    <body>
        <h1>Success!  cesar.peru.com</h1>
    </body>
</html>
 ```


## 5. configuramos el dominio

```shell
sudo nano /etc/nginx/sites-available/cesar.peru.com
```
con el siguiente contenido
```shell
server {
        listen 80;
        listen [::]:80;

        root /var/www/cesar.peru.com/html;
        index index.html index.htm index.nginx-debian.html;

        server_name cesar.peru.com www.cesar.peru.com;

        location / {
                try_files $uri $uri/ =404;
        }
}
```
A continuación, habilitaremos el archivo creando un enlace entre él y el directorio sites-enabled, en el cual Nginx obtiene lecturas durante el inicio:

```shell
sudo ln -s /etc/nginx/sites-available/cesar.peru.com /etc/nginx/sites-enabled/
```

##### Para evitar un problema de memoria de depósito de hash que pueda surgir al agregar nombres de servidor, es necesario aplicar ajustes a un valor en el archivo `/etc/nginx/nginx.conf`. Abra el archivo:
```shell
sudo nano /etc/nginx/nginx.conf
```
Encuentre la directiva `server_names_hash_bucket_size` y borre el símbolo # para eliminar el comentario de la línea. Si utiliza nano, presione CTRL y w para buscar rápidamente palabras en el archivo.

```shell
...
http {
    ...
    server_names_hash_bucket_size 64;
    ...
}
...
```

### A continuación, compruebe que no haya errores de sintaxis en ninguno de sus archivos de Nginx:

```shell
# verificamos la configuracion
sudo nginx -t
sudo systemctl restart nginx
```

#### Ver log  de nginx
```shell
sudo tail -f /var/log/nginx/error.log
```

### Verificar que este corriendo
```shell
 sudo netstat -tlpn | grep nginx
```
<img width="100%" src="https://i.imgur.com/Sa0WrhF.png" alt="My cool logo"/>

-- -- 


### asegurar server con Permisos
```shell
sudo find /var/www/cesar.peru.com/ -type d -exec chmod 755 "{}" \;
sudo find /var/www/cesar.peru.com/ -type f -exec chmod 644 "{}" \;
```

# 6. para porbarlos localmente en windows
Editaremos alarchivo `C:\Windows\System32\drivers\etc\hosts`
y le agregamos
```shell
# apra que apunte y haga  la  simulacion
159.223.181.200 cesar.peru.com
```
<img width="100%" src="https://i.imgur.com/p7HkVDZ.png" alt="My cool logo"/>


# Generando SSL
fuente: https://www.tecmint.com/install-nginx-with-virtual-hosts-and-ssl-certificate/

To create a self-signed certificate, first create a directory where your certificates will be stored.

```shell
$ sudo mkdir /etc/nginx/ssl-certs/
```
Then generate your self-signed certificate and the key using the openssl command line tool.

```shell
$ sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl-certs/nginx.key -out /etc/nginx/ssl-certs/nginx.crt

```


<img width="100%" src="https://i.imgur.com/2fjrJyv.png" alt="My cool logo"/>

-- -- 


### ahora crearemos el fichro de configuracion
ubicacion del fichero`/etc/nginx/conf.d/cesar.peru.com.conf`

```shell
server {
    listen 80;
    listen [::]:80;
    listen 443 ssl;
    listen [::]:443 ssl;
    
    ssl on;
    ssl_certificate /etc/nginx/ssl-certs/nginx.crt;
    ssl_trusted_certificate /etc/nginx/ssl-certs/nginx.crt;
    ssl_certificate_key /etc/nginx/ssl-certs/nginx.key;
    
    server_name  wearetecmint.com;
    root           /var/www/html/wearetecmint.com/public_html;
    index          index.html;
    location / {
                try_files $uri $uri/ =404;
        }

}
```