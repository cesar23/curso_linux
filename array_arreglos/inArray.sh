
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
containsElement "a string" "${array[@]}"
echo $?

echo ''
echo '-------------------------------------------------------------'
echo '-------------------------------------------------------------'

containsElement "blaha" "${array[@]}"
echo $?

#-------------------------------
echo ''
echo '-------------------------------------------------------------'
echo '-------------------------------------------------------------'
if [ $(contains "${array[@]}" "test2000") == "y" ]; then
    echo "contains one"
fi

#-------------------------------
echo ''
echo '-------------------------------------------------------------'
echo '-------------------------------------------------------------'
value="test2000"
if [[ " ${array[@]} " =~ " ${value} " ]]; then
   echo "si"
fi


read -p "Presionar [Enter]:" name
