# buscar en texto
##-----------------------------este curl es el que  genera chrome para  descargar

curl "https://stream82.uqload.com/3rfk4mlxgnw2q4drdkt7h5pybb6k74lx3gyjrews5wxnpxvgnzqhnpq4hssa/v.mp4" -H "Sec-Fetch-Mode: no-cors" -H "Referer: https://uqload.com/embed-u93rvrxad4vn.html" -H "Accept-Encoding: identity;q=1, *;q=0" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36" -H "Range: bytes=0-" --compressed >> videoo.mp4


#-------------------------------------------------------------
#-------------------------- extra encabezados (-H)
#-------------------------------------------------------------

# Al usar curl en sus propios programas muy especiales, puede terminar necesitando pasar sus propios encabezados personalizados al obtener una página web. Puede hacer esto usando la bandera -H.

# Ejemplo, envíe el encabezado X-you-and-me: yes al servidor cuando obtenga una página:

#  curl -H "X-you-and-me: yes" www.love.com 
# Esto también puede ser útil en caso de que desee que curl envíe un texto diferente en un encabezado del que normalmente hace. El encabezado -H que especifique luego reemplaza el encabezado que normalmente se enviaría. Si reemplaza un encabezado interno por uno vacío, evita que se envíe ese encabezado. Para evitar que se use el encabezado Host: :
 curl -H "Host:" www.server.com 


#-------------------------------------------------------------
#----------------------- Encabezados de solicitud (Sec-Fetch*)
#-------------------------------------------------------------

# Una solicitud generada por un elemento de picture daría como resultado una solicitud que contiene los siguientes encabezados de solicitud HTTP:

#     Sec-Fetch-Dest: image
#     Sec-Fetch-Mode: no-cors
#     Sec-Fetch-Site: cross-site

# Una navegación de nivel superior desde https://example.com a https://example.com/ causada por el clic de un usuario en un enlace en la página daría como resultado una solicitud que contiene el siguiente encabezado de solicitud HTTP:

#     Sec-Fetch-Dest: document
#     Sec-Fetch-Mode: navigate
#     Sec-Fetch-Site: same-origin
#     Sec-Fetch-User: ?1



#-------------------------------------------------------------
#----------------------- Referencia (Referer)
#-------------------------------------------------------------
# referencia desde donde proviene  anteriormente

    # curl --referer http://example.com/bot.htmlhttp://www.linuxsecrets.com/ 

    # En este ejemplo, si pasa "debugLB" como referencia HTTP, verá los encabezados de depuración 'X-Cache' y 'Via':

    # curl --referer debugLB http://example.com/bot.html https://jsonplaceholder.typicode.com/posts?userId=1


#-------------------------------------------------------------
#----------------------- Codificacion de contenido (Accept-Encoding)
#-------------------------------------------------------------
# Sintaxis
# Content-Encoding: gzip
# Content-Encoding: compress
# Content-Encoding: deflate
# Content-Encoding: identity
# Content-Encoding: br


# codificación de contenido de los  navegadores:
        # Chrome: Accept-Encoding: identity;q=1, *;q=0.
        # Safari: Accept-Encoding: identity.
        # Firefox: No Accept-Encoding header.
        # Edge: Accept-Encoding: gzip, deflate, br.
Accept-Encoding
# Accept-Encoding: gzip




#-------------------------------------------------------------
#----------------------- Descarga por rango (Range)
#-------------------------------------------------------------
##-------------------------------------------------------------
# Introducción de rangos de bytes. Con esto, un cliente puede solicitar 
# obtener solo una o más subpartes de un documento especificado. Curl lo admite con la bandera -r.


# Obtenga los primeros 100 bytes de un documento:

#  curl -r 0-99 http://www.get.this/ 
# Obtenga los últimos 500 bytes de un documento:

#  curl -r -500 http://www.get.this/ 
# Curl también admite rangos simples para archivos FTP también. Entonces solo puede especificar la posición de inicio y parada.

# Obtenga los primeros 100 bytes de un documento usando FTP:

#  curl -r 0-99 ftp://www.get.this/README 
curl -v -r 0-50 https://jsonplaceholder.typicode.com/posts |head -c 50 > localfile


##------------------ejmeplode envio con script
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

#--ocultar  salida
 curl -H "Content-Type: application/json" -X GET "https://solucionessystem.com/api-dropbox/bacup_DB/web_vitafit_peru.php"  > out.txt 2>&1

#--ocultar  carga de consola
curl -silent http://google.com > temp.html
