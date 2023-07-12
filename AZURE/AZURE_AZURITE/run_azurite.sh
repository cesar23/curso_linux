# npm install -g azurite
#echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::"
#echo ":::::::::::::::: Run service Azurite :::::::::::::::::"
#echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::"
PATH_SCRIPT=$(readlink -f "${BASH_SOURCE:-$0}")
CURRENT_DIR=$(dirname $PATH_SCRIPT)
# --------------------------------------------------------
# ----- Para  encontrar el tipo de terminal actual--------
# --------------------------------------------------------
CURRENT_TERMINAL='gitbash'

if [ "$SHELL" == "/usr/bin/bash" ]; then
  CURRENT_TERMINAL='gitbash'
  # si existe la variable $CMDER_ROOT es cmder
  if [ -n "$CMDER_ROOT" ]; then
    CURRENT_TERMINAL='cmder'
  fi

fi

# si la  shel es de Linux
if [ "$SHELL" == "/bin/bash" ]; then
  CURRENT_TERMINAL='linux'
fi

# si la  shel es de mobax
if [ "$SHELL" == "/bin/bash.exe" ]; then
  CURRENT_TERMINAL='mobax'
fi

case "$CURRENT_TERMINAL" in
# ---------------------------------------------------------
# gitbash
# ---------------------------------------------------------
"gitbash")

  (
    # 1. buscamos el proceso que esta usando el puerto 10000 y lo matamos
    kill -9 $(netstat -p tcp -ano | grep :10000 | awk '{print $5}') 2>/dev/null
    sleep 2
    # 2. Corremos el comando de azurite
    PATH_AZUITE="/c/azurite"
    azurite --silent --location $PATH_AZUITE --debug $PATH_AZUITE/debug.log

  ) &
  PID=$! #simulate a long process

  echo "THIS MAY TAKE A WHILE, PLEASE BE PATIENT WHILE ______ IS RUNNING..."
  printf "["
  # While process is running...
  while kill -0 $PID 2>/dev/null; do
    printf "▓"
    sleep 0.5
  done
  printf "] done!"

  ;;

  # ---------------------------------------------------------
  # cmder
  # ---------------------------------------------------------
"cmder") ;;

  # ---------------------------------------------------------
  # Linux
  # ---------------------------------------------------------
"linux") ;;

  # ---------------------------------------------------------
  # mobax
  # ---------------------------------------------------------
"mobax")

  (
    # 1. buscamos el proceso que esta usando el puerto 10000 y lo matamos
#    kill -9 $(netstat -p tcp -ano | grep :10000 | awk '{print $5}')
    bash
    process=$(netstat -p tcp -ano | grep :10000 | awk '{print $5}')
    exec kill -9 $process
    sleep 2
    # 2. Corremos el comando de azurite
#    PATH_AZUITE="/drives/C/azurite"
#    azurite --silent --location $PATH_AZUITE --debug $PATH_AZUITE/debug.log

  ) &
  PID=$! #simulate a long process

  echo "THIS MAY TAKE A WHILE, PLEASE BE PATIENT WHILE ______ IS RUNNING...2"
  printf "["
  # While process is running...
  while kill -0 $PID 2>/dev/null; do
    printf "▓"
    sleep 0.5
  done
  printf "] done!"

  ;;

esac

read
