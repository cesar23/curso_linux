
cd "/home/kpopilrp/inversionesletich.com"
#-----------------actualizacion de wordpres-----------------------------
php "/home/kpopilrp/inversionesletich.com/wp-cli.phar" core update
#-----------------actualizacion de themes-----------------------------
php "/home/kpopilrp/inversionesletich.com/wp-cli.phar" theme update --all
#-----------------actualizacion de plugins-----------------------------
php "/home/kpopilrp/inversionesletich.com/wp-cli.phar" plugin update woocommerce
php "/home/kpopilrp/inversionesletich.com/wp-cli.phar" plugin update all-in-one-wp-security-and-firewall
#-----------------actualizacion de db-----------------------------
php "/home/kpopilrp/inversionesletich.com/wp-cli.phar" core update-db
php "/home/kpopilrp/inversionesletich.com/wp-cli.phar" wc update


#----------------------------------------------
#----------------------------------------------
#---------------paso 1-------------------------------
echo "bambooregalos.pe : borrar los archivos que ya no se necesitaran"

rm -r "/home/kpopilrp/bambooregalos.pe/wp-admin"
rm -r "/home/kpopilrp/bambooregalos.pe/wp-content/cache/wp-rocket/bambooregalos.pe/*"
sleep 5


#------- paso 2 --------
echo "bambooregalos.pe : copiar archivos que se actualizaron "

cp -r "/home/kpopilrp/inversionesletich.com/wp-admin" "/home/kpopilrp/bambooregalos.pe/wp-admin"

cp -r "/home/kpopilrp/inversionesletich.com/index.php" "/home/kpopilrp/bambooregalos.pe/index.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-activate.php" "/home/kpopilrp/bambooregalos.pe/wp-activate.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-blog-header.php" "/home/kpopilrp/bambooregalos.pe/wp-blog-header.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-cli.phar" "/home/kpopilrp/bambooregalos.pe/wp-cli.phar"
cp -r "/home/kpopilrp/inversionesletich.com/wp-comments-post.php" "/home/kpopilrp/bambooregalos.pe/wp-comments-post.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-config-sample.php" "/home/kpopilrp/bambooregalos.pe/wp-config-sample.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-cron.php" "/home/kpopilrp/bambooregalos.pe/wp-cron.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-links-opml.php" "/home/kpopilrp/bambooregalos.pe/wp-links-opml.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-load.php" "/home/kpopilrp/bambooregalos.pe/wp-load.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-login.php" "/home/kpopilrp/bambooregalos.pe/wp-login.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-mail.php" "/home/kpopilrp/bambooregalos.pe/wp-mail.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-settings.php" "/home/kpopilrp/bambooregalos.pe/wp-settings.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-signup.php" "/home/kpopilrp/bambooregalos.pe/wp-signup.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-trackback.php" "/home/kpopilrp/bambooregalos.pe/wp-trackback.php"
cp -r "/home/kpopilrp/inversionesletich.com/xmlrpc.php" "/home/kpopilrp/bambooregalos.pe/xmlrpc.php"
sleep 5


#------- paso 3 --------
echo "bambooregalos.pe : actualizar Base de datos" 

#----------------------------------------------------
cd "/home/kpopilrp/bambooregalos.pe"
php "/home/kpopilrp/bambooregalos.pe/wp-cli.phar" core update-db
php "/home/kpopilrp/bambooregalos.pe/wp-cli.phar" db optimize
php "/home/kpopilrp/bambooregalos.pe/wp-cli.phar" wc update


#----------------------------------------------
#----------------------------------------------
#---------------paso 1-------------------------------
echo "vacjet.pe : borrar los archivos que ya no se necesitaran"

rm -r "/home/kpopilrp/vacjet.pe/wp-admin"
rm -r "/home/kpopilrp/vacjet.pe/wp-content/cache/wp-rocket/vacjet.pe/*"
sleep 5


#------- paso 2 --------
echo "vacjet.pe : copiar archivos que se actualizaron "

cp -r "/home/kpopilrp/inversionesletich.com/wp-admin" "/home/kpopilrp/vacjet.pe/wp-admin"

cp -r "/home/kpopilrp/inversionesletich.com/index.php" "/home/kpopilrp/vacjet.pe/index.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-activate.php" "/home/kpopilrp/vacjet.pe/wp-activate.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-blog-header.php" "/home/kpopilrp/vacjet.pe/wp-blog-header.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-cli.phar" "/home/kpopilrp/vacjet.pe/wp-cli.phar"
cp -r "/home/kpopilrp/inversionesletich.com/wp-comments-post.php" "/home/kpopilrp/vacjet.pe/wp-comments-post.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-config-sample.php" "/home/kpopilrp/vacjet.pe/wp-config-sample.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-cron.php" "/home/kpopilrp/vacjet.pe/wp-cron.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-links-opml.php" "/home/kpopilrp/vacjet.pe/wp-links-opml.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-load.php" "/home/kpopilrp/vacjet.pe/wp-load.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-login.php" "/home/kpopilrp/vacjet.pe/wp-login.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-mail.php" "/home/kpopilrp/vacjet.pe/wp-mail.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-settings.php" "/home/kpopilrp/vacjet.pe/wp-settings.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-signup.php" "/home/kpopilrp/vacjet.pe/wp-signup.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-trackback.php" "/home/kpopilrp/vacjet.pe/wp-trackback.php"
cp -r "/home/kpopilrp/inversionesletich.com/xmlrpc.php" "/home/kpopilrp/vacjet.pe/xmlrpc.php"
sleep 5


