# instalacion de certificado SSL Letsencrypt en Windows xampp

fuente: https://www.youtube.com/watch?v=fOYFu4xQbBE


## 1. Descargar programa
https://www.win-acme.com/

requiere instalar el net framework :4.8
https://dotnet.microsoft.com/en-us/download/dotnet-framework/net48


## 2. crear uan  carpeta donde  se encuentren los certificados
`c:\win-acme\certificates`

### pasos para la configuracion

1.1  elegimos la opcion: `Create new Certificate`

<img width="90%" src="https://i.imgur.com/eQPBQf0.png" alt="My cool logo"/>

-- --
1.2  elegimos la opcion: `Manuality input host names`

<img width="90%" src="https://i.imgur.com/krTUy7t.png" alt="My cool logo"/>

-- --

1.3  Ingresamos el dominio: `eventos.eucim.es`

<img width="90%" src="https://i.imgur.com/2qpIH4d.png" alt="My cool logo"/>

-- --

1.4  elegimos la opcion: `Host the validation files from memory`

<img width="90%" src="https://i.imgur.com/tWfxBGK.png" alt="My cool logo"/>

-- --

1.5 Elegimos el tipo de certificado `Standar RSA key pair`

<img width="90%" src="https://i.imgur.com/ABv9hX6.png" alt="My cool logo"/>

-- --

1.6 Elegiremos el tipo  de servidor: `Apache`

<img width="90%" src="https://i.imgur.com/yWnPFLi.png" alt="My cool logo"/>

Puede Aparecer

<img width="90%" src="https://i.imgur.com/djyYHRL.png" alt="My cool logo"/>

-- --

Tambien puede Pedirte 

<img width="90%" src="https://i.imgur.com/XiTbB2T.png" alt="My cool logo"/>

-- --



-- --

1.7 elegimos la ruta donde se guardaran los certificados: `c:\win-acme\certificates`

<img width="90%" src="https://i.imgur.com/Fja9oFp.png" alt="My cool logo"/>

-- --

1.8  opcion  no adiconal

<img width="90%" src="https://i.imgur.com/3jHoQsc.png" alt="My cool logo"/>

-- --

1.9 No agregar extra  instalaicon

<img width="90%" src="https://i.imgur.com/4VjfTix.png" alt="My cool logo"/>

-- --

1.10 Opcional Nos dira si queremos actualizar la tarea de windows

<img width="90%" src="https://i.imgur.com/Ul28GhK.png" alt="My cool logo"/>

-- --

1.11 Nos dira  siq ueremos ejecutar las actualizacion con un suario especifico le Diremos que no

<img width="90%" src="https://i.imgur.com/CiGHEuH.png" alt="My cool logo"/>

-- --

1.12 Ya veremos  creados los certificados en la carpeta

<img width="90%" src="https://i.imgur.com/Xxx2Da4.png" alt="My cool logo"/>
-- --


## 3. configurar el virtual host del xampp
los  fichero  ubicacos  en `D:\wamp\bin\apache\apache2.4.9\conf\extra\vhost`


<img width="90%" src="https://i.imgur.com/T7EgKlq.png" alt="My cool logo"/>

-- --


<img width="90%" src="https://i.imgur.com/kVHobDL.png" alt="My cool logo"/>

-- --


```shell
<VirtualHost eventos.eucim.es:443>
ServerAdmin jim@masteraula.com
ServerName 	eventos.eucim.es
RewriteEngine On
# Redirect to the correct domain name
DocumentRoot "D:/wamp/www/eventos.eucim.es"
 
SSLEngine on
	SSLCertificateFile "c:\win-acme\certificates\eventos.eucim.es-chain.pem"
	SSLCertificateKeyFile "c:\win-acme\certificates\eventos.eucim.es-key.pem"
</VirtualHost>
```
