#!/bin/bash


# ---------------------------------------------------
# ---- OJO FUNCIONA de  Manera coreecta solo en Linux---------------------------
# ---------------------------------------------------
#value=$(<nombres2.txt)
value=$(</D/repos/curso_linux/manejo_de_archivos/.env)
#echo $var

#line_http=$(echo $value | sed 's/http:\/\//xxx/g') # para http
# line_http=$(echo $value | sed -r 's/url=http:\/\//url=xxx/g') # para http
line_http=$(grep -inr "MONGO_DB_PORT" /D/repos/curso_linux/manejo_de_archivos/.env) # para http

echo "------------------------------"
echo "$line_http"
echo "------------------------------"
