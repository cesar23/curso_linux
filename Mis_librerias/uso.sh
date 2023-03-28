PATH_SCRIPT=`readlink -f "${BASH_SOURCE:-$0}"`
CURRENT_DIR=`dirname $PATH_SCRIPT`
# --------------------------------------------------------
# ----- Para  encontrar el tipo de terminal actual--------
# --------------------------------------------------------
CURRENT_TERMINAL='gitbash'
# si se encuentra terminal mobax
if [ -n "$PUTTYHOME" ]; then
  CURRENT_TERMINAL='mobax'
fi


if [ -f "${CURRENT_DIR}/libs_shell/colors.sh" ]; then
  source "${CURRENT_DIR}/libs_shell/colors.sh"
fi

echo -en "${BBlack} color BBlack ${Color_Off} \n"
