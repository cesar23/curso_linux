DATE_HOUR_GIT="`date +%Y`-`date +%m`-`date +%d`_`date +%H`:`date +%M`:`date +%S`"
TIME_NOW="`date +%Y`-`date +%m`-`date +%d`_`date +%H`-`date +%M`-`date +%S`"
CURRENT_USER=$(id -un)
CURRENT_PC_NAME=$(exec /usr/bin/hostname)
MY_INFO="${CURRENT_USER}@${CURRENT_PC_NAME}"
PATH_SCRIPT=`readlink -f "${BASH_SOURCE:-$0}"`
CURRENT_DIR=`dirname $PATH_SCRIPT`
NAME_DIR=$(basename $CURRENT_DIR) # nombre del Directorio actual

scriptPathDir=$(dirname $0)
scriptPathFile=$(realpath $0)
scriptPathFileName="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")" # gitup.sh
scriptPathFileTemp=$(echo "$scriptPathFileName" | sed 's/.sh/.tmp/g') #  ${scriptPathDir}/gitup.tmp
scriptPathFileTemp_system=$(echo "${TMP}/${scriptPathFileName}" | sed 's/.sh/.tmp/g') # /tmp/gitup.tmp

# --------------------------------------------------------------------------------------
path_dir="/home/cesar/libs_shell"
#path_dir="/home/cesar/jenkins"

#dirs_backups="/home/cesar/backups"
dirs_backups="/E/backups"
mkdir -p $dirs_backups


#tar -zcvf "${dirs_backups}/${TIME_NOW}_name.tar.gz"  $path_dir
# ----obtener lo tres ultimos


cd $dirs_backups
# obetenmos los utlimos

ARRAY_FILES=()
for f in $(ls -lt  "${dirs_backups}/" |grep .tar.gz| awk '{print $9 }'| head -n 3 )
do
  ARRAY_FILES+=($f)
done

for key in "${!ARRAY_FILES[@]}"; do
#  echo "${key} ${ARRAY_FILES[${key}]}"
  echo "${ARRAY_FILES[${key}]}"
done
#find "/home/cesar/backups/" -iname "*.tar.gz" -type f   -exec ls -lt {} \;
#find "/home/cesar/backups/" -iname "*.tar.gz" -type f   -exec ls -lt {} \; | awk '{print $9 }'
#
function contains() {
    local n=$#
    local value=${!n}
    for ((i=1;i < $#;i++)) {
        if [ "${!i}" == "${value}" ]; then
            echo "y"
            return 0
        fi
    }
    echo "n"
    return 1
}

function check_in_array(){
  local search="$1"   # Save first argument in a variable
  shift            # Shift all arguments to the left (original $1 gets lost)
  local arr=("$@") # Rebuild the array with rest of arguments
  local output="n"
  if [[ "${arr[*]}" =~ ${search} ]] ; then
     output="y"
  fi

  echo $output
}

#result=$(check_in_array "2023-08-01_04-44-28_name.tar.gz" "${ARRAY_FILES[@]}")
#echo "--------------------"
#echo "salida:$result"
#if [ "$result" == "y" ]
#then
#   echo "si"
#else
#   echo "pno"
#fi
#exit

echo -en "\n\n\n"



echo -en "\n\n\n"
dosomething () {



  echo '-----------------------------------------------'
  local current_file_path=$1
  echo "Fichero path: $current_file_path"

  result=$(check_in_array "$current_file_path" "${ARRAY_FILES[@]}")
  echo "--------------------"
  echo "salida:$result"
  if [ "$result" == "y" ]
  then
     echo "si"
  else
     echo "pno"
  fi




  # Aqui verificamos si esta en los files que no se  deben eliminar no haremos  nada

sleep 2
}

find "${dirs_backups}/" -iname "*.tar.gz" -type f  | while read file; do dosomething "$file"; done

#find . -type f -not -path '*/\.git/*'
