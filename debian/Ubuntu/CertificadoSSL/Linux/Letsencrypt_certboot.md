fuentes:
- https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu-20-04-es

Ojo para que pueda funcionar  los archivos del virtual host deben tener la siguiente estructura
```shell
<VirtualHost *:80>
  ServerName campusap.eucim.es
  ServerAlias canvasfiles.eucim.es
  ServerAdmin pmanco@eucim.es
  DocumentRoot /var/canvas/public
  RewriteEngine On
  RewriteCond %{HTTP:X-Forwarded-Proto} !=https
  RewriteCond %{REQUEST_URI} !^/health_check
  RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI} [L]
  ErrorLog /var/log/apache2/canvas_errors.log
  LogLevel warn
  CustomLog /var/log/apache2/canvas_access.log combined
  SetEnv RAILS_ENV production

  XSendFile On
  XSendFilePath /var/canvas

  <Directory /var/canvas/public>
    Options All
    AllowOverride All
    Require all granted
  </Directory>


RewriteCond %{SERVER_NAME} =canvasfiles.eucim.es [OR]
RewriteCond %{SERVER_NAME} =canvas.eucim.es
RewriteRule ^ https://%{SERVER_NAME}%{REQUEST_URI} [END,NE,R=permanent]
</VirtualHost>
 
```

# instalaciond e certbot Lets encrypt

```shell
# :: Apache
apt install certbot python3-certbot-apache

# :: Nginx
sudo apt install certbot python3-certbot-nginx
```

luego de eso ejecutar comando
```shell
certbot --apache
certbot --nginx
```

Acontinuacion deberas poner el correo
```shell
root@ubuntu:/etc/apache2/sites-enabled# certbot --apache
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator apache, Installer apache

Which names would you like to activate HTTPS for?
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
1: campusap.eucim.es
2: canvas.eucim.es
3: canvasfiles.eucim.es
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Select the appropriate numbers separated by commas and/or spaces, or leave input
blank to select all options shown (Enter 'c' to cancel): cauris@eucim.es
```

Luego de eso seleccionar el dominio q se ahabilitara

```shell
Which names would you like to activate HTTPS for?
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
1: campusap.eucim.es
2: canvas.eucim.es
3: canvasfiles.eucim.es
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Select the appropriate numbers separated by commas and/or spaces, or leave input
blank to select all options shown (Enter 'c' to cancel): 1

# aparecera lo siguiente si es exitoso
Obtaining a new certificate
Performing the following challenges:
http-01 challenge for campusap.eucim.es
Waiting for verification...
Cleaning up challenges
Created an SSL vhost at /etc/apache2/sites-available/campusap.eucim.es-le-ssl.conf
Deploying Certificate to VirtualHost /etc/apache2/sites-available/campusap.eucim.es-le-ssl.conf
Enabling available site: /etc/apache2/sites-available/campusap.eucim.es-le-ssl.conf
```
luego de eso nos preguntara  si queremos hacer un redirec le diremos que `N`

```shell
Please choose whether or not to redirect HTTP traffic to HTTPS, removing HTTP access.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
1: No redirect - Make no further changes to the webserver configuration.
2: Redirect - Make all requests redirect to secure HTTPS access. Choose this for
new sites, or if you're confident your site works on HTTPS. You can undo this
change by editing your web server's configuration.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Select the appropriate number [1-2] then [enter] (press 'c' to cancel): 1
```


finalmente nos saldra un mensaje de exito

```shell
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Congratulations! You have successfully enabled https://campusap.eucim.es

You should test your configuration at:
https://www.ssllabs.com/ssltest/analyze.html?d=campusap.eucim.es
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/campusap.eucim.es-0001/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/campusap.eucim.es-0001/privkey.pem
   Your cert will expire on 2022-11-08. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot again
   with the "certonly" option. To non-interactively renew *all* of
   your certificates, run "certbot renew"
 - Some rewrite rules copied from
   /etc/apache2/sites-enabled/campusap.eucim.es.conf were disabled in
   the vhost for your HTTPS site located at
   /etc/apache2/sites-available/campusap.eucim.es-le-ssl.conf because
   they have the potential to create redirection loops.
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le
```

## Verificar que este habilitado la renovacion automatica
El paquete certbot que instalamos se encarga de las renovaciones al incluir una secuencia de comandos en `/etc/cron.d`, que gestiona un servicio systemctl denominado certbot.timer. Esta secuencia de comandos se ejecuta dos veces al día y renovará de forma automática cualquier certificado que caduque en treinta o menos días.

- verificar con el comando `systemctl status certbot.timer`

```shell
root@ubuntu:/etc/letsencrypt/live/campusap.eucim.es-0001# systemctl status certbot.timer
● certbot.timer - Run certbot twice daily
   Loaded: loaded (/lib/systemd/system/certbot.timer; enabled; vendor preset: enabled)
   ✅Active: active(waiting) since Wed 2022-08-10 16:07:55 -05; 36min ago
  Trigger: Thu 2022-08-11 02:42:00 -05; 9h left

Aug 10 16:07:55 ubuntu systemd[1]: Started Run certbot twice daily.
```
