# mobax configuraciones

### configuracion de mobax
-- ------
1. descargar configuracion ejeuctar archivo `moxbax.sh`
```shell
# :::::::::: crear carpetas
mkdir -p "/C/Users/${USERNAME}/mobax/home"
mkdir -p "/C/Users/${USERNAME}/mobax/disco"

```

2. configurar mobax

<img width="90%" src="https://i.imgur.com/ZAUUHeq.png" alt="My cool logo"/>

3. ahora decargar backup del home

```shell

# ::::::::: entramos al home
cd "/C/Users/${USERNAME}/mobax/home"
# descargar backup configuracion
curl -A 'Mozilla/3.0 (Win95; I)' -L -o "/C/Users/${USERNAME}/mobax/home/home.tar.gz"  "https://gitlab.com/perucaos/utils_dev/-/raw/master/dotfiles/mobax/home.tar.gz?inline=false"
# curl -A 'Mozilla/3.0 (Win95; I)' -L -o "/C/Users/${USERNAME}/mobax/home/mobax.mobaconf"  "https://gitlab.com/perucaos/utils_dev/-/raw/master/dotfiles/mobax/MobaXterm%20configuration%20(2022-09-25%2017.28.08).mobaconf?inline=false"

# :::::::: descomprimir backup
tar -xzvf home.tar.gz

# :::::::::: sacar backup
# tar -czvf home.tar.gz "libs" ".bash_profile"

```
Luego hacer una  limpieza la configuracion anterior
```shell
rm -rf "C:\Users\${USERNAME}\Documents\MobaXterm"
```


### Creacion de profile
crear un archivo con el nombre `.bash_profile` en el home


Descargar files de cnfiguracion

```shell
curl -A 'Mozilla/3.0 (Win95; I)' -L -o "${HOME}/home.7z"  "https://gitlab.com/perucaos/utils_dev/-/raw/master/dotfiles/mobax/home.7z"
curl -A 'Mozilla/3.0 (Win95; I)' -L -o "${HOME}/mobax.mobaconf"  "https://gitlab.com/perucaos/utils_dev/-/raw/master/dotfiles/mobax/MobaXterm%20configuration%20(2022-09-25%2017.28.08).mobaconf?inline=false"

```

<img width="50%" src="https://i.imgur.com/lSUwtsU.png" alt="My cool logo"/>


