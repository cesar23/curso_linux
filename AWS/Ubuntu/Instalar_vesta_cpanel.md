#Cuáles son los puertos por defecto de Vesta Panel (VestaCP)
fuente :https://mochilanegra.com/cuales-son-los-puertos-por-defecto-de-vesta-panel-vestacp/

Vesta panel está que se hace muy popular en los últimos tiempos, sus instalaciones han crecido de una forma impresionante, sobre todo en los vps con Linux, y méritos no le faltan, este panel facilita mucho las cosas a la hora de administrar un servidor con Linux, instala automáticamente aplicaciones que, de hacerlo manualmente serían muy engorrosas.

Pero existe un problema al instalar vesta panel en Amazon web services (AWS) ya que si no abrimos los puertos que vesta necesita, este no funcionará correctamente, por eso aquí les traigo una lista de los puertos necesarios en vesta.


##PROTOCOLO	FUNCIÓN	PUERTO(S)
```
TCP	SSH	22
TCP	WEB	80,443
TCP	FTP	21,12000-12100
UDP	DNS	53
TCP	DNS	53
TCP	SMTP	25,465,578,2525
TCP	POP3	110,995
TCP	IMAP	143,993
TCP	DB	3306,5432
TCP	VESTA	8083
```
Tabla de puertos que usa VESTA CP y los servicios que lo ocupan

```
Puerto 22: permite conectarnos mediante ssh a nuestro servidor.

Puerto 80: Para http

Puerto 443: Para https

Puerto 21: El ftp de toda la vida

Rango de puertos 12000-12100: Para sftp, es como ftp pero mejorado.

Puerto 53: Para el DNS

Los puertos 25,465,578,2525,110,995,143,993: Todos son para correo dependiendo de su protocolo, ya sea SMTP, POP3 o IMAP

Puerto 3306: Para la base de datos MySQL

Puerto 5432: Para la base de datos PostgreSQL

Y finalmente el puerto 8083: que es el que nos permite acceder a nuestro panel vesta.
 
```


fuente de comandos:
https://vestacp.com/install/

Espero que esta información sea de ayuda, dejen comentarios si tienen alguna duda.


###comandos d e instalacion

```
# Connect to your server as root via SSH
ssh root@your.server
# Download installation script
curl -O http://vestacp.com/pub/vst-install.sh
# Run it
bash vst-install.sh
```