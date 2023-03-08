
#######################################
# @description debuelve el peso de un path de directorio
# @author Cesar Auris
# @param str
# @return str
# @example: path_dir="D:/repos/curso_ojs"
#           PESO_DIR=$(fn_file__get_dir_weight "${path_dir}")
# @since   2023-19-28
#######################################
function fn_file__get_dir_weight() {
  #----paranmetros
  PATH_DIR=$1
  LOG_TEMP=$(dirname $0)
  LOG_TEMP="${LOG_TEMP}/get_weight.tmp"

  # ------------------------------------------
  # ----1 . obtenemos el peso y lo ponemos en un fichero temporal
  # ------------------------------------------

  #du -a  "D:/repos/curso_ojs" | sort -n -r | head -n 7 | awk '{printf $2 " - " ; system("  numfmt --to=iec-i --suffix=B --format=\"%.2f\"  $((" $1 " * 1000)) " ) }' > $scriptPathFileTemp
  du -a  "${PATH_DIR}" | sort -n -r | head -n 7 | awk '{printf $2 " - " ; system("  numfmt --to=iec-i --suffix=B --format=\"%.2f\"  $((" $1 " * 1000)) " ) }' > "${LOG_TEMP}"


  # ------------------------------------------
  # ----2 .leemos el fichero pero solo la primera linea
  # ------------------------------------------
  OUTPUT=`head -n 1 $LOG_TEMP`
  # eliminamos el fichero temporal
  rm -rf "${LOG_TEMP}"
  echo -n $OUTPUT
}


#######################################
# @description reemplaza el contenido de un fichero
# @author Cesar Auris
# @param str param_path_file
# @param str param_text_search
# @param str param_text_replace
# @return  ok
# @example:
#       param_path_file="O:/test/level1/test.txt"
#       param_text_search="perfect"
#       param_text_replace="kamu"
#       SALIDA=$(fn_replace_string_file)
# @since   2023-08-08
#######################################
fn_replace_string_file() {

  # 1. :::::::::::: valida parameters
  if [ ! -n "$param_path_file" ]; then
    echo "You supplied the first parameter! [set param_path_file]";exit
  fi
  if [ ! -n "$param_text_search" ]; then
    echo "You supplied the second parameter! [set param_text_search]";exit
  fi
  if [ ! -n "$param_text_replace" ]; then
    echo "You supplied the third parameter! [set param_text_replace]";exit
  fi
  # 2. :::::::::::: valida if exist file path
   if [ ! -f $param_path_file ]; then
     echo "No existe el fichero en: ${param_path_file}"
     exit
   fi

  # 3. :::::::::::: codigo
  FILE_PATH=`dirname $param_path_file`
  FILE_NAME=`basename $param_path_file`




  # FILE_PATH= ubicacion de donde buscara el archivo
  # -maxdepth 1  = para wu  solo lo busque  en un solo  nivel
  find "${FILE_PATH}" -maxdepth 1 -name "${FILE_NAME}"   -exec sed -i "s/${param_text_search}/${param_text_replace}/g" {} \;
  output_return="ok"
  echo $output_return # uso SALIDA=$(fn_replace_string_file)

}
