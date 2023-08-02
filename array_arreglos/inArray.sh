
containsElement () {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 1; done
  return 0
}
searchStringArray () {
   param_array="$1"
   param_valor="$2"
#[[ ${array[*]} =~ 'a' ]]
#  if [[ " ${param_array[@]} " =~ " ${param_valor} " ]]; then
  if [[ "${param_array[*]}" =~ ${param_valor} ]]; then
    echo 1
    else
    echo 0
  fi

}

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

array=("something to search for" "a string" "test2000")

echo ''
echo '-------------------------------------------------------------'
echo '--- 1. buscar si existen el contenido en un array -----------'
echo '-------------------------------------------------------------'
echo ''

containsElement "a string" "${array[@]}"
# ojo tiene que  llamarse de esat  manera por que  sino  no funciona
SALIDA=$?
if [[ "$SALIDA" == "1" ]]; then
    echo "si"
else
  echo "no"
fi



echo ''
echo '-------------------------------------------------------------'
echo '--- 3. busca que sea igual el string a un array   -----------'
echo '-------------------------------------------------------------'
echo ''

if [ $(contains "${array[@]}" "test2000") == "y" ]; then
    echo "si esta el valor"
fi

#-------------------------------
echo ''
echo '-------------------------------------------------------------'
echo '--- 4. busca un string dentro de los arrays - Cesar  -----------'
echo '-------------------------------------------------------------'
echo ''
value="tesgt"
#::::: opcion 1 :  exacto string
#if [[ " ${array[@]} " =~ " ${value} " ]]; then

#::::: opcion 2 :  contenga string en el array
if [[ "${array[*]}" =~ ${value} ]] ; then
   echo "si"
fi


#read -p "Presionar [Enter]:" name
