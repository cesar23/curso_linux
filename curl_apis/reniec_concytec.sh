scriptPath=$(dirname $0)
# DNI=$1;
DNI="41282111";

curl -c ./cookie.txt -s -L "https://dina.concytec.gob.pe/appDirectorioCTI/" > /dev/null

# curl -Lb ./cookie.txt "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie.txt`&id=${fileid}" -o ${filename}
curl  -Lb ./cookie.txt 'https://dina.concytec.gob.pe/appDirectorioCTI/validarDniInvestigador.do?nro_documento=${DNI}&button2=Aceptar&button2=Cerrar' -H 'Sec-Fetch-Mode: cors' -H 'Sec-Fetch-Site: same-origin' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: es-ES,es;q=0.9' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36' -H 'Accept: text/javascript, text/html, application/xml, text/xml, */*' -H 'Referer: https://dina.concytec.gob.pe/appDirectorioCTI/Login.do' -H 'X-Requested-With: XMLHttpRequest' -H 'Cookie: JSESSIONID=fd03f2b1f139f2dd768c7fd51529' -H 'Connection: keep-alive' >>"${scriptPath}\salida.txt"