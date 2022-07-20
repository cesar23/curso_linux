


### Este curl es el que  genera chrome para  descargar
```shell
curl "https://stream82.uqload.com/3rfk4mlxgnw2q4drdkt7h5pybb6k74lx3gyjrews5wxnpxvgnzqhnpq4hssa/v.mp4" -H "Sec-Fetch-Mode: no-cors" -H "Referer: https://uqload.com/embed-u93rvrxad4vn.html" -H "Accept-Encoding: identity;q=1, *;q=0" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36" -H "Range: bytes=0-" --compressed >> videoo.mp4

```






## Ejemplo de envio con script

```shell
#/bin
VARIABLE="cesar";
TOKEN="MzExdWk2T0hzUHA3cmU6fFc1XDotY2VzYXJhdXJpc1NhZ2E="
generate_post_data()
{
cat <<EOF
{
"account": {
"email": "cesar@peru",
"screenName": "dsdsd",
"type": "type",
"passwordSettings": {
"password": "asdasd",
"passwordConfirm": "asd"
}
},
"token": "$TOKEN"
}
EOF
}



curl -i \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
-X POST --data "$(generate_post_data)" "https://solucionessystem.com/api-dropbox/bacup_DB/web_vitafit_peru.php" > salida.txt

```
## ocultar  salida
```shell
curl -H "Content-Type: application/json" -X GET "https://solucionessystem.com/api-dropbox/bacup_DB/web_vitafit_peru.php"  > out.txt 2>&1
```

## ocultar  carga de consola
```shell
curl -silent http://google.com > temp.html
```
