PATH_SCRIPT=`readlink -f "${BASH_SOURCE:-$0}"`
CURRENT_DIR=`dirname $PATH_SCRIPT`
# Crear certificado para windows
#set /p domain="Enter Domain: "
#set OPENSSL_CONF=../conf/openssl.cnf
#
#rem if not exist .\%domain% mkdir .\%domain%
DOMAIN="tienda.local"
#PATH_CONFIG_CERT="${CURRENT_DIR}/cert.conf"
PATH_CONFIG_CERT="${CURRENT_DIR}/cert.conf"

### -aqui creara el archivo de configuracion
cat > $PATH_CONFIG_CERT <<EOF
[ req ]

default_bits        = 2048
default_keyfile     = server-key.pem
distinguished_name  = subject
req_extensions      = req_ext
x509_extensions     = x509_ext
string_mask         = utf8only

[ subject ]

countryName                 = Country Name (2 letter code)
countryName_default         = US

stateOrProvinceName         = State or Province Name (full name)
stateOrProvinceName_default = NY

localityName                = Locality Name (eg, city)
localityName_default        = New York

organizationName            = Organization Name (eg, company)
organizationName_default    = Soluciones system, PE

commonName                  = Common Name (e.g. server FQDN or YOUR name)
commonName_default          = ${DOMAIN}

emailAddress                = Email Address
emailAddress_default        = test@example.com

[ dn ]
C = US
ST = California
L = San Fransisco
O = MLopsHub
OU = MlopsHub Dev
# aqui cambiar Dominio
CN = ${DOMAIN}


[ x509_ext ]

subjectKeyIdentifier   = hash
authorityKeyIdentifier = keyid,issuer

basicConstraints       = CA:FALSE
keyUsage               = digitalSignature, keyEncipherment
subjectAltName         = @alternate_names
nsComment              = "OpenSSL Generated Certificate"

[ req_ext ]

subjectKeyIdentifier = hash

basicConstraints     = CA:FALSE
keyUsage             = digitalSignature, keyEncipherment
subjectAltName       = @alternate_names
nsComment            = "OpenSSL Generated Certificate"

[ alternate_names ]
# aqui cambiar Dominio
DNS.1 = ${DOMAIN}
DNS.2 = www.${DOMAIN}

EOF


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
