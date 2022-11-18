#Cómo configurar ISPCONFIG para  ubuntu 20

- fuente del video: 
https://www.youtube.com/watch?v=Kf3csFfYPVU

- Cómo instalar ISPConfig 3 en Ubuntu 18.04
https://www.rosehosting.com/blog/how-to-install-ispconfig-3-on-ubuntu-18-04/


- El servidor perfecto: Ubuntu 20.04 con Apache, PHP, MariaDB, PureFTPD, BIND, Postfix, Dovecot e ISPConfig 3.2 (Beta)
https://www.howtoforge.com/tutorial/perfect-server-ubuntu-20.04-with-apache-php-myqsl-pureftpd-bind-postfix-doveot-and-ispconfig/


### 1. Actualice y actualice el software ya instalado en la instancia:

```
apt update && apt upgrade -y
```
### 2. Cambie el shell predeterminado. /bin/shes 
un enlace simbólico a `/bin/dash`, pero ISPConfig requiere bash como shell. Vuelva a configurarlo para /bin/bash:

```
dpkg-reconfigure dash
```

Cuando se le haga la siguiente pregunta, responda con No :Use dash as the default system shell (/bin/sh)?

![](https://i.imgur.com/cnkgUoG.png)    

Si omite este paso, la instalación de ISPConfig fallará.

### 3. Deshabilite y elimine AppArmor, ya que podría causar conflictos durante la instalación de ISPConfig:

```
update-rc.d -f apparmor remove
apt-get remove apparmor apparmor-utils
```


```
apt-get -y install postfix postfix-mysql postfix-doc mariadb-client mariadb-server openssl getmail4 rkhunter binutils dovecot-imapd dovecot-pop3d dovecot-mysql dovecot-sieve dovecot-lmtpd sudo
```

habilitar las peticiones smpt en postfix `vim /etc/postfix/master.cf`

```
# service type  private unpriv  chroot  wakeup  maxproc command + args
#               (yes)   (yes)   (no)    (never) (100)
# ==========================================================================
smtp      inet  n       -       y       -       -       smtpd
#smtp      inet  n       -       y       -       1       postscreen
#smtpd     pass  -       -       y       -       -       smtpd
#dnsblog   unix  -       -       y       -       0       dnsblog
#tlsproxy  unix  -       -       y       -       0       tlsproxy
submission inet n       -       y       -       -       smtpd
  -o syslog_name=postfix/submission
  -o smtpd_tls_security_level=encrypt
  -o smtpd_sasl_auth_enable=yes
  -o smtpd_relay_restrictions=permit_sasl_authenticated,reject
#  -o smtpd_tls_auth_only=yes
#  -o smtpd_reject_unlisted_recipient=no
#  -o smtpd_client_restrictions=$mua_client_restrictions
#  -o smtpd_helo_restrictions=$mua_helo_restrictions
#  -o smtpd_sender_restrictions=$mua_sender_restrictions
#  -o smtpd_recipient_restrictions=
#  -o smtpd_relay_restrictions=permit_sasl_authenticated,reject
#  -o milter_macro_daemon_name=ORIGINATING
smtps     inet  n       -       y       -       -       smtpd
  -o syslog_name=postfix/smtps
  -o smtpd_tls_wrappermode=yes
  -o smtpd_sasl_auth_enable=yes
  -o smtpd_relay_restrictions=permit_sasl_authenticated,reject
#  -o smtpd_reject_unlisted_recipient=no
#  -o smtpd_client_restrictions=$mua_client_restrictions
#  -o smtpd_helo_restrictions=$mua_helo_restrictions
#  -o smtpd_sender_restrictions=$mua_sender_restrictions
#  -o smtpd_recipient_restrictions=
```
resultado

![](https://i.imgur.com/PV6cfuf.png)    

ahor a reiniciamos postfix
```
systemctl restart postfix
```

### 4. Configurar Mysql / mariaDB
Abra el archivo `/etc/mysql/mariadb.conf.d/50-server.cnf` en un editor de texto y comente la línea de la bind-addresssiguiente manera para habilitar las conexiones desde otros hosts. También agregue el valor, sql-mode="NO_ENGINE_SUBSTITUTION"ya que ISPConfig3 requiere este modo SQL:

modificamos para que mysql se pueda acceder desde cualquier lado

```
vim /etc/mysql/mariadb.conf.d/50-server.cnf 
```
Resultado:
![](https://i.imgur.com/E2Xkfuc.png)

#####  Initialize the MariaDB server:
configuracion mysql  para desactivar root
```
mysql_secure_installation
``` 
resultado:
![](https://i.imgur.com/DrHmZMD.png) 

reiniciamos el servidor maria db
```
systemctl restart mariadb
# probamos configuracion
mysql -u root -p
```
Establezca el método de autenticación de contraseña en Nativo:
esto servira para deshabilitar el root para phpmyadmin

```
echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root
```


Abra el archivo `/etc/mysql/debian.cnf` y agregue su contraseña a la configuración:
para  habilitar en mysql secury instalation:
```
vim /etc/mysql/debian.cnf
```
ejemplo:

![](https://i.imgur.com/VyGedVW.png) 



### 5. Instale Amavisd-new , SpamAssassin , ClamAV y el software adicional requerido para estos servicios:

```
apt install amavisd-new spamassassin clamav clamav-daemon unzip bzip2 arj nomarch lzop cabextract apt-listchanges libnet-ldap-perl libauthen-sasl-perl clamav-docs daemon libio-string-perl libio-socket-ssl-perl libnet-ident-perl zip libnet-dns-perl postgrey -y
```

#### editemos el archivo `nano /etc/amavis/conf.d/05-node_id` como se  muestra

![](https://i.imgur.com/ngMKidn.png)    


#### Amavisd-new carga la biblioteca de filtros SpamAssassin internamente, se puede detener para liberar algo de RAM:

detenemos y lo quitamos del inicio del sistema
```
service spamassassin stop
update-rc.d -f spamassassin remove
```
#### Actualice las firmas antivirus e inicie el servicio:
```
freshclam
service clamav-daemon start
```
ejemplo:

![](https://i.imgur.com/vxhFnXH.png) 


##6. amavis tiene un error en ubuntu vamos a corregir :
# OBIAR ESTE PASO y seguir al paso 7 - solo usarlo si da  error
![](https://icons.iconarchive.com/icons/saki/snowish/24/Button-important-icon.png) _Esto ya no es  necesario
 en la version 2020 de ISPCONFIG usando ubuntu 20 . dejo en la  carpeta `archivo_server` el archivo que se uso ultimo_


vamos a  aplicar un  parche del repositorio `https://git.ispconfig.org/ispconfig/ispconfig3/` de al  sisguiente url: 

 entramos al directorio tmp:
```
 cd /tmp
 wget https://git.ispconfig.org/ispconfig/ispconfig3/-/raw/b5375ab34471bbba3ad6534e607a8b8e365c1471/helper_scripts/ubuntu-amavisd-new-2.11.patch
```

ahora cambiamos de  directorio IMPORTANTE :
```
cd /usr/sbin/
# y realizamos un backup
cp -pf amavisd-new amavisd-new.backup
```
Ahora  vamos a  aplicar el Patch correspondiente

```
patch < /tmp/ubuntu-amavisd-new-2.11.patch
```


### 7. Instalar Apache y sus Demas paquetes
```
## paquetes  necesarios para php 7
apt install software-properties-common //Si no esta  instalado
add-apt-repository ppa:ondrej/php
apt-get update

```


El módulo FastCGI Apache no está disponible en el repositorio de Ubuntu, así que descárguelo de kernel.org e instálelo usando el dpkgcomando.
```
wget https://mirrors.edge.kernel.org/ubuntu/pool/multiverse/liba/libapache-mod-fastcgi/libapache2-mod-fastcgi_2.4.7~0910052141-1.2_amd64.deb
sudo dpkg -i libapache2-mod-fastcgi_2.4.7~0910052141-1.2_amd64.deb
```

Instalar apache y php 7.4
```
apt install apache2 apache2-utils apache2-doc libapache2-mod-php libapache2-mod-python
apt install php-pear mcrypt imagemagick libruby  php-curl php-intl php-pspell
apt install php-sqlite3 php-tidy php-xmlrpc php-xsl   php-memcache php-imagick  php-mbstring
apt install php-soap php-soap
```

Configuramos el modulo necesarios de apache
```
a2enmod suexec rewrite ssl actions include cgi
```

### 8. Vulnerabilidad HTTPOXY: Cómo proteger y probar su servidor web
https://www.howtoforge.com/tutorial/httpoxy-protect-your-server/  (apache o Ngix)


creamos un archivo de configuracion
```
vi /etc/apache2/conf-available/httpoxy.conf
```

insertamos esto

```
<IfModule mod_headers.c>
    RequestHeader unset Proxy early
</IfModule>
```

Activar el Archivo de configuracion:

```
a2enconf httpoxy

##reiniciamos el servicio de apache
systemctl restart apache2
```

### 9. Desactivar Nime Types de Ruby

```
vim /etc/mime.types
```
ejemplo:

![](https://i.imgur.com/q4XlnBr.png) 

```
##reiniciamos el servicio de apache
systemctl restart apache2
```


### 10. instalar PHP con FPM

fuentes: 
https://medium.com/@ashrithgn/deploy-websites-with-multiple-versions-of-php-in-apache-in-ubuntu-14-04-f60865b246e0


A continuación, instale PHP y PHP-FPM en su sistema Ubuntu. Para este tutorial, elegimos PHP 7.4 para instalar usando

Para la instalación de PHP recomendamos utilizar ppa: ondrej / php PPA. Ejecute los siguientes comandos para agregar el PPA a su sistema.

```
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
```
Luego instale PHP 7.4 (o la versión requerida), la última versión disponible el día de la redacción de este tutorial. Simplemente ejecute los siguientes comandos para la instalación de paquetes PHP y PHP-FPM.

actualización de sudo apt

```
sudo apt update
sudo apt install php7.4 php7.4-fpm
a2enmod actions proxy_fcgi alias
#reciniocamos apache
systemctl restart apache2

```

_Nota: - Cuando utiliza PHP-FPM. Todas las configuraciones de los módulos PHP se encuentran en el directorio /etc/php/7.4/fpm. Puede leer más sobre habilitar / deshabilitar módulos PHP ._

```
sudo systemctl status php7.4-fpm
```

### 10. Install HHVM  máquina virtual (conocido como HipHop Virtual Machine) 

```
apt-get install software-properties-common apt-transport-https
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xB4112585D386EB94

add-apt-repository https://dl.hhvm.com/ubuntu
apt-get update
apt-get install hhvm
```

### 11. Instalar cerboot (para  instalar letsencrypts SSL)
esto es para que se actaualize automaticamente letsencripy

fuente: https://www.youtube.com/watch?v=7V4VGWZTHzE

```
apt install certbot
```

### 12. Instalar Mailman
 para instalar software de mail con python para  manejar los email
 vamos a crera un usuario con su  email y recordarlos

```
apt install mailman
```

ahora  crearemos las listas
```
newlist mailman
```
![](https://i.imgur.com/cbBa80c.png) 

Copiaremos y pegaremos lo que nos genero:

```
mailman:              "|/var/lib/mailman/mail/mailman post mailman"
mailman-admin:        "|/var/lib/mailman/mail/mailman admin mailman"
mailman-bounces:      "|/var/lib/mailman/mail/mailman bounces mailman"
mailman-confirm:      "|/var/lib/mailman/mail/mailman confirm mailman"
mailman-join:         "|/var/lib/mailman/mail/mailman join mailman"
mailman-leave:        "|/var/lib/mailman/mail/mailman leave mailman"
mailman-owner:        "|/var/lib/mailman/mail/mailman owner mailman"
mailman-request:      "|/var/lib/mailman/mail/mailman request mailman"
mailman-subscribe:    "|/var/lib/mailman/mail/mailman subscribe mailman"
mailman-unsubscribe:  "|/var/lib/mailman/mail/mailman unsubscribe mailman"
```



```
vi /etc/aliases
```

asi debe quedar:
![](https://i.imgur.com/r2NNTCT.png) 

```
newaliases

#reniciamos apache
systemctl restart apache2
ln -s /etc/mailman/apache.conf /etc/apache2/conf-available/mailman.conf

#configuramos para que mailman arranque con apache
a2enconf mailman


#reniciamos apache
systemctl restart apache2
systemctl restart mailman
systemctl status mailman
```
debequedar asi:
![](https://i.imgur.com/KTIM84X.png) 

### 13. Configurar Pure FTP

```
apt-get install pure-ftpd pure-ftpd-mysql  -y
nano /etc/default/pure-ftpd-common
```
modificar  `VIRTUALCHROOT=true` 

quedaria asi:
![](https://i.imgur.com/NdBragU.png) 

```
echo 1 > /etc/pure-ftpd/conf/TLS 
mkdir -p /etc/ssl/private
```

### 14. Creracion de Certificados

```
openssl req -x509 -nodes -days 7300 -newkey rsa:2048 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem

chmod 600 /etc/ssl/private/pure-ftpd.pem
systemctl restart pure-ftpd-mysql
```

### 15. Modificar las tablas de disco

```
apt install quota quotatool
```

```
vi /etc/fstab
```

luego agregar lo siguiente: 
```

 errors=remount-ro,usrjquota=quota.user,grpjquota=quota.group,jqfmt=vfsv0 0 1
```
debe quedar asi:

![](https://i.imgur.com/DzVB7ku.png) 

```
mount -o remount /
quotacheck -avugm
```

### 16. Instalador manejador de DNS BIND9 y Manejador de Estadisticas

```
apt install -y bind9 dnsutils haveged

systemctl enable haveged
systemctl start haveged

## para analizar log  y ver estadisticas y las vistas
apt -y install vlogger webalizer awstats geoip-database libclass-dbi-mysql-perl


```

editamos el archivos de awsstats `vi /etc/cron.d/awstats` y  comantamos todas las  lineas

asi debe  quedar:

![](HTTPS://I.IMGUR.COM/BIQDEDC.PNG) 


```
#paquetes necesarios para instalar otras aplicaciones de debian
apt-get -y install build-essential autoconf automake1.11 libtool flex bison debhelper binutils
```


### 17. Instalando jailkits  - para  darle permisos a usuarios especiales a usuarios
_ojo que esto se   instala antes de instalar IPSConfgig nos e puede  instalar despues_

fuente: https://www.howtoforge.com/debian-9-jail-jailkit/

```
instalar dependencias:
apt-get install build-essential autoconf automake1.11 libtool flex bison debhelper binutils-gold python


cd /tmp    
wget http://olivier.sessink.nl/jailkit/jailkit-2.20.tar.gz
tar xvfz jailkit-2.20.tar.gz
cd jailkit-2.20
```

Ahora que nuestro sistema está listo para instalar el Jailkit, instálelo de la siguiente manera:

```

echo 5 > debian/compat
./debian/rules binary
cd ..
dpkg -i jailkit_2.20-1_amd64.deb

```

Instalará el Jailkit en Debian Server, podemos eliminar los paquetes adicionales de / tmp :
```
rm -rf /tmp/jailkit*
```

### 18. Instalando fail2ban

```
sudo apt-get install fail2ban

```
Configuraremos f2brian para qu monitoree  " el ftp , mail, dovecot" 
creamos un archivo en `vi /etc/fail2ban/jail.local` y le ponemos este  contenido:

```
[pure-ftpd]
enabled = true
port = ftp
filter = pure-ftpd
logpath = /var/log/syslog
maxretry = 3

[dovecot]
enabled = true
filter = dovecot
action = iptables-multiport[name=dovecot-pop3imap, port="pop3,pop3s,imap,imaps", protocol=tcp]
logpath = /var/log/mail.log
maxretry = 5

[postfix]
enabled = true
port = smtp
filter = postfix
logpath = /var/log/mail.log
maxretry = 3
```

reiniciamos
```
systemctl restart fail2ban
```

### 18. Instalar ufw - (firewall de Ubuntu)
```
apt install ufw
```

### 19. Instalar Webmail Roundcube

```
apt -y install  roundcube roundcube-core roundcube-mysql roundcube-plugins  javascript-common libjs-jquery-mousewheel  php-net-sieve tinymce getmail4

## configuramos el rouncube
vi /etc/apache2/conf-enabled/roundcube.conf
```

agregamos despues de <Directory /var/lib/roundcube/> esto `AddType application/x-httpd-php .php` 
ejemplo:

![](https://i.imgur.com/rFsV4hY.png) 

tambien modificaremos otro archivo `nano /etc/roundcube/config.inc.php` :
```
$config['default_host'] = 'localhost';
```

![](https://i.imgur.com/llQJidT.png) 
ahora guardamos la  configuracion y reinicamos

```

systemctl restart apache2
```


### 20. Instalar ISPCONFIG
Usaremos las compilaciones nocturnas de ISPConfig 3.2 que contienen ISPConfig 3.2 beta 1 en el momento de publicar esta guía, ya que ISPConfig 3.2 final aún no se ha lanzado.
```
cd /tmp 
wget -O ispconfig.tar.gz https://www.ispconfig.org/downloads/ISPConfig-3-nightly.tar.gz
tar xfz ispconfig.tar.gz
cd ispconfig3*/install/
```

##### El siguiente paso es correr

```
php -q install.php
```
Esto iniciará el instalador de ISPConfig 3. El instalador configurará todos los servicios como Postfix, Dovecot, etc. para usted.

```
# php -q install.php
```

