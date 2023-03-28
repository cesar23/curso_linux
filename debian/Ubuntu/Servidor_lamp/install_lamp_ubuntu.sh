# ejecutar :
# sudo chmod +x install_lamp_ubuntu.sh
# sudo install_lamp_ubuntu.sh

PATH_SCRIPT=`readlink -f "${BASH_SOURCE:-$0}"`
CURRENT_DIR=`dirname $PATH_SCRIPT`

SERVER_IP_LOCAL=$(hostname -I | awk '{print $1}')
SERVER_HOSTNAME=$(hostname)
SERVER_DISTRIBUTION=$(cat /proc/version)
SERVER_INFO="ip servidor:${SERVER_IP_LOCAL} <br> Hostanme:${SERVER_HOSTNAME} <br> Distribucion: ${SERVER_DISTRIBUTION} "

DOMAIN="sunat.local"

sudo apt-get install apache2 -y
sudo apt-get install mysql-server -y
sudo apt install php libapache2-mod-php php-mysql -y



# :::::::: carpetas
sudo mkdir /var/www/${DOMAIN}
sudo chown -R $USER:$USER /var/www/${DOMAIN}



# :::::::: creamos el host virtual
sudo touch /etc/apache2/sites-available/${DOMAIN}.conf
DOMAIN_CONFIG="/etc/apache2/sites-available/${DOMAIN}.conf"

echo "<VirtualHost *:80>
    ServerName ${DOMAIN}
    ServerAlias www.${DOMAIN}
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/${DOMAIN}
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" | sudo tee $DOMAIN_CONFIG

# habilitamos el usadod el dominio
sudo a2ensite ${DOMAIN}

# deshabilitamos el sitio predeterminado
sudo a2dissite 000-default

# verificar que el archivo de configuracion no tiene errores
# sudo apache2ctl configtest




echo "<html>
        <head>
          <title>bienvenidos ${DOMAIN}</title>
        </head>
        <body>
          <h1>Dominio: ${DOMAIN}</h1>
          <h3>${SERVER_INFO}</h3>
        </body>
      </html>" | sudo tee /var/www/${DOMAIN}/index.html


# reiniciamos el apache
sudo systemctl reload apache2

# --------------------------------------------------------
# ------------- Habilitar ssl-----------------------------
# --------------------------------------------------------

echo ""
echo " ----------------------------------------------------"
echo " --- Proceso para generar certificado Cirtual  ------"
echo " ----------------------------------------------------"
sleep 3

# habilitamos el el modulo ssl
sudo a2enmod ssl

# ::crear directorio donde almacenaremos los certidficados
sudo mkdir -p /etc/apache2/crt
sudo chown -R $USER:$USER /etc/apache2/crt

# ::: aqui pocederemos a generar el certificado


#CURRENT_DIR="/home/cesar"
PATH_CONFIG_CERT="${CURRENT_DIR}/cert.conf"
PATH_OUT_CERT="${CURRENT_DIR}/${DOMAIN}"

if [ ! -d "${PATH_OUT_CERT}" ]; then
 mkdir -p "${PATH_OUT_CERT}"
fi

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


# ::aqui generara el certificado
clear

echo "Ahora Procederemos a crera el certificado..."
sleep 3
openssl req -config "${PATH_CONFIG_CERT}" -new -sha256 -newkey rsa:2048 -nodes -keyout "${PATH_OUT_CERT}/server.key" -x509 -days 365 -out "${PATH_OUT_CERT}/server.crt"



sudo rm -rf /etc/apache2/crt/*
# copiaremos la carpeta en este caso sunat.local  a /etc/apache2/crt/
sudo cp -r $DOMAIN/ /etc/apache2/crt/



#::::::: creacion del virtual host con el certificado SSL
DOMAIN_CONFIG="/etc/apache2/sites-available/${DOMAIN}-ssl.conf"

echo "<VirtualHost *:443>
         ServerName ${DOMAIN}
         DocumentRoot /var/www/${DOMAIN}

         SSLEngine on
         SSLCertificateFile /etc/apache2/crt/${DOMAIN}/server.crt
         SSLCertificateKeyFile /etc/apache2/crt/${DOMAIN}/server.key
      </VirtualHost>" | sudo tee $DOMAIN_CONFIG

# habilitamos el ssl del dominio
sudo a2ensite ${DOMAIN}-ssl.conf
# reiniciamso el servicio
sudo systemctl restart apache2.service