#------- paso 3 --------
echo "vacjet.pe : actualizar Base de datos" 

#----------------------------------------------------
cd "/home/kpopilrp/vacjet.pe"
php "/home/kpopilrp/vacjet.pe/wp-cli.phar" core update-db
php "/home/kpopilrp/vacjet.pe/wp-cli.phar" db optimize
php "/home/kpopilrp/vacjet.pe/wp-cli.phar" wc update


#----------------------------------------------
#----------------------------------------------
#---------------paso 1-------------------------------
echo "camicv.com : borrar los archivos que ya no se necesitaran"

rm -r "/home/kpopilrp/camicv.com/wp-admin"
rm -r "/home/kpopilrp/camicv.com/wp-content/cache/wp-rocket/camicv.com/*"
sleep 5


#------- paso 2 --------
echo "camicv.com : copiar archivos que se actualizaron "

cp -r "/home/kpopilrp/inversionesletich.com/wp-admin" "/home/kpopilrp/camicv.com/wp-admin"

cp -r "/home/kpopilrp/inversionesletich.com/index.php" "/home/kpopilrp/camicv.com/index.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-activate.php" "/home/kpopilrp/camicv.com/wp-activate.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-blog-header.php" "/home/kpopilrp/camicv.com/wp-blog-header.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-cli.phar" "/home/kpopilrp/camicv.com/wp-cli.phar"
cp -r "/home/kpopilrp/inversionesletich.com/wp-comments-post.php" "/home/kpopilrp/camicv.com/wp-comments-post.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-config-sample.php" "/home/kpopilrp/camicv.com/wp-config-sample.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-cron.php" "/home/kpopilrp/camicv.com/wp-cron.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-links-opml.php" "/home/kpopilrp/camicv.com/wp-links-opml.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-load.php" "/home/kpopilrp/camicv.com/wp-load.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-login.php" "/home/kpopilrp/camicv.com/wp-login.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-mail.php" "/home/kpopilrp/camicv.com/wp-mail.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-settings.php" "/home/kpopilrp/camicv.com/wp-settings.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-signup.php" "/home/kpopilrp/camicv.com/wp-signup.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-trackback.php" "/home/kpopilrp/camicv.com/wp-trackback.php"
cp -r "/home/kpopilrp/inversionesletich.com/xmlrpc.php" "/home/kpopilrp/camicv.com/xmlrpc.php"
sleep 5


#------- paso 3 --------
echo "camicv.com : actualizar Base de datos" 

#----------------------------------------------------
cd "/home/kpopilrp/camicv.com"
php "/home/kpopilrp/camicv.com/wp-cli.phar" core update-db
php "/home/kpopilrp/camicv.com/wp-cli.phar" db optimize
php "/home/kpopilrp/camicv.com/wp-cli.phar" wc update


#----------------------------------------------
#----------------------------------------------
#---------------paso 1-------------------------------
echo "pacificobrevetes.com : borrar los archivos que ya no se necesitaran"

rm -r "/home/kpopilrp/pacificobrevetes.com/wp-admin"
rm -r "/home/kpopilrp/pacificobrevetes.com/wp-content/cache/wp-rocket/pacificobrevetes.com/*"
sleep 5


#------- paso 2 --------
echo "pacificobrevetes.com : copiar archivos que se actualizaron "

cp -r "/home/kpopilrp/inversionesletich.com/wp-admin" "/home/kpopilrp/pacificobrevetes.com/wp-admin"

cp -r "/home/kpopilrp/inversionesletich.com/index.php" "/home/kpopilrp/pacificobrevetes.com/index.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-activate.php" "/home/kpopilrp/pacificobrevetes.com/wp-activate.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-blog-header.php" "/home/kpopilrp/pacificobrevetes.com/wp-blog-header.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-cli.phar" "/home/kpopilrp/pacificobrevetes.com/wp-cli.phar"
cp -r "/home/kpopilrp/inversionesletich.com/wp-comments-post.php" "/home/kpopilrp/pacificobrevetes.com/wp-comments-post.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-config-sample.php" "/home/kpopilrp/pacificobrevetes.com/wp-config-sample.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-cron.php" "/home/kpopilrp/pacificobrevetes.com/wp-cron.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-links-opml.php" "/home/kpopilrp/pacificobrevetes.com/wp-links-opml.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-load.php" "/home/kpopilrp/pacificobrevetes.com/wp-load.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-login.php" "/home/kpopilrp/pacificobrevetes.com/wp-login.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-mail.php" "/home/kpopilrp/pacificobrevetes.com/wp-mail.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-settings.php" "/home/kpopilrp/pacificobrevetes.com/wp-settings.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-signup.php" "/home/kpopilrp/pacificobrevetes.com/wp-signup.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-trackback.php" "/home/kpopilrp/pacificobrevetes.com/wp-trackback.php"
cp -r "/home/kpopilrp/inversionesletich.com/xmlrpc.php" "/home/kpopilrp/pacificobrevetes.com/xmlrpc.php"
sleep 5


#------- paso 3 --------
echo "pacificobrevetes.com : actualizar Base de datos" 

#----------------------------------------------------
cd "/home/kpopilrp/pacificobrevetes.com"
php "/home/kpopilrp/pacificobrevetes.com/wp-cli.phar" core update-db
php "/home/kpopilrp/pacificobrevetes.com/wp-cli.phar" db optimize
php "/home/kpopilrp/pacificobrevetes.com/wp-cli.phar" wc update
