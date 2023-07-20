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

function merge_files() {
  local file_output="$1" # Save first argument in a variable
  shift                  # Shift all arguments to the left (original $1 gets lost)
  local ARRAY_FILES=("$@")
  file_temp="${TMP}/temp_git_$(date +%s).tmp"
  LINEA=0
  for element in "${ARRAY_FILES[@]}"; do
    FileName="$(basename "$(echo "$element")")"
    local extension="${element##*.}"
    let LINEA=LINEA+1
    if [[ $LINEA -eq 1 ]]; then # si es la primera linea
        # aqui ponemos la separacion
        case $extension in
          "js")
          printf "// :::: <file: %s >\n" "$FileName" >>$file_temp
            ;;
          "css")
          printf "/* :::: <file: %s > */\n" "$FileName" >>$file_temp
            ;;
          "html")
         printf "<!-- :::: <file: %s > -->\n" "$FileName" >>$file_temp
            ;;
          esac
      # aqui ponemos seteamos
      cat "$element" >>$file_temp
    else
      # aqui ponemos la separacion
      case $extension in
        "js")
        printf "\n// :::: <file: %s >\n" "$FileName" >>$file_temp
          ;;
        "css")
        printf "\n/* :::: <file: %s > */\n" "$FileName" >>$file_temp
          ;;
        "html")
       printf "\n<!-- :::: <file: %s > -->\n" "$FileName" >>$file_temp
          ;;
        esac
      # aqui ponemos seteamos
      cat "$element" >>$file_temp
    fi
  done
  cat $file_temp >"${file_output}"
  rm -rf $file_temp
}
function minfify_file() {
  # aqui instalamos los paquetes npm
  local FILE=$1
  local FILE_OUTPUT=$2
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
  *)
    echo "No selecionastes nada"
    ;;
  esac

}

JS_FILES=(
  "./js/file1.js"
  "./js/file2.js"
)
CSS_FILES=(
    "./css/otro.css"
    "./css/front-end.css"
  )

# ---------------------------------------------------
# ------------ ❗❗ Ojo instalar paquetes -------------
#
#  npm i uglifyjs uglifycss html-minifier -g
# ---------------------------------------------------


# Aqui  hacemos los merges a los archivos
merge_files "./all_js.js" "${JS_FILES[@]}"
merge_files "./all_css.css" "${CSS_FILES[@]}"

# aqui hacemos el minify
minfify_file "./all_js.js" "./all_js.min.js"
minfify_file "./all_css.css" "./all_css.min.css"


