scriptPathDir=$(dirname $0)
scriptPathFile=$(realpath $0)
scriptPathFileName="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
echo "scriptPathDir: $scriptPathDir"
echo "scriptPathFile: $scriptPathFile"
echo "scriptPathFileName: $scriptPathFileName"


echo '##############################################'
echo '------- version 2 ---- cesar'
PATH_SCRIPT=`readlink -f "${BASH_SOURCE:-$0}"`
CURRENT_DIR=`dirname $PATH_SCRIPT`

echo 'The absolute path is' $PATH_SCRIPT
echo '---------------------------------------------'
echo 'The Directory Path is' $CURRENT_DIR
sleep 5