```shell
DATE_HOUR="`date +%d`/`date +%m`/`date +%Y` - `date +%H`:`date +%M`:`date +%S`"
# DATE_HOUR_GIT="`date +%d`/`date +%m`/`date +%Y`_`date +%H``date +%M``date +%S`"
DATE_HOUR_GIT="`date +%Y`-`date +%m`-`date +%d`_`date +%H`:`date +%M`:`date +%S`"
# CURRENT_DIR=$(dirname $0)
CMDER_ROOT="/home/mobaxterm"
scriptPath2=${0%/*}
CURRENT_USER=$(id -un)
CURRENT_PC_NAME=$(exec /usr/bin/hostname)
INFO_PC="${CURRENT_USER}@${CURRENT_PC_NAME}"
	
# :::::::: importamos los  colores
if [ -f "${CMDER_ROOT}/libs_shell/mobax/colors.sh" ]; then
 source "${CMDER_ROOT}/libs_shell/mobax/colors.sh"
fi


function reload_config(){
  source "${CMDER_ROOT}/libs_shell/mobax/conf_funciones_level_1.sh"
  source "${CMDER_ROOT}/libs_shell/mobax/conf_funciones_level_2.sh"
  source "${CMDER_ROOT}/libs_shell/mobax/conf_alias_level_1.sh"
  source "${CMDER_ROOT}/libs_shell/mobax/conf_funciones_ides.sh"
  source "${CMDER_ROOT}/libs_shell/mobax/conf_extras.sh"
  source "${CMDER_ROOT}/libs_shell/mobax/conf_menu.sh"
  source "${CMDER_ROOT}/libs_shell/mobax/conf_alias_docker.sh"
  source "${CMDER_ROOT}/libs_shell/mobax/mobax.sh"

}
#--------cargar funciones
reload_config

slepp_m=0.000000002s

echo "${Green_full}"

CONTADOR=1
while [ $CONTADOR -lt 5 ]
do
#echo "El contador vale ${CONTADOR} y es menor que 10."

echo -n "手 き き 手 大 手 き                  き 大 手 き き 手 き 手 き き 手 き 大 手 き 手 き き 手 大 手 き 手 き 手 き 手 き き 大 手 き 手 き き 手 大 手 き き 手                手 き き 手 き 手 き き 手 き 大 手 き 手 き き 手 大 手 き 手 き 手 き 手 き き 大 手 き 手"
# sleep $slepp_m
echo -n "き 手 き { 手 手 手                  き 手 き ñ き 手 き き 手 大 手 き 手 き ! き き 手 大 手 き 手 手 手 大 手 き 手 き ! き き 手 手 { 手 大 手 き 手 き                ñ き 手 き き 手 大 手 き 手 き ! き き 手 大 手 き 手 き き 手 大 手 き き き 大 手 き O"
# sleep $slepp_m
echo -n "手 き き 手 大 手 き                  き 手 ^ き き 手 き 手 き き 手 き 大 手 き 手 き き 手 大 手 き 手 き 手 き 手 x き 大 手 き 手 き き 手 大 手 き き 手                き 手 き き 手 大 手 き き き 手 き 手 き き 手 大 手 き 手 き 手 き 手 x き 大 手 き 手 き"
# sleep $slepp_m
echo -n "手 き き 手 大 手 き                  き 手 % き き 手 き 手 き き 手 き 大 手 き 手 き き 手 大 手 き 手 き 手 き 手 x き 大 手 き 手 き き 手 大 手 き き 手                % き き 手 き 手 き き 手 き 大 手 き 手 き き 手 大 手 き 手 き 手 き 手 x き 大 手 き 手"
# sleep $slepp_m
echo -n "き 手 き { 手 手 手                  き 手 き ñ き 手 き き 手 大 手 き 手 き ! き き 手 大 手 き 手 き き 手 大 手 き き き 大 手 き 手 き { 手 大 手 き 手                き ñ き 手 き き 手 大 手 き 手 き ! き き 手 手 手 % K [ 4 き 手 き 5 手 ? g A き"
# sleep $slepp_m
echo -n "手 き き 手 大 手 き                  き 手 ^ き き 手 き 手 き き 手 き 大 手 き 手 き き 手 大 手 き 手 き 手 き 手 x き 大 手 き 手 き き 手 大 手 き き 手                ^ き き 手 き 手 き き 手 き 大 手 き 手 き き 手 大 手 き 手 き 手 き 手 x き 大 手 き 手"
# sleep $slepp_m
echo -n "手 き き 手 大 手 き                  き 手 % き き 手 き 手 き き 手 き 大 手 き 手 き き 手 大 手 き 手 き 手 き 手 x き 大 手 き 手 き き 手 大 手 き き 手                % き き 手 き 手 き き 手 き 大 手 き 手 き き 手 大 手 き 手 き 1 き 1 x き 1 1 き 1"


# echo -n "1 き き 1 1 1 き                  き 1 1 0 0 1 0 1 0 0 1 0 1 1 0 1 0 0 1 1 1 0 1 0 1 0 1 0 0 1 1 0 1 0 0 1 1 1 0 0 1                1 0 0 1 0 1 0 0 1 0 1 1 0 1 0 0 1 1 1 0 1 0 1 0 1 0 0 1 1 0 1"
# sleep $slepp_m
# echo -n "0 1 0 { 1 1 1                  0 1 0 ñ 0 1 0 0 1 1 1 0 1 0 ! 0 0 1 1 1 0 1 1 1 1 1 0 1 0 ! 0 0 1 1 { 1 1 1 0 1 0                ñ 0 1 0 0 1 1 1 0 1 0 ! 0 0 1 1 1 0 1 0 0 1 1 1 0 0 0 1 1 0 O"
# sleep $slepp_m
# echo -n "1 0 0 1 1 1 0                  0 1 ^ 0 0 1 0 1 0 0 1 0 1 1 0 1 0 0 1 1 1 0 1 0 1 0 1 x 0 1 1 0 1 0 0 1 1 1 0 0 1                0 1 0 0 1 1 1 0 0 0 1 0 1 0 0 1 1 1 0 1 0 1 0 1 x 0 1 1 0 1 0"
# sleep $slepp_m
# echo -n "1 0 0 1 1 1 0                  0 1 % 0 0 1 0 1 0 0 1 0 1 1 0 1 0 0 1 1 1 0 1 0 1 0 1 x 0 1 1 0 1 0 0 1 1 1 0 0 1                % 0 0 1 0 1 0 0 1 0 1 1 0 1 0 0 1 1 1 0 1 0 1 0 1 x 0 1 1 0 1"
# sleep $slepp_m
# echo -n "0 1 0 { 1 1 1                  0 1 0 ñ 0 1 0 0 1 1 1 0 1 0 ! 0 0 1 1 1 0 1 0 0 1 1 1 0 0 0 1 1 0 1 0 { 1 1 1 0 1                0 ñ 0 1 0 0 1 1 1 0 1 0 ! 0 0 1 1 1 % K [ 4 0 1 0 5 1 ? g A 0"
# sleep $slepp_m
# echo -n "1 0 0 1 1 1 0                  0 1 ^ 0 0 1 0 1 0 0 1 0 1 1 0 1 0 0 1 1 1 0 1 0 1 0 1 x 0 1 1 0 1 0 0 1 1 1 0 0 1                ^ 0 0 1 0 1 0 0 1 0 1 1 0 1 0 0 1 1 1 0 1 0 1 0 1 x 0 1 1 0 1"
# sleep $slepp_m
# echo -n "1 0 0 1 1 1 0                  0 1 % 0 0 1 0 1 0 0 1 0 1 1 0 1 0 0 1 1 1 0 1 0 1 0 1 x 0 1 1 0 1 0 0 1 1 1 0 0 1                % 0 0 1 0 1 0 0 1 0 1 1 0 1 0 0 1 1 1 0 1 0 1 0 1 x 0 1 1 0 1"



let CONTADOR++
done
echo "${Color_Reset_full}" #pintado normal
clear

echo "${Purple_full}" #pintado morado
echo ""
echo ""
echo "  ██████╗███████╗███████╗ █████╗ ██████╗      █████╗ ██╗   ██╗██████╗ ██╗███████╗"
echo " ██╔════╝██╔════╝██╔════╝██╔══██╗██╔══██╗    ██╔══██╗██║   ██║██╔══██╗██║██╔════╝"
echo " ██║     █████╗  ███████╗███████║██████╔╝    ███████║██║   ██║██████╔╝██║███████╗"
echo " ██║     ██╔══╝  ╚════██║██╔══██║██╔══██╗    ██╔══██║██║   ██║██╔══██╗██║╚════██║"
echo " ╚██████╗███████╗███████║██║  ██║██║  ██║    ██║  ██║╚██████╔╝██║  ██║██║███████║"
echo "  ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝    ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝╚══════╝"
echo "  _______  _______  _______  _______  _______  _______  _______  _______  _______  "
echo " /______/\/______/\/______/\/______/\/______/\/______/\/______/\/______/\/______/\ "
echo " \__::::\/\__::::\/\__::::\/\__::::\/\__::::\/\__::::\/\__::::\/\__::::\/\__::::\/ "
echo "                                                                                   "
echo "${BIRed_full} "
echo "               ███▄ ▄███▓ ▄▄▄        ██████ ▄▄▄█████▓▓█████  ██▀███                 "
echo "              ▓██▒▀█▀ ██▒▒████▄    ▒██    ▒ ▓  ██▒ ▓▒▓█   ▀ ▓██ ▒ ██▒               "
echo "              ▓██    ▓██░▒██  ▀█▄  ░ ▓██▄   ▒ ▓██░ ▒░▒███   ▓██ ░▄█ ▒               "
echo "              ▒██    ▒██ ░██▄▄▄▄██   ▒   ██▒░ ▓██▓ ░ ▒▓█  ▄ ▒██▀▀█▄                 "
echo "              ▒██▒   ░██▒ ▓█   ▓██▒▒██████▒▒  ▒██▒ ░ ░▒████▒░██▓ ▒██▒               "
echo "              ░ ▒░   ░  ░ ▒▒   ▓▒█░▒ ▒▓▒ ▒ ░  ▒ ░░   ░░ ▒░ ░░ ▒▓ ░▒▓░               "
echo "              ░  ░      ░  ▒   ▒▒ ░░ ░▒  ░ ░    ░     ░ ░  ░  ░▒ ░ ▒░               "
echo "              ░      ░     ░   ▒   ░  ░  ░    ░         ░     ░░   ░                "
echo "                     ░         ░  ░      ░              ░  ░   ░                    "
echo "                          "
echo "                          "

echo "${Color_Reset_full}"
#PS1='\[$BLUE\]\u@\h \[$BLUE\]\w/\[$GREEN\] \$\[$WHITE\] '
echo -en "   "
echo -en "${Red}██${BRed}██${IRed}██${BIRed}██"
echo -en "${Green}██${BGreen}██${IGreen}██${BIGreen}██"
echo -en "${Yellow}██${BYellow}██${IYellow}██${BIYellow}██"
echo -en "${Blue}██${BBlue}██${IBlue}██${BIBlue}██"
echo -en "${Purple}██${BPurple}██${IPurple}██${BIPurple}██"
echo -en "${Cyan}██${BCyan}██${ICyan}██${BICyan}██ \n"


#--------------------------------------------------------------------
#---------------------------- Start Menu personalizado-------------
menu
```
