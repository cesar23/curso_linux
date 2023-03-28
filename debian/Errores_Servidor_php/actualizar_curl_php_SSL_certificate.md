# actualizacion de curl SSL certificate
## Aqui  esta como actualizar el certifucado ssl de curl para php

fuente: 
    
- https://stackoverflow.com/questions/35638497/curl-error-60-ssl-certificate-prblm-unable-to-get-local-issuer-certificate

error:

```shell
PHP Fatal error:  Uncaught GuzzleHttp\Exception\RequestException: cURL error 60: SSL certificate problem: certificate has expired (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) in O:\laborem_server\laborem.local\lib\pkp\lib\vendor\guzzlehttp\guzzle\src\Handler\CurlFactory.php:201
```



Si está en Windows usando Xampp, estoy robando una mejor respuesta de aquí, sería útil si Google le muestra esta pregunta primero.


### 1 . Download and extract for cacert.pem here (a clean file format/data)

https://curl.haxx.se/docs/caextract.html

<img src="https://i.imgur.com/c9jmyoY.png" alt="My cool logo"/>

-- --


### 2. Put it in :

`C:\xampp\php\extras\ssl\cacert.pem`

👉 si estas usando laragon

`C:\laragon\etc\ssl`

<img src="https://i.imgur.com/WeazhsJ.png" alt="My cool logo"/>

-- --


### 3. Add this line to your php.ini

`curl.cainfo = "C:\xampp\php\extras\ssl\cacert.pem"`

👉 si estas usando laragon

`curl.cainfo = "C:\laragon\etc\ssl\cacert.pem"`

<img src="https://i.imgur.com/bNWxTJL.png" alt="My cool logo"/>

-- --

restart your webserver/Apache
