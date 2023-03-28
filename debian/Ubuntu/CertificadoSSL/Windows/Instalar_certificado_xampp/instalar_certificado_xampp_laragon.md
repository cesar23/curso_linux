## instalacind e certificado ssl en apache con xampp o laragon

### 1. generar el certificado

copiar el script para  generar certificado ubicaco en este repositorio : `debian/Ubuntu/CertificadoSSL/Windows/script_generador_certificado`
```shell
# crear carpeta
 mkdir -p C:\xampp\apache\crt
```
Aqui ejecutar el script

<img src="https://i.imgur.com/g9q0EGJ.png" alt="My cool logo"/>

-- --


### 2. configurar el xampp

editar el fichero del xampp para  agregar el host virtual

<img src="https://i.imgur.com/4UXYXh4.png" alt="My cool logo"/>

-- --

<img src="https://i.imgur.com/CmX90SH.png" alt="My cool logo"/>

-- --


en el archivo: `httpd-xampp.conf`
```shell
...

define ROOT "C:/xampp/htdocs/"
define SITE "sunat.local"

<VirtualHost *:80> 
    DocumentRoot "${ROOT}"
    ServerName ${SITE}
    ServerAlias *.${SITE}
    <Directory "${ROOT}">
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>

<VirtualHost *:443>
    DocumentRoot "${ROOT}"
    ServerName ${SITE}
    ServerAlias *.${SITE}
    <Directory "${ROOT}">
        AllowOverride All
        Require all granted
    </Directory>

    SSLEngine on
    SSLCertificateFile      C:/xampp/apache/crt/sunat.local/server.crt
    SSLCertificateKeyFile   C:/xampp/apache/crt/sunat.local/server.key
	
	#SSLCertificateFile      C:/laragon/etc/ssl/laragon.crt
    #SSLCertificateKeyFile   C:/laragon/etc/ssl/laragon.key
 
</VirtualHost>

```

### 3, agrgar el host a `c:/Windows/system32/drives/etc/hosts`
```shell
...
127.0.0.1	sunat.local
```
