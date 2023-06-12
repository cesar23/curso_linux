CURRENT_DIR=$(pwd)
# ::::::obtenemos y guardamos la cookie
curl --location 'https://inversionesletich.com/sistema_luper/login.php' \
--cookie-jar "${CURRENT_DIR}/cookie_jar.txt" \
--header "Mozilla/3.0 (Win95; I)" \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'usuario=sistemas_aempresarial@hotmail.com' \
--data-urlencode 'pass=cesar203'


# :::::: ahora ya podemos obtener resulatdo con la cookie
curl --location 'https://inversionesletich.com/sistema_luper/listar_producto.php' \
--cookie "${CURRENT_DIR}/cookie_jar.txt" \
--header "Mozilla/3.0 (Win95; I)"




