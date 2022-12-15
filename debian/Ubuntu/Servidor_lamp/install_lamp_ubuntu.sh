sudo apt-get install apache2 -y
sudo apt-get install mysql-server -y
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
          <title>sunat.local website</title>
        </head>
        <body>
          <h1>Hello sunat.local!</h1>

          <p>This is the landing page of <strong>your_domain</strong>.</p>
        </body>
      </html>' | sudo tee /var/www/sunat.local/index.html



sudo systemctl reload apache2

# ------------- Habilitar ssl--------------------------------------------
sudo a2enmod ssl

cp sunat.local.key /etc/ssl/private/
cp sunat.local.crt /etc/ssl/certs/


#sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt
sudo openssl req -x509 \
            -sha256 -days 356 \
            -nodes \
            -newkey rsa:2048 \
            -subj "/CN=sunat.local/C=PE/L=Lima" \
            -keyout /etc/ssl/private/sunat.local.key \
            -out /etc/ssl/certs/sunat.local.crt

sudo openssl req -x509 \
        -nodes -days 365 \
        -newkey rsa:2048 \
        -keyout /etc/ssl/private/apache-selfsigned.key \
        -out /etc/ssl/certs/apache-selfsigned.crt


openssl genrsa -out server.key 2048
openssl rsa -in server.key -out server.key
openssl req -sha256 -new -key server.key -out server.csr -subj '/C=PE/ST=Test/L=Test/O=Test/CN=sunat.local'
openssl x509 -req -sha256 -days 365 -in server.csr -signkey server.key -out server.crt


DOMAIN_CONFIG="/etc/apache2/sites-available/sunat.local-ssl.conf"
echo '<VirtualHost *:443>
         ServerName sunat.local
         DocumentRoot /var/www/sunat.local

         SSLEngine on
         SSLCertificateFile /etc/ssl/certs/sunat.local.crt
         SSLCertificateKeyFile /etc/ssl/private/sunat.local.key
      </VirtualHost>' | sudo tee $DOMAIN_CONFIG

sudo a2ensite sunat.local-ssl.conf







sudo apt-get a2emod ssl
a2ensite default-ssl
service apache2 reload


sudo a2enmod ssl

# Prepare fake SSL certificate
RUN apt-get install -y ssl-cert



# Setup Apache2 HTTPS env
a2ensite default-ssl.conf

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl1.key -out /etc/ssl/certs/ssl1.crt

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl-certs/nginx.key -out /etc/nginx/ssl-certs/nginx.crt
openssl req -config example-com.conf -new -x509 -sha256 -newkey rsa:2048 -nodes \
    -keyout example-com.key.pem -days 365 -out example-com.cert.pem









# Install useful tools and install important libaries
RUN apt-get -y update && \
    apt-get -y --no-install-recommends install \
dialog \
libsqlite3-dev \
libsqlite3-0 \
default-mysql-client \
     && \
apt-get -y --no-install-recommends install --fix-missing \
build-essential \
libonig-dev && \
apt-get -y --no-install-recommends install --fix-missing libcurl4 \
libcurl4-openssl-dev \
openssl && \
rm -rf /var/lib/apt/lists/* && \
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install xdebug
RUN pecl install xdebug-2.8.0 && \
    docker-php-ext-enable xdebug

# Install redis
RUN pecl install redis-5.1.1 && \
    docker-php-ext-enable redis

# Install imagick
RUN apt-get update && \
    apt-get -y --no-install-recommends install --fix-missing libmagickwand-dev && \
    rm -rf /var/lib/apt/lists/* && \
    pecl install imagick && \
    docker-php-ext-enable imagick

# Other PHP7 Extensions

RUN docker-php-ext-install pdo_mysql && \
    docker-php-ext-install pdo_sqlite && \
    docker-php-ext-install mysqli && \
#    docker-php-ext-install curl && \
    docker-php-ext-install tokenizer && \
    docker-php-ext-install json && \
#    docker-php-ext-install zip && \
    docker-php-ext-install -j$(nproc) intl && \
    docker-php-ext-install mbstring && \
    docker-php-ext-install gettext && \
    docker-php-ext-install calendar && \
    docker-php-ext-install exif


# Install Freetype
RUN apt-get -y update && \
    apt-get --no-install-recommends install -y libfreetype6-dev \
libjpeg62-turbo-dev \
libpng-dev && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd



#RUN pecl install mcrypt-1.0.4 && docker-php-ext-enable mcrypt

RUN docker-php-ext-configure \
#    gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/; \
    gd  --enable-gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd \
    opcache \
    gd \
    bcmath \
    intl \
    mbstring \
    soap \
    xsl \
    zip


#-------para  instalar mcrypt
RUN apt-get install libmcrypt-dev
RUN pecl install mcrypt-1.0.4 && docker-php-ext-enable mcrypt



# Enable apache modules
RUN a2enmod ssl
RUN a2enmod rewrite
RUN a2enmod headers


#-instal mcrypt
#RUN docker-php-ext-configure mcrypt \
#    && docker-php-ext-install mcrypt


# Cleanup
RUN rm -rf /usr/src/*
