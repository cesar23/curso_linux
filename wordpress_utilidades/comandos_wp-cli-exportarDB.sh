##---------------------------------------Batch Simple
export dbname="pcbyte.com.pe"
#export PATH_WEB='/home/kpopilrp/pacificobrevetes.com/'
#export PATH_BACKUP="/home/kpopilrp/backups/pacificobrevetes.com/"

export PATH_WEB="/home/kpopilrp/${dbname}/"
export PATH_BACKUP="/home/kpopilrp/backups/${dbname}/"
export name_archive="${dbname}-`date +\%Y-\%m-\%d__\%H\%M\%S`"
#---crear directorio para  el backup de la web
mkdir -p $PATH_BACKUP
cd  $PATH_WEB #entramos a directorio para  realizar el backup
#realizar el backup
sleep 1
php wp-cli.phar db export "${PATH_BACKUP}${name_archive}.sql"
gzip -9 "${PATH_BACKUP}${name_archive}.sql"
#ver peso de backups
du -bsh /home/kpopilrp/backups/*


##---------------------------------------Batch Lote
#!/bin/bash
declare -a MIS_WEBS=('bambooregalos.pe' 'pacificobrevetes.com','vacjet.pe','inversionesletich.com','pcbyte.com.pe')

for WEB in ${MIS_WEBS[@]}; do

echo "---------------------------------------------"
echo "------- paso 1 ------------------------------"
echo "---------------------------------------------"
echo.
echo "Setear Variables Para el backup: ${WEB}"

export dbname=$WEB
export PATH_WEB="/home/kpopilrp/${WEB}/"
export PATH_BACKUP="/home/kpopilrp/backups/${WEB}/"
export name_archive="${dbname}-`date +\%Y-\%m-\%d__\%H\%M\%S`"
sleep 4

echo.
echo "---------------------------------------------"
echo "------- paso 2 ------------------------------"
echo "---------------------------------------------"
echo.
echo "Realizar Backup: ${WEB}"
#---crear directorio para  el backup de la web
mkdir -p $PATH_BACKUP
cd  $PATH_WEB #entramos a directorio para  realizar el backup
#realizar el backup
sleep 1
#-realizar backup php cli
php wp-cli.phar db export "${PATH_BACKUP}${name_archive}.sql"
gzip -9 "${PATH_BACKUP}${name_archive}.sql"

echo "Exito el backup: ${WEB}"
sleep 4
done