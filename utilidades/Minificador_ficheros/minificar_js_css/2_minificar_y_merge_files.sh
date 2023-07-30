#!/usr/bin/env bash
DATE_HOUR_GIT="$(date +%Y)-$(date +%m)-$(date +%d)_$(date +%H):$(date +%M):$(date +%S)"
DATE_HOUR_GIT="$(date +%Y)-$(date +%m)-$(date +%d)_$(date +%H):$(date +%M):$(date +%S)"
CURRENT_USER=$(id -un)
CURRENT_PC_NAME=$(exec /usr/bin/hostname)
MY_INFO="${CURRENT_USER}@${CURRENT_PC_NAME}"
PATH_SCRIPT=$(readlink -f "${BASH_SOURCE:-$0}")
CURRENT_DIR=$(dirname $PATH_SCRIPT)
NAME_DIR=$(basename $CURRENT_DIR) # nombre del Directorio actual

scriptPathDir=$(dirname $0)
scriptPathFile=$(realpath $0)
scriptPathFileName="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"      # gitup.sh
scriptPathFileTemp=$(echo "$scriptPathFileName" | sed 's/.sh/.tmp/g')                 #  ${scriptPathDir}/gitup.tmp
scriptPathFileTemp_system=$(echo "${TMP}/${scriptPathFileName}" | sed 's/.sh/.tmp/g') # /tmp/gitup.tmp

function minify_merge() {
  local file_output="$1" # Save first argument in a variable
  shift                  # Shift all arguments to the left (original $1 gets lost)
  local ARRAY_FILES=("$@")
  LINEA=0
  for element in "${ARRAY_FILES[@]}"; do

    FileName="$(basename "$(echo "$element")")"
    local extension="${element##*.}"
    let LINEA=LINEA+1
    if [[ $LINEA -eq 1 ]]; then # si es la primera linea
        # aqui ponemos la separacion
        line_1=""
        case $extension in
          "js")
           RES=$(minfify_file "$element")
           echo -en "// :::: <file: ${FileName} >\n ${RES}" > $file_output
            ;;
          "css")
          RES=$(minfify_file "$element")
           echo -en "/* :::: <file: ${FileName} >*/\n ${RES}" > $file_output
            ;;
          "html")
          RES=$(minfify_file "$element")
          echo -en "<!-- :::: <file: ${FileName} >-->\n ${RES}" > $file_output
            ;;
          esac

    else
      # aqui ponemos la separacion
      case $extension in
        "js")
        RES=$(minfify_file "$element")
        echo -en "\n// :::: <file: ${FileName} >\n ${RES}" >> $file_output
          ;;
        "css")
        RES=$(minfify_file "$element")
        echo -en "\n/* :::: <file: ${FileName} > */\n ${RES}" >> $file_output
          ;;
        "html")
        RES=$(minfify_file "$element")
        echo -en "\n<!-- :::: <file: ${FileName} > -->\n ${RES}" >> $file_output
          ;;
        esac


    fi
  done

}

#######################################
# @description funcion que retorma minificado el contenido
# @author Cesar Auris
# @param str
# @return void
# @example
# @since   2023-18-19
#######################################
function minfify_file() {
  # aqui instalamos los paquetes npm
#  npm i uglifyjs uglifycss html-minifier -g 2>&1 >"null"
  local FILE=$1
  local FILE_OUTPUT="${TMP}/temp_git_$(date +%s).tmp"
  local extension="${FILE##*.}"
  FileName="$(basename "$(echo "$FILE")")"
  case $extension in
  "js")
  uglifyjs $FILE -o $FILE_OUTPUT
    ;;
  "css")
  uglifycss $FILE > $FILE_OUTPUT
    ;;
  "html")
  html-minifier --collapse-whitespace \
   --remove-comments \
   --remove-optional-tags \
   --remove-redundant-attributes \
   --remove-script-type-attributes \
   --remove-tag-whitespace \
   --use-short-doctype \
   --minify-css true \
   --minify-js true \
   $FILE > $FILE_OUTPUT
    ;;

  esac
  cat $FILE_OUTPUT
  rm -rf $FILE_OUTPUT
}



# ---------------------------------------------------
# ------------ ❗❗ Ojo instalar paquetes -------------
#
#  npm install uglify-js -g
#  npm i uglifyjs uglifycss html-minifier -g
# ---------------------------------------------------

JS_FILES=(
  "./js/file1.js"
  "./js/file2.js"
)
CSS_FILES=(
    "./css/otro.css"
    "./css/front-end.css"
  )


# Aqui  hacemos los merges a los archivos
minify_merge "./all_js.js" "${JS_FILES[@]}"
minify_merge "./all_css.css" "${CSS_FILES[@]}"



