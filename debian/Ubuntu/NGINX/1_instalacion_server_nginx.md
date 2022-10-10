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
