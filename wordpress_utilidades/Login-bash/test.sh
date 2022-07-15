#!/bin/bash

urlencode()
{
    local S="${1}"
    local encoded=""
    local ch
    local o
    for i in $(seq 0 $((${#S} - 1)) )
    do
        ch=${S:$i:1}
        case "${ch}" in
            [-_.~a-zA-Z0-9])
                o="${ch}"
                ;;
            *)
                o=$(printf '%%%02x' "'$ch")
                ;;
        esac
        encoded="${encoded}${o}"
    done
    echo ${encoded}
}

URL="https://www.urlencoder.org/"
VAL_CONTADOR=$(urlencode  "${URL}")
WP_USER="perucaos@gmail.com"

WP_PASSWORD="cesar203"

data_raw='log='$WP_USER'&pwd='$WP_PASSWORD'&wp-submit=Acceder&redirect_to=http%3A%2F%2Fcurso_plugin_theme_wordpress.test%2Fwp-admin%2F&testcookie=1'

foo=222
printf -v foo '%s World' "$foo"
echo $data_raw

echo $VAL_CONTADOR
read
