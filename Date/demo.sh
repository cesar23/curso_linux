# https://www.cyberciti.biz/faq/linux-unix-formatting-dates-for-display/
DATE_HOUR="`date +%d`/`date +%m`/`date +%Y` - `date +%H`:`date +%M`:`date +%S`"
NOW=$(date +"%m-%d-%Y")
HORA_UNIX=`date +%s`

FILE="backup.$NOW.tar.gz"
echo "Backing up data to /nas42/backup.$NOW.tar.gz file, please wait..."
echo "Hora:$DATE_HOUR"
echo "HORA_UNIX:$HORA_UNIX"

read
