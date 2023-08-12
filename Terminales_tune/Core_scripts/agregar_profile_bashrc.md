# Agregar Scripts para los terminales




## 1. para agregar en mobax
ingresar al directorio: `C:\Users\Cesar\mobax\home\.bash_profile`

```shell
DATE_HOUR="`date +%d`/`date +%m`/`date +%Y` - `date +%H`:`date +%M`:`date +%S`"
# DATE_HOUR_GIT="`date +%d`/`date +%m`/`date +%Y`_`date +%H``date +%M``date +%S`"
DATE_HOUR_GIT="`date +%Y`-`date +%m`-`date +%d`_`date +%H`:`date +%M`:`date +%S`"
# CURRENT_DIR=$(dirname $0)

MOBAX_PATH="/home/mobaxterm"
scriptPath2=${0%/*}
CURRENT_USER=$(id -un)
CURRENT_PC_NAME=$(exec /usr/bin/hostname)
INFO_PC="${CURRENT_USER}@${CURRENT_PC_NAME}"
	
# :::::::: Importanmos las librerias
if [ -f "${MOBAX_PATH}/libs_shell/init.sh" ]; then
 source "${MOBAX_PATH}/libs_shell/init.sh"
 
 # ingresar al espacio de trabajo
 cd $(path_windows_to_path_shell "${env_dir_work}")
fi




	
# :::::::: importamos los  colores
# if [ -f "${CMDER_ROOT}/libs/colors.sh" ]; then
 # source "${CMDER_ROOT}/libs/colors.sh"
# fi
# # --------------
# # --------- Includes Core ----------------------
# # source "${CMDER_ROOT}/libs/conf_funciones.sh"
# # --------- require  fzf


# function reload_config(){
  # source "${CMDER_ROOT}/libs/conf_funciones_level_1.sh"
  # source "${CMDER_ROOT}/libs/conf_funciones_level_2.sh"
  # source "${CMDER_ROOT}/libs/conf_alias_level_1.sh"
  # source "${CMDER_ROOT}/libs/conf_funciones_ides.sh"
  # source "${CMDER_ROOT}/libs/conf_extras.sh"
  # source "${CMDER_ROOT}/libs/conf_menu.sh"
  # source "${CMDER_ROOT}/libs/conf_alias_docker.sh"
  # source "${CMDER_ROOT}/libs/mobax.sh"
  # source "${CMDER_ROOT}/libs/conf_neofetch.sh"

# }
# #--------cargar funciones
# reload_config

slepp_m=0.000000002s

echo "${Green_full}"

CONTADOR=1
while [ $CONTADOR -lt 400 ]
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
echo "${Color_Off}" #pintado normal
clear


# menu cesar de : conf_menu
cesar

echo "${Color_Reset_full}"
#PS1='\[$BLUE\]\u@\h \[$BLUE\]\w/\[$GREEN\] \$\[$WHITE\] '
echo -en "   "
echo -en "${Red}██${BRed}██${IRed}██${BIRed}██"
echo -en "${Green}██${BGreen}██${IGreen}██${BIGreen}██"
echo -en "${Yellow}██${BYellow}██${IYellow}██${BIYellow}██"
echo -en "${Blue}██${BBlue}██${IBlue}██${BIBlue}██"
echo -en "${Purple}██${BPurple}██${IPurple}██${BIPurple}██"
echo -en "${Cyan}██${BCyan}██${ICyan}██${BICyan}██ \n"
echo "${Color_Reset_full}"

#--------------------------------------------------------------------
#---------------------------- Start Menu personalizado-------------
#menu
echo " "
echo " "
neofetch




```


## 2. Para  agregar a Git Bash

###### ❗Ejecutar modo administrador los comandos

1. Editaremos el fichero `C:\Program Files\Git\etc\bash.bashrc`
2.  Agregaremos la linea al final el siguiente codigo ejecutando el siguiente codigo
###### opcion 1 (ejecutar comando)
```shell

FILE_BASH_RC='/C/Program Files/Git/etc/bash.bashrc'
FILE_TEMP='./tmp_file'
# aqui ponemos e conetenido al fichero
echo "# ----------------------------------------------------" > $FILE_TEMP
echo "# --------------   Agregado por Cesar   --------------" >> $FILE_TEMP
echo "# ----------------------------------------------------" >> $FILE_TEMP
echo "" >> $FILE_TEMP
echo "# poner libs_shell en: (C:\Users\cesar\)" >> $FILE_TEMP
echo "if [ -f ~/libs_shell/init.sh ]; then" >> $FILE_TEMP
echo " source ~/libs_shell/init.sh" >> $FILE_TEMP
echo "fi" >> $FILE_TEMP

# ::: ejecutar script
cat $FILE_TEMP >> "${FILE_BASH_RC}"
# ::: eliminar temp
rm -rf $FILE_TEMP

```
###### opcion 2 (pegamos el siguienete contenido)

```shell
# ... 
# ----------------------------------------------------
# --------------   Agregado por Cesar   --------------
# ----------------------------------------------------

if [ -f ~/libs_shell/init.sh ]; then
 source ~/libs_shell/init.sh
fi


```
3. aqui  agregamos la carpeta `libs_shell` al home `C:\Users\cesar`

<img width="100%" src="https://i.imgur.com/sFTe0NA.png" alt="My cool logo"/>

-- -- 

-- -----------
## 3. para  linux

editar el archivo `vim ~/.bashrc` o `nvim ~/.bashrc`

```shell

# ----------------------------------------------------
# ----------- Start script Cesar ---------------------
# ----------------------------------------------------
scriptPath2=${0%/*}
CURRENT_USER=$(id -un)
CURRENT_PC_NAME=$(exec /usr/bin/hostname)
INFO_PC="${CURRENT_USER}@${CURRENT_PC_NAME}"
	
# :::::::: Importanmos las librerias
if [ -f "${HOME}/libs_shell/init.sh" ]; then
 source "${HOME}/libs_shell/init.sh"

fi
# ----------------------------------------------------
# ----------- end script Cesar -----------------------
# ----------------------------------------------------


```
# 🔴 Ojo si  dar eeor realizar el paso de  cdarle formato `unix` a los ficheros

<img src="https://i.imgur.com/sH2ikx6.png" alt="My cool logo"/>

-- --

comando 

#  ✅ opcion con comando SED (Mejor que utilize)
- CRLF -> de Windows
- LF   -> de Linux

```shell
# pondra todos en formato de Unix
find ${HOME}/libs_shell -type f -exec sed -i 's/\r//g' {} +
```
