#!/bin/bash

function a() {
  curl errorr #tira error aqui y se  sale
  echo "aaaaa"

  # do some stuff here
}
function b() {
    echo "bbbb"
    ping www.google.com

  # do more stuff here
}

# this subshell is a scope of try
# try
(
  # this flag will make to exit from current subshell on any error
  # inside it (all functions run inside will also break on any error)
  set -Ee
#  set -e
  a
  b
  # do more stuff here
)
# and here we catch errors
# catch
errorCode=$?
if [ $errorCode -ne 0 ]; then
  # ---------start colores para errores ----------
  BRed='\e[1;31m'         # Red (Bold)
  Red='\e[0;31m'          # Red
  Color_Off='\e[0m'       # Text Reset
  # ---------end  colores para errores ----------
  echo -en "${BRed}Error Code (${errorCode}): ${Color_Off} \n"
  echo -en "${Red}We have an error${Color_Off} \n"

  # We exit the all script with the same error, if you don't want to
  # exit it and continue, just delete this line.
  exit $errorCode
fi

