# OJO ESTO ES DESDE LA TERMINAL DE LA PAGINA DEL CPANEL

export WEB=vitafitperu.com
#export WEB=bambooregalos.pe
#export WEB=vacjet.pe
#export WEB=pcbyte.com.pe



echo "------- paso 1 --------"
echo "${WEB} : borrar los archivos que ya no se necesitaran"

rm -r "/home/kpopilrp/${WEB}/wp-admin"
rm -r /home/kpopilrp/$WEB/wp-content/cache/wp-rocket/$WEB/*
sleep 5


echo "------- paso 2 --------"
echo "${WEB} : copiar archivos que se actualizaron"

cp -r "/home/kpopilrp/inversionesletich.com/wp-admin" "/home/kpopilrp/${WEB}/wp-admin"

cp -r "/home/kpopilrp/inversionesletich.com/index.php"  "/home/kpopilrp/${WEB}/index.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-activate.php"  "/home/kpopilrp/${WEB}/wp-activate.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-blog-header.php"  "/home/kpopilrp/${WEB}/wp-blog-header.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-cli.phar"  "/home/kpopilrp/${WEB}/wp-cli.phar"
cp -r "/home/kpopilrp/inversionesletich.com/wp-comments-post.php"  "/home/kpopilrp/${WEB}/wp-comments-post.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-config-sample.php"  "/home/kpopilrp/${WEB}/wp-config-sample.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-cron.php"  "/home/kpopilrp/${WEB}/wp-cron.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-links-opml.php"  "/home/kpopilrp/${WEB}/wp-links-opml.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-load.php"  "/home/kpopilrp/${WEB}/wp-load.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-login.php"  "/home/kpopilrp/${WEB}/wp-login.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-mail.php"  "/home/kpopilrp/${WEB}/wp-mail.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-settings.php"  "/home/kpopilrp/${WEB}/wp-settings.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-signup.php"  "/home/kpopilrp/${WEB}/wp-signup.php"
cp -r "/home/kpopilrp/inversionesletich.com/wp-trackback.php"  "/home/kpopilrp/${WEB}/wp-trackback.php"
cp -r "/home/kpopilrp/inversionesletich.com/xmlrpc.php"  "/home/kpopilrp/${WEB}/xmlrpc.php"
sleep 5


echo "------- paso 3 --------"
echo "${WEB} : actualizar Base de datos"

cd "/home/kpopilrp/${WEB}"
php "/home/kpopilrp/${WEB}/wp-cli.phar"  core update-db
#php "/home/kpopilrp/${WEB}/wp-cli.phar"  db optimize
cd "/home/kpopilrp/pacificobrevetes.com/" && php "/home/kpopilrp/pacificobrevetes.com/wp-cli.phar"  db optimize

echo "------- paso 4 --------"
cd "/home/kpopilrp/"
echo "REGRESAMOS A LA RAIZ"
