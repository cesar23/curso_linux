
declare -a RUTAS_REPOS=(
"https://grupoagama.com/wp-content/plugins/elementor-pro/assets/js/nav-menu.70d63d6d093f3a45a0c6.bundle.min.js"
"https://grupoagama.com/wp-content/plugins/elementor-pro/assets/js/animated-headline.ffb4bb4ce1b16b11446d.bundle.min.js"
"https://grupoagama.com/wp-content/plugins/elementor/assets/js/text-editor.2c35aafbe5bf0e127950.bundle.min.js"
"https://grupoagama.com/wp-content/plugins/elementor-pro/assets/js/form.72b77b99d67b130634d2.bundle.min.js"
"https://grupoagama.com/wp-content/plugins/elementor-pro/assets/js/popup.483b906ddaa1af17ff14.bundle.min.js"
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
