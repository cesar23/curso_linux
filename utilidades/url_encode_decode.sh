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


URL="https://www.urlencoder.org/"
echo "URL ORIGINAL:${URL}"
URL_ENCODE=$(urlencode  "${URL}")

echo "---------------------------------------"
echo "URL ENCODE: ${URL_ENCODE}"
echo "---------------------------------------"
URL_DECODE=$(urldecode  "${URL_ENCODE}")
echo "URL DECODE: ${URL_DECODE}"
read
