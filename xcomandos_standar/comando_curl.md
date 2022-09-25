fuente : https://curl.se/docs/manual.html

## ✅ Simple uso

Obtenga la página principal de un servidor web:
```shell
curl https://www.example.com/
```

Obtenga el archivo README del directorio de inicio del usuario en el servidor ftp de funet:

```shell
curl ftp://ftp.funet.fi/README
```

Obtenga una lista de directorio de un sitio FTP:

```shell
curl ftp://ftp.funet.fi
```

Obtenga un archivo de un servidor FTPS:

```shell
curl ftps://files.are.secure.com/secrets.txt
```
o use la forma FTPS más apropiada para obtener el mismo archivo:

```shell
curl --ftp-ssl ftp://files.are.secure.com/secrets.txt
```
Obtenga un archivo de un servidor SSH usando SFTP:

```shell
curl -u username sftp://example.com/etc/issue
```

Obtenga un archivo de un servidor SSH usando SCP usando una clave privada (no protegida con contraseña) para autenticarse:

```shell
curl -u username: --key ~/.ssh/id_rsa scp://example.com/~/file.txt
```

Obtenga un archivo de un servidor SSH usando SCP usando una clave privada (protegida por contraseña) para autenticarse:
```shell
curl -u username: --key ~/.ssh/id_rsa --pass private_key_password scp://example.com/~/file.txt
```


Obtenga un archivo de un servidor SMB samba:
```shell
curl -u "domain\username:passwd" smb://server.example.com/share/file.txt
```


## ✅ Descargar de Archivos

Descargar archivo en un archivo
```shell
curl -o thatpage.html http://www.example.com/
# descargar si el archivo ah sido redireccionado
curl -L -o https://www.vmware.com/go/getworkstation-linux
```

Continuar descarga de archivo
```shell
curl -C - --output ubuntu-22.04-desktop-amd64.iso https://releases.ubuntu.com/22.04/ubuntu-22.04-desktop-amd64.iso
```

Ejemplo descargar archivo con Agent
```shell
curl -A 'Mozilla/3.0 (Win95; I)' -L -o "./vmware.bin"  "https://www.vmware.com/go/getworkstation-linux"

# haciendo referencia a directorio local
curl -A 'Mozilla/3.0 (Win95; I)' -L -o "${HOME}/Downloads/vmware.bin"  "https://www.vmware.com/go/getworkstation-linux"
```

FTP: Descargas
```shell
# listar directorio
curl -u cesar:cesar203 ftp://66.155.33.238/

# descargar arhcivo
curl -u cesar:cesar203 -L -C - -o "${HOME}/Downloads/Sandy.7z"  ftp://66.155.33.238/Sandy.7z
curl -u cesar:cesar203 -L -C - -o "${HOME}/Downloads/filess.7z"  ftp://66.155.33.238/filess.7z
curl -u cesar:cesar203 ftp://ftp.linoxide.com/file.tar.gz
```

## ✅ Descargar y Ejecutar sh
```shell
#setup task, for running Taskfiles
RUN curl -sL https://taskfile.dev/install.sh | BINDIR=/usr/local/bin sh

```



## ✅ Subida de ficheros

#### FTP / FTPS / SFTP / SCP

Cargue datos de un archivo específico, inicie sesión con usuario y contraseña:
```shell
curl -T uploadfile -u user:passwd ftp://ftp.upload.com/myfile

# ejemplo 1
curl -T "${HOME}/Downloads/info.txt" -u "cesar@solucionessystem.com:cesar203" ftp://198.54.116.139:21/info3.txt

# ejemplo 2
  # --ftp-create-dirs => creara ruta en el ftp si no exista
curl -p - --insecure  "ftp://198.54.116.139:21/" --user "cesar@solucionessystem.com:cesar203" -T "c:\Users\cesar\Download\info.txt" --ftp-create-dirs
```

Cargue un archivo local en el sitio remoto y utilice también el nombre del archivo local en el sitio remoto:
```shell
curl -T uploadfile -u user:passwd ftp://ftp.upload.com/
```

Cargue un archivo local para agregarlo al archivo remoto:
```shell
curl -T localfile -a ftp://ftp.upload.com/remotefile
```

#### SMB /SMBS
subida de archivos por samba o archivos compartidos
```shell
curl -T file.txt -u "domain\username:passwd"  smb://server.example.com/share/
```


## FTP

```shell
curl ftp://name:passwd@machine.domain:port/full/path/to/file
# o especifíquelos con la bandera -u como
curl -u name:passwd ftp://machine.domain:port/full/path/to/file
```

## Encabezados Personalizados / Header

```shell
curl -H "X-you-and-me: yes" www.love.com

# mas de un encabezado
curl -H "X-you-and-me: yes" -H "X-you-and-me2: yes"  www.love.com

# Esto también puede ser útil en caso de que desee que curl envíe un texto diferente en un encabezado de lo que normalmente lo hace.
# El -Hencabezado que especifique reemplaza el encabezado que normalmente enviaría curl. Si reemplaza un encabezado interno con uno vacío, evita que se envíe ese encabezado. Para evitar Host:que se utilice el encabezado:

curl -H "Host:" www.server.com
```



## Encabezados de solicitud (Sec-Fetch*)

Una solicitud generada por un elemento de picture daría como resultado una solicitud que contiene los siguientes encabezados de solicitud HTTP:

```shell

#     Sec-Fetch-Dest: image
#     Sec-Fetch-Mode: no-cors
#     Sec-Fetch-Site: cross-site
```

Una navegación de nivel superior desde https://example.com a https://example.com/ causada por el clic de un usuario en un enlace en la página daría como resultado una solicitud que contiene el siguiente encabezado de solicitud HTTP:

```shell
#     Sec-Fetch-Dest: document
#     Sec-Fetch-Mode: navigate
#     Sec-Fetch-Site: same-origin
#     Sec-Fetch-User: ?1


```


## Referencia (Referer)

referencia desde donde proviene  anteriormente

```shell
curl --referer http://example.com/bot.html http://www.linuxsecrets.com/ 

# En este ejemplo, si pasa "debugLB" como referencia HTTP, verá los encabezados de depuración 'X-Cache' y 'Via':

curl --referer debugLB http://example.com/bot.html https://jsonplaceholder.typicode.com/posts?userId=1


```


## Codificacion de contenido (Accept-Encoding)

```shell
# Sintaxis
# Content-Encoding: gzip
# Content-Encoding: compress
# Content-Encoding: deflate
# Content-Encoding: identity
# Content-Encoding: br
```


## codificación de contenido de los  navegadores:
```shell
# Chrome: Accept-Encoding: identity;q=1, *;q=0.
# Safari: Accept-Encoding: identity.
# Firefox: No Accept-Encoding header.
# Edge: Accept-Encoding: gzip, deflate, br.

Accept-Encoding
# Accept-Encoding: gzip
```
