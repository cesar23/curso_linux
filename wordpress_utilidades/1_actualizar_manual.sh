

#---------------------------------------------------------------------
# PASO 1
# Actualizar la aplicacion maestra en  este  caso inversionesletich.com
# ---------------------------------------------------------------------

# ---------------------------------------------------------------
# opcion A: Actualizar con wp-cli
# ---------------------------------------------------------------

cd  /home/kpopilrp/inversionesletich.com/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar  core version
php wp-cli.phar  core download
php wp-cli.phar  core update
php wp-cli.phar  core update-db


# ---------------------------------------------------------------
# opcion B: Actualizar Wordpress de Inversiones Letich Manualmente (Use esta la ultima vez)
# ---------------------------------------------------------------

#scriptPathDir=$(dirname $0)
DOMAIN="inversionesletich.com"
DOMAIN_PATH="/home/kpopilrp/${DOMAIN}"
WP_DOWNLOAD="${DOMAIN_PATH}/wp_download"
# creamos la carpeta
mkdir $WP_DOWNLOAD
cd "${WP_DOWNLOAD}"

rm -rf latest-es_ES.tar.gz
# descargamos la ultima versionde wordpres

wget https://es.wordpress.org/latest-es_ES.tar.gz
# descomprimimo
tar xfz latest-es_ES.tar.gz
cd wordpress
# copiamos las carpetas
cp -r "${WP_DOWNLOAD}/wordpress/wp-admin" "${DOMAIN_PATH}/wp-admin"
cp -r "${WP_DOWNLOAD}/wordpress/wp-includes" "${DOMAIN_PATH}/wp-includes"
# copiamos los archivos
cp -r "${WP_DOWNLOAD}/wordpress/index.php"  "${DOMAIN_PATH}/index.php"
cp -r "${WP_DOWNLOAD}/wordpress/wp-activate.php"  "${DOMAIN_PATH}/wp-activate.php"
cp -r "${WP_DOWNLOAD}/wordpress/wp-blog-header.php"  "${DOMAIN_PATH}/wp-blog-header.php"
cp -r "${WP_DOWNLOAD}/wordpress/wp-comments-post.php"  "${DOMAIN_PATH}/wp-comments-post.php"
cp -r "${WP_DOWNLOAD}/wordpress/wp-cron.php"  "${DOMAIN_PATH}/wp-cron.php"
cp -r "${WP_DOWNLOAD}/wordpress/wp-links-opml.php"  "${DOMAIN_PATH}/wp-links-opml.php"
cp -r "${WP_DOWNLOAD}/wordpress/wp-load.php"  "${DOMAIN_PATH}/wp-load.php"
cp -r "${WP_DOWNLOAD}/wordpress/wp-login.php"  "${DOMAIN_PATH}/wp-login.php"
cp -r "${WP_DOWNLOAD}/wordpress/wp-mail.php"  "${DOMAIN_PATH}/wp-mail.php"
cp -r "${WP_DOWNLOAD}/wordpress/wp-settings.php"  "${DOMAIN_PATH}/wp-settings.php"
cp -r "${WP_DOWNLOAD}/wordpress/wp-signup.php"  "${DOMAIN_PATH}/wp-signup.php"
cp -r "${WP_DOWNLOAD}/wordpress/wp-trackback.php"  "${DOMAIN_PATH}/wp-trackback.php"
cp -r "${WP_DOWNLOAD}/wordpress/xmlrpc.php"  "${DOMAIN_PATH}/xmlrpc.php"



#----------------------------------------------------
# paso 2
# borrar los archivos que ya no se necesitaran
#----------------------------------------------------
DOMAIN_MASTER="inversionesletich.com"
DOMAIN="pacificobrevetes.com"
DOMAIN_PATH="/home/kpopilrp/${DOMAIN}"
# limieza
rm -r "${DOMAIN_PATH}/wp-admin"
rm -r "${DOMAIN_PATH}/wp-content/cache/wp-rocket/${DOMAIN}/*"

