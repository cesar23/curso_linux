
declare -a RUTAS_REPOS=(
"https://wordpress-estatico.local/wp-content/uploads/elementor/css/wp-content/uploads/2021/01/mmmm.webp"
"https://test.solucionessystem.com/wp-content/uploads/2021/01/mmmm.webp"
);





for element in "${RUTAS_REPOS[@]}"
do


    # ejecutar funcion que actualizara  repo
    echo "-------------------------------------------------------------"
    echo "----------repor name:${element}------------------"
   wget --random-wait -r -p -e robots=off  \
# --convert-links \
--user-agent= "Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Mobile Safari/537.36" \
$element

done



#  wget --random-wait -r -p -e robots=off  \
#  --convert-links \
# --user-agent= "Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Mobile Safari/537.36" \



read pause