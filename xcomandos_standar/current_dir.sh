scriptPathDir=$(dirname $0)
scriptPathFile=$(realpath $0)
scriptPathFileName="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
echo "scriptPathDir: $scriptPathDir"
echo "scriptPathFile: $scriptPathFile"
echo "scriptPathFileName: $scriptPathFileName"
sleep 5

