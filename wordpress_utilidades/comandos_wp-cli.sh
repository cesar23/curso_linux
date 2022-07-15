fuente: https://wp-cli.org/es/

Buena documentacion : https://developer.wordpress.org/cli/commands/plugin/

descargar : curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

##-------------------------------------------------------

##---------------------(php wp-cli.phar) = wp -----------

##-------------------------------------------------------

#-- 1-------descargar wordpress

php wp-cli.phar core download --locale=es_ES 

#php wp-cli.phar core download --version=4.2.2 --locale=es_ES

 

#---2----------- configurar wp_config.php

php wp-cli.phar core config --dbname=wp2 --dbuser=root --dbpass= --dbhost=localhost --dbprefix=wp_

 

 #-- 3----- instalar wordpress

php wp-cli.phar core install --url=example.com --title="Título del sitio WordPress" --admin_user=perucaos@gmail.com --admin_password=cesar203 --admin_email="perucaos@gmail.com"

 

#-actualizar wordpress

php wp-cli.phar   core update
php wp-cli.phar   core update-db

 

 

#---------------------------------script para actualizar wordpress------------------------

#!/bin/bash

declare -a sites=('/var/www/wp1' '/var/www/wp2' '/var/www/wp3')

for site in "${sites[@]}";

do

wp --path=$site core update

done

#---------------------------------------- end script--------------------------------------------

 

#---4 realizar backup

php wp-cli.phar db export backup.sql 

 

#-----------------------------------------------------------------------------------------------

#---------------------------------Administrar plugins-------------------------------------------

#-----------------------------------------------------------------------------------------------

 

#-ver plugins instalados

php wp-cli.phar plugin status

 

#-- instalar pluging

   php wp-cli.phar plugin install wordpress-importer --activate

#-- verifica si un plugin esta instalado

   php wp-cli.phar plugin get woocommerce --format=json

#-- desactivar plugin

   php wp-cli.phar plugin deactivate wordpress-importer

   #php wp-cli.phar plugin deactivate sucuri-scanner

#-- eliminar plugin

   php wp-cli.phar delete wordpress-importer



#--- actualizar un plugin

    wp plugin update wordpress-seo

#-- actualizar todos plugin

   php wp-cli.phar update --all

 

#-- buscar plugin

   php wp-cli.phar search import

 

 

#-----------------------------------------------------------------------------------------------

#---------------------------------Manipular datos-------------------------------------------

#-----------------------------------------------------------------------------------------------

#post create

#post edit

#post delete

 

#--1 generar post (similara laravel - generara 10 posts)

   php wp-cli.phar post generate --count=10 --post_type=page --post_date=2020-01-04

   php wp-cli.phar post generate --format=ids #Agregue meta a cada publicación generada

 

 

#-----------------------------------------------------------------------------------------------

#---------------------------------Operacion de BD-------------------------------------------

#-----------------------------------------------------------------------------------------------

   php wp-cli.phar db query "SELECT id FROM wp_users;"

   #exportar

   php wp-cli.phar db export
   php wp-cli.phar db export 'cesar.sql'





   #importar

   php wp-cli.phar db import backup.sql

   #optimizar

   php wp-cli.phar db optimize

 

 

   #----------reemplazar dominio

   php wp-cli.phar search-replace 'dev.tusitio.com' 'www.sitio-cliente.com'



UTILIDADES.sh
3.3 KB

