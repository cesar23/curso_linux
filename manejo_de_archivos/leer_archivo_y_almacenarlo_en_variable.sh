#!/bin/bash


# ---------------------------------------------------
# ---- OJO FUNCIONA de  Manera coreecta solo en Linux---------------------------
# ---------------------------------------------------
#value=$(<nombres2.txt)
value=$(</d/repos/curso_linux/xcomandos_standar/ngrok.log)
#echo $var

#line_http=$(echo $value | sed 's/http:\/\//xxx/g') # para http
line_http=$(echo $value | sed -r 's/url=http:\/\//url=xxx/g') # para http

echo "------------------------------"
echo "$line_http"
echo "------------------------------"