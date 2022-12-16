PATH_SCRIPT=`readlink -f "${BASH_SOURCE:-$0}"`
CURRENT_DIR=`dirname $PATH_SCRIPT`
# Crear certificado para windows
#set /p domain="Enter Domain: "
#set OPENSSL_CONF=../conf/openssl.cnf
#
#rem if not exist .\%domain% mkdir .\%domain%
DOMAIN="sunat.local"
#PATH_CONFIG_CERT="${CURRENT_DIR}/cert.conf"
PATH_CONFIG_CERT="${CURRENT_DIR}/cert_new.conf"
PATH_OUT_CERT="${CURRENT_DIR}/${DOMAIN}"

# si no existe el directorio lo creamos
if [ ! -d "${PATH_OUT_CERT}" ]; then
 mkdir "${PATH_OUT_CERT}"

fi


# ------- Generamos el Certificado
#openssl.exe req -config cert.conf -new -sha256 -newkey rsa:2048 -nodes -keyout server.key -x509 -days 365 -out server.crt
openssl.exe req -config "${PATH_CONFIG_CERT}" -new -sha256 -newkey rsa:2048 -nodes -keyout "${PATH_OUT_CERT}/server.key" -x509 -days 365 -out "${PATH_OUT_CERT}/server.crt"

# ------- Revisamos la informacion del Certificado
openssl x509 -text -noout -in "${PATH_OUT_CERT}/server.crt"
