DATE_HOUR="`date +%d`/`date +%m`/`date +%Y` - `date +%H`:`date +%M`:`date +%S`"
VARIABLE="cesar";
TOKEN="MzExdWk2T0hzUHA3cmU6fFc1XDotY2VzYXJhdXJpc1NhZ2E="
INFO_KERNEL=`uname -s`
INFO_NAME_PC=`uname -n`
INFO_EXTRA="script desde sh en pc de trabajo geo"

INFO_CLIENT="Kernel: ${INFO_KERNEL} - NameEquipo: ${INFO_NAME_PC} - extra:${INFO_EXTRA}"
generate_post_data()
{
  cat <<EOF
{
  "account": {
    "infoClient": "$INFO_CLIENT",
    "screenName": "$VARIABLE"
  },
  "token": "$TOKEN"
}
EOF
}

# echo -en "genrado: ${DATE_HOUR}">> salida.txt
echo "" >> salida.txt
echo "--------------------------------------------" >> salida.txt
echo "---- generado: ${DATE_HOUR}"  >> salida.txt
echo "--------------------------------------------" >> salida.txt

#------------------------------------------------------------------------- primer request
echo "Generando bacup DB"
echo "" >> salida.txt
echo "[https://solucionessystem.com/api-dropbox/bacup_DB/web_vitafit_peru.php]" >> salida.txt
echo "--------------------------------------------" >> salida.txt

sleep 2
echo "Generando bacup de DB"

curl \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
-X POST --data "$(generate_post_data)" "https://solucionessystem.com/api-dropbox/bacup_DB/web_vitafit_peru.php" >> salida.txt
#------------------------------------------------------------------------- segundo request
# clear

# echo "" >> salida.txt
# echo "[https://solucionessystem.com/api-dropbox/bacup_DB/web_vitafit_peru_carpetas.php]" >> salida.txt
# echo "--------------------------------------------" >> salida.txt

# echo "Generando bacup de Carpeta Upload"
# sleep 2
# curl \
# -H "Accept: application/json" \
# -H "Content-Type:application/json" \
# -X POST --data "$(generate_post_data)" "https://solucionessystem.com/api-dropbox/bacup_DB/web_vitafit_peru_carpetas.php" >> salida.txt