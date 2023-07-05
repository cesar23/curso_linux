# listado de bots encontrados

- https://aspiegel.com/petalbot
- https://mj12bot.com/
- https://github.com/phochs/MoniBot
- 


lista a poner en `.htaccess` 
```shell
# :::::::::::::::::::::::::::::::::::::::
# ::::::::: Petalbot ::::::::::::::::::::
# :::::::::::::::::::::::::::::::::::::::
# "Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36"
# Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)"
# aun no se AppleWebKit/537
PetalBot



# :::::::::::::::::::::::::::::::::::::::
# ::::::::: MJ12bot ::::::::::::::::::::
# :::::::::::::::::::::::::::::::::::::::
# Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)
MJ12bot



# :::::::::::::::::::::::::::::::::::::::
# ::::::::: Go-http-client/2.0 :::::::::
# :::::::::::::::::::::::::::::::::::::::
#"GET /%20/mini.php HTTP/1.1" 404 23840 "http://inversionesletich.com/%20/mini.php" "Go-http-client/2.0"
Go-http-client/2.0

```

como bloquearlos desde el htacces

https://www.lucushost.com/ayuda/como-bloquear-el-trafico-de-bots/



Ver ejemplos de user agent Validos

https://developer.mozilla.org/es/docs/Web/HTTP/Headers/User-Agent

```shell
# 5G:[USER AGENTS]
<IfModule mod_setenvif.c>
# SetEnvIfNoCase User-Agent ^$ keep_out
SetEnvIfNoCase User-Agent (binlar|casper|cmsworldmap|comodo|diavol|dotbot|feedfinder|flicky|ia_archiver|jakarta|kmccrew|nutch|planetwork|purebot|pycurl|skygrid|sucker|turnit|vikspider|zmeu|PetalBot|MJ12bot|Go-http-client/2.0) keep_out
<limit GET POST PUT>
Order Allow,Deny
Allow from all
Deny from env=keep_out
</limit>
</IfModule>
# 5G:[REQUEST STRINGS]
```
