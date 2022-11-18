# Actualizacion manual para La nueva version de wordpress

## 1. Actualizacion de Core del principal dominio
Actualizar la aplicacion maestra en  este  caso `inversionesletich.com`

- opcion A:
```shell
# ---------------------------------------------------------------
# opcion A: Actualizar con wp-cli
# ---------------------------------------------------------------

cd  /home/kpopilrp/inversionesletich.com/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar  core version
php wp-cli.phar  core download
php wp-cli.phar  core update
php wp-cli.phar  core update-db

# -----------------------
# opionales 
# -----------------------

# Crear el archivo de configuracion
# php wp-cli.phar  config create --dbname=YOUR_DB_NAME --dbuser=YOUR_DB_USERNAME --dbpass=YOUR_DB_PASSWORD --locale=en_DB

# Comando para la instalacion de wordpress
# php wp-cli.phar core install --url=YOUR_DOMAIN_NAME --title=YOUR_BLOG_TITLE --admin_user=ADMIN_USERNAME --admin_password=ADMIN_PASSWORD --admin_email=ADMIN_EMAIL
```

- opcion B:
```shell

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

# entramos al directorio y actualizamos
cd $DOMAIN_PATH
# actualizamos la Db
php wp-cli.phar core update
php wp-cli.phar core update-db

```


## 2. Actualizacion para los dominios hijos

```shell
#----------------------------------------------------
# paso 2
# borrar los archivos que ya no se necesitaran
#----------------------------------------------------
DOMAIN_MASTER="inversionesletich.com" # No Modificar ❌
DOMAIN="importaciondeceroaexperto.com" # Aqui Cambiar ✅
DOMAIN_PATH="/home/kpopilrp/${DOMAIN}"
# limieza
rm -rf "${DOMAIN_PATH}/wp-admin"
rm -rf "${DOMAIN_PATH}/wp-content/cache/wp-rocket/${DOMAIN}/*"

# Crera enlaze simbolico
rm -rf "${DOMAIN_PATH}/wp-includes"
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
#php wp-cli.phar  core download
php wp-cli.phar  core update
php wp-cli.phar  core update-db

```
