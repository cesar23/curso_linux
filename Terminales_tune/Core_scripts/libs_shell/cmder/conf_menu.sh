function menu(){

    echo "-------------------------------------------------"
    echo "------- Comandos favoritos!  version 1.0.2"
    echo "-------------------------------------------------"
    printf "\n\n"
    ##---------------------
    COMANDO="menu"
    printf  "   * command ${Purple}${COMANDO} ${Color_Off}: %s  ver menu favoritos \n"
    ##---------------------
    COMANDO="neofetch"
    printf  "   * command ${Purple}${COMANDO} ${Color_Off}: %s  ver info del sistema \n"
    ##---------------------
    COMANDO="gitup-qa"
    printf  "   * command ${Purple}${COMANDO} ${Color_Off}: actualiza repositorio actual en qa\n"
    ##---------------------
    COMANDO="gitup-all"
    printf  "   * command ${Purple}${COMANDO} ${Color_Off}: actualiza repositorio actual en qa\n"
    ##---------------------
    COMANDO="init_ssh"
    printf  "   * command ${Purple}${COMANDO} ${Color_Off}: ssh linux\n"
    ##---------------------
    COMANDO="path_shell_to_path_windows"
    printf  "   * command ${Purple}${COMANDO} ${Color_Off}: convierte path shell a Windows uso: path_shell_to_path_windows '/temp'\n"
    ##---------------------
    COMANDO="path_windows_to_path_shell"
    printf  "   * command ${Purple}${COMANDO} ${Color_Off}: convierte path windows a Shell uso: path_windows_to_path_shell '%s' \n" "c:\\\temp"
    ##---------------------
    COMANDO="start-docker-compose"
    printf  "   * command ${Purple}${COMANDO} ${Color_Off}: inicia docker-compose desde\n"
    ##---------------------
    COMANDO="reload_config"
    printf "\n"
    printf  "   * command ${Purple}${COMANDO} ${Color_Off}: recargar funciones,alias,conf extras\n"
    ##---------------------
    printf  "   ::-----------------------------------------------------------::\n"
    printf  "   ::------------------------ IDES -----------------------------::\n"
    printf  "   ::-----------------------------------------------------------::\n"
    COMANDO="xwst , xidea"
    printf  "   * commands ${Purple}${COMANDO} ${Color_Off}: Abrir ides Intellij\n"
    ##---------------------
    printf  "   ::-----------------------------------------------------------::\n"
    printf  "   ::------------------------ util -----------------------------::\n"
    printf  "   ::-----------------------------------------------------------::\n"
    COMANDO="xmobax"
    printf  "   * commands ${Purple}${COMANDO} ${Color_Off}: Abre Terminal mobaxTerm\n"

    COMANDO="run_server_py"
        printf  "   * commands ${Purple}${COMANDO} ${Color_Off}: abre un server local en python\n"
    COMANDO="cds"
    printf  "   * commands ${Purple}${COMANDO} ${Color_Off}: utiliza para  entrar a un directorio desde gitbash \n"
    printf  "                    ${Cyan} ejemplo: cds \'D:/repos/test_repos\' ${Color_Off} "

    #------------
    COMANDO="menu_proxmox"
    printf "\n"
    printf  "   * command ${Purple}${COMANDO} ${Color_Off}: Menu proxmox\n"


    #------------
    printf "\n"
    echo "-------------------------------------------------"
    echo "------- Compresion"
    echo "-------------------------------------------------"
    printf "\n"
    printf "   - comprimir: ${Cyan} cd path_direcotio && tar -czvf carpeta.tar.gz carpeta ${Color_Off} \n"
    printf "   - descomprimir: ${Cyan} tar -xzvf l3mon.tar.gz  ${Color_Off} \n"

    #------------
    printf "\n"
    echo "-------------------------------------------------"
    echo "------- SSH"
    echo "-------------------------------------------------"
    printf "\n"
    printf "   - descargar: ${Cyan} scp cesar@192.168.0.63:~/testdb.sh \"/drives/d/testdb.sh\" ${Color_Off} \n"
    printf "   - descargar: ${Cyan} scp  -i \"/drives/d/cmder/aws/cauris_sa-east-1.pem\" cesar@192.168.0.63:~/testdb.sh \"/d/\" ${Color_Off} \n"
    printf "   - upload: ${Cyan} scp \"/drives/d/expt64.zip\" \"cesar@192.168.0.63:/home/cesar/expt64.zip\"  ${Color_Off} \n"



    #------------
    printf "\n"
    echo "-------------------------------------------------"
    echo "------- Comandos Utilies"
    echo "-------------------------------------------------"
    printf "\n"
    printf "   - check ip public: ${Cyan} curl checkip.dyndns.org ${Color_Off} \n"
    printf "   - check ip public: ${Cyan} curl -4 icanhazip.com ${Color_Off} \n"
    printf "   - check ip public: ${Cyan} curl checkip.amazonaws.com ${Color_Off} \n"
    


    printf "\n"
    printf "\n"

}

function cesar(){
echo "${Color_Reset_full}"

echo -en "${Red} ▄████▄  ▓█████   ██████  ▄▄▄       ██▀███        ▄▄▄           ${Color_Off} \n"
echo -en "${Red}▒██▀ ▀█  ▓█   ▀ ▒██    ▒ ▒████▄    ▓██ ▒ ██▒     ▒████▄         ${BICyan}** favorite commands Cesar ** ${Color_Off}\n"
echo -en "${Red}▒▓█    ▄ ▒███   ░ ▓██▄   ▒██  ▀█▄  ▓██ ░▄█ ▒     ▒██  ▀█▄       \n"
echo -en "${Red}▒▓▓▄ ▄██▒▒▓█  ▄   ▒   ██▒░██▄▄▄▄██ ▒██▀▀█▄       ░██▄▄▄▄██      ${IBlue}IP Public: ${Color_Off}\n"
echo -en "${Red}▒ ▓███▀ ░░▒████▒▒██████▒▒ ▓█   ▓██▒░██▓ ▒██▒ ██▓  ▓█   ▓██▒     ${Color_Off} curl checkip.amazonaws.com${Color_Off}\n"
echo -en "${Red}▒ ▓███▀ ░░▒████▒▒██████▒▒ ▓█   ▓██▒░██▓ ▒██▒ ██▓  ▓█   ▓██▒     \n"
echo -en "${Red}░ ░▒ ▒  ░░░ ▒░ ░▒ ▒▓▒ ▒ ░ ▒▒   ▓▒█░░ ▒▓ ░▒▓░ ▒▓▒  ▒▒   ▓▒█░     ${IBlue}Menus: ${Color_Off}\n"
echo -en "${Red}  ░  ▒    ░ ░  ░░ ░▒  ░ ░  ▒   ▒▒ ░  ░▒ ░ ▒░ ░▒    ▒   ▒▒ ░     ${Color_Off} menu${Color_Off}\n"
echo -en "${Red}░           ░   ░  ░  ░    ░   ▒     ░░   ░  ░     ░   ▒        ${Color_Off} cesar${Color_Off}\n"
echo -en "${Red}░ ░         ░  ░      ░        ░  ░   ░       ░        ░  ░     ${Color_Off} neofetch${Color_Off}\n"
echo -en "${Red}░                                             ░                 \n"


echo "${Color_Reset_full}"
}
