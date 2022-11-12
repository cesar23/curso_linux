#!/usr/bin/env bash
scriptPathDir=$(dirname $0)
scriptPathFile=$(realpath $0)
scriptPathFileName="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

cd $scriptPathDir
echo "Dirextorio $(dirname $0)"
#php -S localhost:8000
php -S 0.0.0.0:8000 mantenimiento.php