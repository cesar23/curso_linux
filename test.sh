
 PATH_REPO="/drives/c/repos/curso_docker/cesar/ff"
 result=$(echo "${PATH_REPO}" | sed -r -e 's/^\/drives\/([a-zA-Z])+\/(.*)/\/\1\/\2/' )
 result=$(echo "${result}" | sed "s/\//\\\\/g")
 result=$(echo "${result}" | sed -r -e 's/^\\([a-zA-Z])+\\(.*)$/\1:\\\2/' )
echo $result