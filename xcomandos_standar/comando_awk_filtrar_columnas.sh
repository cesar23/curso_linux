# https://byte-mind.net/descubriendo-el-potencial-de-awk/

# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#:: buscar lineas que contengas la palabra (account)
awk '/account/ {print}' examples_2.txt
# output:
#   julia director account 25000
#   nairobi clerk account 20000
#   sila engineer account 21000


printf "\n--------------------------------------\n\n"

# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#::::::::: Definir por donde realizaremos la separacion
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#     FS -> contiene el carácter separador de campo (espacio o TAB por defecto)
#           y se utiliza para dividir campos.
#     OFS -> almacena el separador de campo de salida y se utiliza para separar
#           los campos cuando AWK los imprime

awk 'BEGIN{FS=" "; OFS="-"} {print $1,$3,$4}' examples_2.txt
# output:
#   john-sales-30000
#   julia-account-25000
#   bjorn-purchase-20000
#   bhavesh-sales-30000
#   rajesh-sales-40000
#   nairobi-account-20000
#   jack-purchase-23000
#   deep-sales-20000
#   steven-purchase-32000
#   sila-account-21000


printf "\n--------------------------------------\n\n"
#awk 'BEGIN{FS="=";OFS="😀"}  {print $1,$2 }' examples_3.txt
#awk 'BEGIN{FS="=";OFS=""} /^MYSQL_DATA_DIR/  {print $2,$3 }' examples_3.txt
awk 'BEGIN{FS="=";OFS=""} /^PHP_INI_MCRYPT/  {print $2,$3 }' .env

##:creacion de funcion para  buscar en un env
function find_env(){
 key=$1
 path_file=$2
 # line_http=$(awk 'BEGIN{FS="=";OFS=""} /^PHP_INI_MCRYPT/  {print $2,$3 }' $1 )
 #:::::::: Opcion 1 - buscar la ultima coincidencia
 # line_http=$(awk "BEGIN{FS=\"=\";OFS=\"\"} /^${key}/  {print \$2,\$3 }" $path_file | tail -n 1 )
 #:::::::: Opcion 2 - buscar la primera coincidencia
 line_http=$(awk "BEGIN{FS=\"=\";OFS=\"\"} /^${key}/  {print \$2,\$3 }" $path_file | head -n 1 )
 echo $line_http
}
printf "\n------------------fin--------------------\n\n"
valor=$( find_env 'MYSQL_LOG_DIR' '/D/repos/curso_linux/xcomandos_standar/.env' )
echo "Resultado:"
echo $valor

