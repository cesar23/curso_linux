# actualizacion de curl SSL certificate
## Aqui  esta como actualizar el certifucado ssl de curl para php

fuente: 
    
- https://stackoverflow.com/questions/35638497/curl-error-60-ssl-certificate-prblm-unable-to-get-local-issuer-certificate

error:

```shell
PHP Fatal error:  Uncaught Error: Call to undefined function bindtextdomain() in O:\laborem_server\laborem.local\lib\pkp\lib\vendor\sokil\php-isocodes\src\AbstractDatabase.php:87
```

Habilitar la extencion en el xampp
Editando el `php.ini`


`extension=gettext`

<img src="https://i.imgur.com/8zzH6qm.png" alt="My cool logo"/>

-- --
