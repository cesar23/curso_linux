#wget  -e robots=off \
#  --no-check-certificate \
#  --recursive \
#  --level 5 \
#  --user-agent= "Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Mobile Safari/537.36" \
#  --no-clobber \
#  --page-requisites \
#  --adjust-extension \
#  --span-hosts \
#  --convert-links \
#  --restrict-file-names=windows \
#  --no-parent  \
#  https://grupoagama.com/

   # --domains dmx.enventer.com --no-parent \ (lo deshabilito por que no lo necesito)
DOMAIN_SITE="grupoagama.com"

wget -e robots=off \
     --no-check-certificate \
     --recursive \
     --no-clobber \
     --page-requisites \
     --html-extension \
     --convert-links \
     --restrict-file-names=windows \
     --domains $DOMAIN_SITE \
     --no-parent \
         https://$DOMAIN_SITE/
