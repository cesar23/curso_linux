
declare -a RUTAS_REPOS=(
"https://grupoagama.com/wp-content/plugins/elementor/assets/lib/font-awesome/webfonts/fa-regular-400.woff"
"https://grupoagama.com/wp-content/plugins/elementor/assets/lib/font-awesome/webfonts/fa-solid-900.woff"
"https://grupoagama.com/wp-content/plugins/elementor/assets/lib/font-awesome/webfonts/fa-brands-400.woff"
"https://grupoagama.com/wp-content/plugins/elementor/assets/lib/font-awesome/webfonts/fa-solid-900.woff"
"https://grupoagama.com/wp-content/plugins/elementor/assets/lib/font-awesome/webfonts/fa-regular-400.woff"
"https://grupoagama.com/wp-content/plugins/elementor/assets/lib/font-awesome/webfonts/fa-brands-400.woff"
"https://grupoagama.com/wp-content/plugins/elementor/assets/lib/font-awesome/webfonts/fa-solid-900.ttf"
"https://grupoagama.com/wp-content/plugins/elementor/assets/lib/font-awesome/webfonts/fa-regular-400.ttf"
"https://grupoagama.com/wp-content/plugins/elementor/assets/lib/font-awesome/webfonts/fa-brands-400.ttf"
"https://grupoagama.com/wp-content/plugins/elementor/assets/lib/eicons/fonts/eicons.woff"
"https://grupoagama.com/wp-content/plugins/elementor/assets/lib/eicons/fonts/eicons.woff"
"https://grupoagama.com/wp-content/plugins/elementor/assets/lib/eicons/fonts/eicons.woff"
"https://grupoagama.com/wp-content/plugins/elementor/assets/lib/eicons/fonts/eicons.ttf"
"https://grupoagama.com/wp-content/plugins/elementor/assets/lib/eicons/fonts/eicons.ttf"
);

for element in "${RUTAS_REPOS[@]}"
do
    # ejecutar funcion que actualizara  repo
    echo "-------------------------------------------------------------"
    echo "----------repor name:${element}------------------"
    wget --random-wait -r -p -e robots=off  \
    --user-agent= "Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Mobile Safari/537.36" \
    $element

done
