#!/bin/bash
source "D:\repos\curso_linux\utilidades\functiones_mias.sh"

WP_USER="perucaos@gmail.com"
WP_PASSWORD="AULAzrMb5N91*uDWGD8^F7jdUKr"
WP_WEB="https://pacificobrevetes.com"
#-----------------
#WP_LOGIN="${WP_WEB}/wp-login.php"
WP_LOGIN="${WP_WEB}/soluciones-admin"
WP_ADMIN_PANEL="${WP_WEB}/wp-admin/index.php"
WP_ADMIN_PANEL_ENCODE=$(urlencode  "${WP_ADMIN_PANEL}")


curl -c ./cookie.txt -s -L $WP_LOGIN \
  -H 'Connection: keep-alive' \
  -H 'Cache-Control: max-age=0' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Origin: '$WP_WEB'' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Referer: '$WP_LOGIN'?loggedout=true&wp_lang=es_ES' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cookie: wordpress_test_cookie=WP+Cookie+check; tk_ai=woo%3ADi3%2B7RtnpU50U8ZyxSrTZ4VZ; googtrans=/es/es; googtrans=/es/es' \
  --data-raw 'log='$WP_USER'&pwd='$WP_PASSWORD'&wp-submit=Acceder&redirect_to='$WP_ADMIN_PANEL_ENCODE'&testcookie=1' \
  --compressed \
  --insecure > /dev/null


curl -Lb ./cookie.txt $WP_ADMIN_PANEL

read

