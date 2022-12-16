sudo apt-get install apache2 -y  && \
sudo apt-get install mysql-server -y && \
sudo apt install php libapache2-mod-php php-mysql -y



# :::::::: carpetas
sudo mkdir /var/www/sunat.local
sudo chown -R $USER:$USER /var/www/sunat.local



#
sudo touch /etc/apache2/sites-available/sunat.local.conf

DOMAIN_CONFIG="/etc/apache2/sites-available/sunat.local.conf"

echo '<VirtualHost *:80>
    ServerName sunat.local
    ServerAlias www.sunat.local
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/sunat.local
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' | sudo tee $DOMAIN_CONFIG

# habilitamos el usadod el dominio
sudo a2ensite sunat.local

# deshabilitamos el sitio predeterminado
sudo a2dissite 000-default

# verificar que el archivo de configuracion no tiene errores
sudo apache2ctl configtest




echo '<html>
        <head>
          <title>sunat.local website2</title>
        </head>
        <body>
          <h1>Hello sunat.local! ubuntu</h1>

          <p>This is the landing page of <strong>your_domain</strong>.</p>
        </body>
      </html>' | sudo tee /var/www/sunat.local/index.html



sudo systemctl reload apache2

# ------------- Habilitar ssl--------------------------------------------
sudo a2enmod ssl



# ::crear directorio donde almacenaremos los certidficados
sudo mkdir -p /etc/apache2/crt
sudo chown -R $USER:$USER /etc/apache2/crt


#rm -rf /etc/apache2/crt/*

#sudo cp -r sunat.local/ /etc/apache2/crt/


#sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt

CURRENT_DIR="/home/cesar"
DOMAIN="sunat.local"
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



openssl req -config "${PATH_CONFIG_CERT}" -new -sha256 -newkey rsa:2048 -nodes -keyout "${PATH_OUT_CERT}/server.key" -x509 -days 365 -out "${PATH_OUT_CERT}/server.crt"



sudo rm -rf /etc/apache2/crt/*
sudo cp -r $DOMAIN/ /etc/apache2/crt/




DOMAIN_CONFIG="/etc/apache2/sites-available/sunat.local-ssl.conf"

echo '<VirtualHost *:443>
         ServerName sunat.local
         DocumentRoot /var/www/sunat.local

         SSLEngine on
         SSLCertificateFile /etc/apache2/crt/sunat.local/server.crt
         SSLCertificateKeyFile /etc/apache2/crt/sunat.local/server.key
      </VirtualHost>' | sudo tee $DOMAIN_CONFIG

# habilitamos el ssl del dominio
sudo a2ensite sunat.local-ssl.conf
sudo systemctl 









