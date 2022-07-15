

#----------------------------------------------------
# paso 1
# Actualizar la aplicacion maestra en  este  caso inversionesletich.com
#----------------------------------------------------
cd  /home/kpopilrp/inversionesletich.com/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar  core version
php wp-cli.phar  core download
php wp-cli.phar  core update
php wp-cli.phar  core update-db


#----------------------------------------------------
# paso 2
# borrar los archivos que ya no se necesitaran
#----------------------------------------------------
rm -r /home/kpopilrp/pacificobrevetes.com/wp-admin
rm -r /home/kpopilrp/pacificobrevetes.com/wp-content/cache/wp-rocket/pacificobrevetes.com/*
#
##----------------------------------------------------
## paso 3
## copiar archivos que se actualizaron
##----------------------------------------------------
#

cp -r /home/kpopilrp/inversionesletich.com/wp-admin /home/kpopilrp/pacificobrevetes.com/wp-admin

cp -r /home/kpopilrp/inversionesletich.com/index.php  /home/kpopilrp/pacificobrevetes.com/index.php
cp -r /home/kpopilrp/inversionesletich.com/wp-activate.php  /home/kpopilrp/pacificobrevetes.com/wp-activate.php
cp -r /home/kpopilrp/inversionesletich.com/wp-blog-header.php  /home/kpopilrp/pacificobrevetes.com/wp-blog-header.php
cp -r /home/kpopilrp/inversionesletich.com/wp-cli.phar  /home/kpopilrp/pacificobrevetes.com/wp-cli.phar
cp -r /home/kpopilrp/inversionesletich.com/wp-comments-post.php  /home/kpopilrp/pacificobrevetes.com/wp-comments-post.php
cp -r /home/kpopilrp/inversionesletich.com/wp-config-sample.php  /home/kpopilrp/pacificobrevetes.com/wp-config-sample.php
cp -r /home/kpopilrp/inversionesletich.com/wp-cron.php  /home/kpopilrp/pacificobrevetes.com/wp-cron.php
cp -r /home/kpopilrp/inversionesletich.com/wp-links-opml.php  /home/kpopilrp/pacificobrevetes.com/wp-links-opml.php
cp -r /home/kpopilrp/inversionesletich.com/wp-load.php  /home/kpopilrp/pacificobrevetes.com/wp-load.php
cp -r /home/kpopilrp/inversionesletich.com/wp-login.php  /home/kpopilrp/pacificobrevetes.com/wp-login.php
cp -r /home/kpopilrp/inversionesletich.com/wp-mail.php  /home/kpopilrp/pacificobrevetes.com/wp-mail.php
cp -r /home/kpopilrp/inversionesletich.com/wp-settings.php  /home/kpopilrp/pacificobrevetes.com/wp-settings.php
cp -r /home/kpopilrp/inversionesletich.com/wp-signup.php  /home/kpopilrp/pacificobrevetes.com/wp-signup.php
cp -r /home/kpopilrp/inversionesletich.com/wp-trackback.php  /home/kpopilrp/pacificobrevetes.com/wp-trackback.php
cp -r /home/kpopilrp/inversionesletich.com/xmlrpc.php  /home/kpopilrp/pacificobrevetes.com/xmlrpc.php
##----------------------------------------------------
## paso 4
## entrar al panel admin para  actualizar la base de datos
##----------------------------------------------------
cd /home/kpopilrp/pacificobrevetes.com/
# descargamos el cliente de wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php /home/kpopilrp/pacificobrevetes.com/wp-cli.phar  core download
php /home/kpopilrp/pacificobrevetes.com/wp-cli.phar  core update
php /home/kpopilrp/pacificobrevetes.com/wp-cli.phar  core update-db

## ---------------------------------------------------------------------------------
## ------------------------ END ----------------------------------------------------
## ---------------------------------------------------------------------------------
echo "">salida.sh
echo cd "\"/home/kpopilrp/inversionesletich.com\"" >>salida.sh
echo "#-----------------actualizacion de wordpres-----------------------------" >>salida.sh
echo php "\"/home/kpopilrp/inversionesletich.com/wp-cli.phar\""  core update>>salida.sh
echo "#-----------------actualizacion de themes-----------------------------" >>salida.sh
echo php "\"/home/kpopilrp/inversionesletich.com/wp-cli.phar\""  theme update --all>>salida.sh
echo "#-----------------actualizacion de plugins-----------------------------" >>salida.sh
echo php "\"/home/kpopilrp/inversionesletich.com/wp-cli.phar\""  plugin update woocommerce>>salida.sh
echo php "\"/home/kpopilrp/inversionesletich.com/wp-cli.phar\""  plugin update all-in-one-wp-security-and-firewall>>salida.sh
echo "#-----------------actualizacion de db-----------------------------" >>salida.sh
echo php "\"/home/kpopilrp/inversionesletich.com/wp-cli.phar\""  core update-db>>salida.sh
echo php "\"/home/kpopilrp/inversionesletich.com/wp-cli.phar\""  wc update>>salida.sh
#echo php "\"/home/kpopilrp/inversionesletich.com/wp-cli.phar\""  theme update --all>>salida.sh
#echo php "\"wp-cli.phar\""  plugin update woocommerce>>salida.sh

#-------Script
declare -a MIS_WEBS=('bambooregalos.pe' 'vacjet.pe' 'pacificobrevetes.com' 'pacificobrevetes.com')

for WEB in ${MIS_WEBS[@]}; do

echo "">>salida.sh
echo "">>salida.sh
echo "#----------------------------------------------" >>salida.sh
echo "#----------------------------------------------" >>salida.sh
echo "#---------------paso 1-------------------------------" >>salida.sh
echo "echo \"${WEB} : borrar los archivos que ya no se necesitaran\"" >>salida.sh
echo "" >>salida.sh
echo cd "\"/home/kpopilrp/${WEB}\""
echo rm -r "\"/home/kpopilrp/${WEB}/wp-admin\"" >>salida.sh
echo rm -r "\"/home/kpopilrp/$WEB/wp-content/cache/wp-rocket/$WEB/*\"" >>salida.sh
echo sleep 5 >>salida.sh
echo "" >>salida.sh
echo "" >>salida.sh
echo "#------- paso 2 --------" >>salida.sh
echo "echo \"${WEB} : copiar archivos que se actualizaron \"" >>salida.sh
echo "" >>salida.sh
echo cp -r "\"/home/kpopilrp/inversionesletich.com/wp-admin\"" "\"/home/kpopilrp/${WEB}/wp-admin\"" >>salida.sh
echo "" >>salida.sh
echo cp -r "\"/home/kpopilrp/inversionesletich.com/index.php\""  "\"/home/kpopilrp/${WEB}/index.php\"" >>salida.sh
echo cp -r "\"/home/kpopilrp/inversionesletich.com/wp-activate.php\""  "\"/home/kpopilrp/${WEB}/wp-activate.php\"" >>salida.sh
echo cp -r "\"/home/kpopilrp/inversionesletich.com/wp-blog-header.php\""  "\"/home/kpopilrp/${WEB}/wp-blog-header.php\"" >>salida.sh
echo cp -r "\"/home/kpopilrp/inversionesletich.com/wp-cli.phar\""  "\"/home/kpopilrp/${WEB}/wp-cli.phar\"" >>salida.sh
echo cp -r "\"/home/kpopilrp/inversionesletich.com/wp-comments-post.php\""  "\"/home/kpopilrp/${WEB}/wp-comments-post.php\"" >>salida.sh
echo cp -r "\"/home/kpopilrp/inversionesletich.com/wp-config-sample.php\""  "\"/home/kpopilrp/${WEB}/wp-config-sample.php\"" >>salida.sh
echo cp -r "\"/home/kpopilrp/inversionesletich.com/wp-cron.php\""  "\"/home/kpopilrp/${WEB}/wp-cron.php\"" >>salida.sh
echo cp -r "\"/home/kpopilrp/inversionesletich.com/wp-links-opml.php\""  "\"/home/kpopilrp/${WEB}/wp-links-opml.php\"" >>salida.sh
echo cp -r "\"/home/kpopilrp/inversionesletich.com/wp-load.php\""  "\"/home/kpopilrp/${WEB}/wp-load.php\"" >>salida.sh
echo cp -r "\"/home/kpopilrp/inversionesletich.com/wp-login.php\""  "\"/home/kpopilrp/${WEB}/wp-login.php\"" >>salida.sh
echo cp -r "\"/home/kpopilrp/inversionesletich.com/wp-mail.php\""  "\"/home/kpopilrp/${WEB}/wp-mail.php\"" >>salida.sh
echo cp -r "\"/home/kpopilrp/inversionesletich.com/wp-settings.php\""  "\"/home/kpopilrp/${WEB}/wp-settings.php\"" >>salida.sh
echo cp -r "\"/home/kpopilrp/inversionesletich.com/wp-signup.php\""  "\"/home/kpopilrp/${WEB}/wp-signup.php\"" >>salida.sh
echo cp -r "\"/home/kpopilrp/inversionesletich.com/wp-trackback.php\""  "\"/home/kpopilrp/${WEB}/wp-trackback.php\"" >>salida.sh
echo cp -r "\"/home/kpopilrp/inversionesletich.com/xmlrpc.php\""  "\"/home/kpopilrp/${WEB}/xmlrpc.php\"" >>salida.sh
echo sleep 5 >>salida.sh
echo "">>salida.sh
echo "">>salida.sh
echo "#------- paso 3 --------">>salida.sh
echo "echo \"${WEB} : actualizar Base de datos\" ">>salida.sh
echo "">>salida.sh
echo "#----------------------------------------------------">>salida.sh
echo cd "\"/home/kpopilrp/${WEB}\"">>salida.sh
echo php "\"/home/kpopilrp/${WEB}/wp-cli.phar\""  core update-db>>salida.sh
echo php "\"/home/kpopilrp/${WEB}/wp-cli.phar\""  db optimize>>salida.sh
echo php "\"/home/kpopilrp/${WEB}/wp-cli.phar\""  wc update>>salida.sh
done



