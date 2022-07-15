#!/bin/bash
#------------------------------------------------
##-------------------para Encodear URL
#------------------------------------------------
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

urldecode()
{
    # urldecode <string>
    local url_encoded="${1//+/ }"
    printf '%b' "${url_encoded//%/\\x}"
}
#------uso
#URL="https://www.urlencoder.org/"
#VAL_CONTADOR=$(urlencode  "${URL}")