# Crera enlaze simbolico
rm -r "${DOMAIN_PATH}/wp-includes"
ln -s "/home/kpopilrp/${DOMAIN_MASTER}/wp-includes" "/home/kpopilrp/${DOMAIN}/wp-includes"


##----------------------------------------------------
## paso 3
## copiar archivos que se actualizaron
##----------------------------------------------------
#

cp -r "/home/kpopilrp/${DOMAIN_MASTER}/wp-admin" "/home/kpopilrp/${DOMAIN}/wp-admin"

cp -r "/home/kpopilrp/${DOMAIN_MASTER}/index.php"  "/home/kpopilrp/${DOMAIN}/index.php"
cp -r "/home/kpopilrp/${DOMAIN_MASTER}/wp-activate.php"  "/home/kpopilrp/${DOMAIN}/wp-activate.php"
cp -r "/home/kpopilrp/${DOMAIN_MASTER}/wp-blog-header.php"  "/home/kpopilrp/${DOMAIN}/wp-blog-header.php"
cp -r "/home/kpopilrp/${DOMAIN_MASTER}/wp-cli.phar"  "/home/kpopilrp/${DOMAIN}/wp-cli.phar"
cp -r "/home/kpopilrp/${DOMAIN_MASTER}/wp-comments-post.php"  "/home/kpopilrp/${DOMAIN}/wp-comments-post.php"
cp -r "/home/kpopilrp/${DOMAIN_MASTER}/wp-config-sample.php"  "/home/kpopilrp/${DOMAIN}/wp-config-sample.php"
cp -r "/home/kpopilrp/${DOMAIN_MASTER}/wp-cron.php"  "/home/kpopilrp/${DOMAIN}/wp-cron.php"
cp -r "/home/kpopilrp/${DOMAIN_MASTER}/wp-links-opml.php"  "/home/kpopilrp/${DOMAIN}/wp-links-opml.php"
cp -r "/home/kpopilrp/${DOMAIN_MASTER}/wp-load.php"  "/home/kpopilrp/${DOMAIN}/wp-load.php"
cp -r "/home/kpopilrp/${DOMAIN_MASTER}/wp-login.php"  "/home/kpopilrp/${DOMAIN}/wp-login.php"
cp -r "/home/kpopilrp/${DOMAIN_MASTER}/wp-mail.php"  "/home/kpopilrp/${DOMAIN}/wp-mail.php"
cp -r "/home/kpopilrp/${DOMAIN_MASTER}/wp-settings.php"  "/home/kpopilrp/${DOMAIN}/wp-settings.php"
cp -r "/home/kpopilrp/${DOMAIN_MASTER}/wp-signup.php"  "/home/kpopilrp/${DOMAIN}/wp-signup.php"
cp -r "/home/kpopilrp/${DOMAIN_MASTER}/wp-trackback.php"  "/home/kpopilrp/${DOMAIN}/wp-trackback.php"
cp -r "/home/kpopilrp/${DOMAIN_MASTER}/xmlrpc.php"  "/home/kpopilrp/${DOMAIN}/xmlrpc.php"
##----------------------------------------------------
## paso 4
## entrar al panel admin para  actualizar la base de datos
##----------------------------------------------------
cd "/home/kpopilrp/${DOMAIN}/"
# descargamos el cliente de wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php "/home/kpopilrp/${DOMAIN}/wp-cli.phar"  core download
php "/home/kpopilrp/${DOMAIN}/wp-cli.phar"  core update
php "/home/kpopilrp/${DOMAIN}/wp-cli.phar"  core update-db

## ---------------------------------------------------------------------------------
## ------------------------ END ----------------------------------------------------
## ---------------------------------------------------------------------------------
echo "">salida.sh
echo cd "\"/home/kpopilrp/${DOMAIN_MASTER}\"" >>salida.sh
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



