PATH_SCRIPT=`readlink -f "${BASH_SOURCE:-$0}"`
CURRENT_DIR=`dirname $PATH_SCRIPT`
# --------------------------------------------------------
# ----- Para  encontrar el tipo de terminal actual--------
# --------------------------------------------------------
CURRENT_TERMINAL='gitbash'

if [ "$SHELL" == "/usr/bin/bash" ]; then
    CURRENT_TERMINAL='gitbash'
    # si existe la variable $CMDER_ROOT es cmder
    if [ -n "$CMDER_ROOT"  ]; then
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



CURRENT_TERMINAL_SCRIPTS="${CURRENT_DIR}/${CURRENT_TERMINAL}"

echo "---------CURRENT_TERMINAL: ${CURRENT_TERMINAL}"
echo "---------CURRENT_TERMINAL_SCRIPTS: ${CURRENT_TERMINAL_SCRIPTS}"
