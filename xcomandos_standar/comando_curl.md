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
## ✅ Obtener Informacion

Obtener cabeceras
- **-k** => Peticiones https
- **-I** => Obtien las cabeceras
- **-L** => Si es Redirecionado 
```shell
root@ip-172-31-33-216:~# curl -k -I -L  https://localhost/login/canvas
HTTP/2 200
server: nginx
date: Tue, 08 Nov 2022 20:02:42 GMT
content-type: text/html; charset=utf-8
x-xss-protection: 1; mode=block
x-content-type-options: nosniff
x-download-options: noopen
x-permitted-cross-domain-policies: none
referrer-policy: no-referrer-when-downgrade
x-frame-options: SAMEORIGIN
strict-transport-security: max-age=31536000
pragma: no-cache
cache-control: no-cache, no-store
etag: W/"66a4bad352ded9a29650ce63eb42b3a1"
x-request-cost: 1.6971074750005457
x-rate-limit-remaining: 600.0
set-cookie: _csrf_token=K2ByJyM%2Blt2jDKbc6vmb%2Bq9PhHbAqaVfdpiyQEpyaOJgVTVVZnv4qvdv05OBiuu9xATKP4zm6AUi9MIkcwYwsQ%3D%3D; path=/
set-cookie: log_session_id=2d290fe10b23178eb1994ac0e55031c0; path=/; HttpOnly
set-cookie: _legacy_normandy_session=tp4kBQXR5FRS8tW0aEBtVg+XLSJ-1-7rdwkulCUXIdTWCaXFqM-f1egidyIQ4FhZp0SrCvRqMzQXdpQMxLqzG5FhzyLL_hopwHS-L7KVGRUtulOA_Xx2cDZWHlcJSij__E4i08cXGN-tMhe6rwS2u2LvvhgFF2_tk1_Sxt01UXcEw.P8Z2O-0mrNRmiE0xlonDC4-fG9s.Y2q14g; path=/; HttpOnly
set-cookie: _normandy_session=tp4kBQXR5FRS8tW0aEBtVg+XLSJ-1-7rdwkulCUXIdTWCaXFqM-f1egidyIQ4FhZp0SrCvRqMzQXdpQMxLqzG5FhzyLL_hopwHS-L7KVGRUtulOA_Xx2cDZWHlcJSij__E4i08cXGN-tMhe6rwS2u2LvvhgFF2_tk1_Sxt01UXcEw.P8Z2O-0mrNRmiE0xlonDC4-fG9s.Y2q14g; path=/; HttpOnly; SameSite=None
x-session-id: 2d290fe10b23178eb1994ac0e55031c0
x-request-context-id: c927b014-ebdc-4c39-b625-fce3ba6af1a5
x-canvas-meta: o=login/canvas;n=new;b=684548;m=685576;u=0.22;y=0.05;d=1.47;
x-runtime: 2.034900


```

Obtener  negociaciones
```shell
root@ip-172-31-33-216:~# curl -k -iv -I https://techexpert.tips
*   Trying 54.189.219.43:443...
* TCP_NODELAY set
* Connected to techexpert.tips (54.189.219.43) port 443 (#0)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: /etc/ssl/certs/ca-certificates.crt
  CApath: /etc/ssl/certs
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.3 (IN), TLS handshake, Encrypted Extensions (8):
* TLSv1.3 (IN), TLS handshake, Certificate (11):
* TLSv1.3 (IN), TLS handshake, CERT verify (15):
* TLSv1.3 (IN), TLS handshake, Finished (20):
* TLSv1.3 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.3 (OUT), TLS handshake, Finished (20):
* SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384
* ALPN, server accepted to use h2
* Server certificate:
*  subject: OU=Domain Control Validated; CN=techexpert.tips
*  start date: Oct  3 11:28:14 2019 GMT
*  expire date: Dec  2 22:46:29 2020 GMT
*  issuer: C=US; ST=Arizona; L=Scottsdale; O=GoDaddy.com, Inc.; OU=http://certs.godaddy.com/repository/; CN=Go Daddy Secure Certificate Authority - G2
*  SSL certificate verify ok.
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* Using Stream ID: 1 (easy handle 0x55ae42635d60)
> HEAD / HTTP/2
> Host: techexpert.tips
> user-agent: curl/7.68.0
> accept: */*
>
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* old SSL session ID is stale, removing
* Connection state changed (MAX_CONCURRENT_STREAMS == 100)!
< HTTP/2 200
HTTP/2 200
< date: Fri, 02 Oct 2020 02:11:53 GMT
date: Fri, 02 Oct 2020 02:11:53 GMT
< server: Apache/2.4.29 (Ubuntu)
server: Apache/2.4.29 (Ubuntu)
< link: <https://techexpert.tips/wp-json/>; rel="https://api.w.org/", <https://techexpert.tips/wp-json/wp/v2/pages/11822>; rel="alternate"; type="application/json", <https://techexpert.tips/>; rel=shortlink, <https://techexpert.tips/wp-json/>; rel="https://api.w.org/", <https://techexpert.tips/wp-json/wp/v2/pages/11822>; rel="alternate"; type="application/json", <https://techexpert.tips/>; rel=shortlink
link: <https://techexpert.tips/wp-json/>; rel="https://api.w.org/", <https://techexpert.tips/wp-json/wp/v2/pages/11822>; rel="alternate"; type="application/json", <https://techexpert.tips/>; rel=shortlink, <https://techexpert.tips/wp-json/>; rel="https://api.w.org/", <https://techexpert.tips/wp-json/wp/v2/pages/11822>; rel="alternate"; type="application/json", <https://techexpert.tips/>; rel=shortlink
< expires: Thu, 01 Oct 2020 16:17:46 GMT
expires: Thu, 01 Oct 2020 16:17:46 GMT
< pragma: public
pragma: public
< cache-control: max-age=0, public
cache-control: max-age=0, public
< x-powered-by: W3 Total Cache/0.15.0
x-powered-by: W3 Total Cache/0.15.0
< strict-transport-security: max-age=63072000; includeSubdomains;
strict-transport-security: max-age=63072000; includeSubdomains;
< last-modified: Thu, 01 Oct 2020 15:17:46 GMT
last-modified: Thu, 01 Oct 2020 15:17:46 GMT
< etag: "a54f9c2e27d6ff55fe55d995184fff17"
etag: "a54f9c2e27d6ff55fe55d995184fff17"
< access-control-allow-origin: *
access-control-allow-origin: *
< content-type: text/html; charset=UTF-8
content-type: text/html; charset=UTF-8

<
* Connection #0 to host techexpert.tips left intact
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
