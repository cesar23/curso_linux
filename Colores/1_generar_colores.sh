
echo "-------------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------"
echo "------------------------ 7 colores Base ---------------------------------------"
echo "-------------------------------------------------------------------------------"
echo "--------(Negro, Azul, Verde, Cian, Rojo, Púrpura, Café, Amarillo, Gris)--------"
echo "-------------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------"

echo "  Negro = 0;30 "
echo "  Gris oscuro = 1;30 "
echo "  Azul = 0;34 "
echo "  Azul resaltado = 1;34 "
echo "  Verde = 0;32 "
echo "  Verde resaltado = 1;32 "
echo "  Cian = 0;36 "
echo "  Cyan resaltado = 1;36 "
echo "  Rojo = 0;31 "
echo "  Rojo resaltado = 1;31 "
echo "  Púrpura = 0;35 "
echo "  Púrpura resaltado = 1;35 "
echo "  Café = 0;33 "
echo "  Amarillo = 1;33 "
echo "  Gris = 0;37 "
echo "  Blanco = 1;37 "



echo ""
echo ""
echo "-------------------------------------------------------------------------------"
echo "--------------------------------- Ejemplo 1------------------------------------"
echo "-------------------------------------------------------------------------------"

echo ""
echo ""
echo 'apertura color=> \033[1;37m'
echo 'fin      color=> \e[m'
echo ""
echo ""

echo -e "\033[0m No color  [0m]"
echo -e "\033[1;37m WHITE  [1;37m]  \e[m  \t  \033[0;30m BLACK          [0;30m  \e[m"
echo -e "\033[0;34m BLUE   [0;34m]  \e[m  \t  \033[1;34m LIGHT_BLUE     [1;34m  \e[m"
echo -e "\033[0;32m GREEN  [0;32m]  \e[m  \t  \033[1;32m LIGHT_GREEN    [1;32m  \e[m"
echo -e "\033[0;36m CYAN   [0;36m]  \e[m  \t  \033[1;36m LIGHT_CYAN     [1;36m  \e[m"
echo -e "\033[0;31m RED    [0;31m]  \e[m  \t  \033[1;31m LIGHT_RED      [1;31m  \e[m"
echo -e "\033[0;35m PURPLE [0;35m]  \e[m  \t  \033[1;35m LIGHT_PURPLE   [1;35m  \e[m"
echo -e "\033[0;33m YELLOW [0;33m]  \e[m  \t  \033[1;33m LIGHT_YELLOW   [1;33m  \e[m"
echo -e "\033[1;30m GRAY   [1;30m]  \e[m  \t  \033[0;37m LIGHT_GRAY     [0;37m  "
echo -e "\033[0;30m GRAY   [1;30m]  \e[m  \t  \033[0;37m LIGHT_GRAY     [0;37m  "

echo ""
echo ""
#generar colores
echo "------------------------------------------------------------------------------------------------------------------"
echo "--------------------------------- Ejemplo 2------------------------------------"
echo "-------------------------------------------------------------------------------"
for x in {0..8}; do
    for i in {30..37}; do
        for a in {40..47}; do
            echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
        done
        echo
    done
done





echo ""
echo ""
echo "-------------------------------------------------------------------------------"
echo "--------------------------------- Ejemplo 3------------------------------------"
echo "-------------------------------------------------------------------------------"
T='gYw'   # The test text

echo -e "\n                 40m     41m     42m     43m\
     44m     45m     46m     47m";

for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
           '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
           '  36m' '1;36m' '  37m' '1;37m';
  do FG=${FGs// /}
  echo -en " $FGs \033[$FG  $T  "
  for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
    do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
  done
  echo;
done
echo

read

