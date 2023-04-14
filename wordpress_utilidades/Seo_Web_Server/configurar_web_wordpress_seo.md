## 1. en el archivo htacces poner la redireccion Https y bloqueo de xmlrp
editar el .htaccess
```ini
# ----------------------------------------------
# --------------------- START Agregado por cesar
# ----------------------------------------------
# START XML RPC BLOCKING
<Files xmlrpc.php>
Order Deny,Allow
Deny from all
</Files>
# FINISH XML RPC BLOCKING

# START REDICRECT HTTP TO HTTPS
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteCond %{HTTPS} !=on
RewriteRule .* https://%{HTTP_HOST}%{REQUEST_URI} [L]
</IfModule>
# END REDICRECT HTTP TO HTTPS

# ----------------------------------------------
# --------------------- END Agregado por cesar
# ----------------------------------------------
```
## 2. generar el archivo robots.txt


modificaremos el fichero `robots.txt`
```
User-agent: *
Disallow: /wp-admin/
Allow: /wp-admin/admin-ajax.php

Sitemap: https://inversionesletich.com/sitemap.xml
```


<img src="https://i.imgur.com/QMnXI0G.png" alt="My cool logo"/>

-- --

## 3. verificar la informaciond ela pagina web

<img src="https://i.imgur.com/8Z6grNC.png" alt="My cool logo"/>

-- --
