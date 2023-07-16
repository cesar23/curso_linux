#######################################
# @description lee ficheros env de configuracion
# @author Cesar Auris
# @param $1 key a buscar
# @param $2 path del fichero .env
# ---------------------------
# @return str
# @example
#   find_env 'MYSQL_LOG_DIR' '/D/repos/curso_linux/xcomandos_standar/.env'
# @since   2023-23-15
#######################################
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
#valor=$( find_env 'MYSQL_LOG_DIR' '/D/repos/curso_linux/xcomandos_standar/.env' )
#echo "Resultado:"
#echo $valor
