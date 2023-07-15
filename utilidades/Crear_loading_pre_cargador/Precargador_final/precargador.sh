#!/bin/bash
#######################################
# @description Progresab para usarlo de maneja secuencial
# @author Cesar Auris
# @param str
# @return void
# @example
#       source precargador.sh
#       ProgressBar 10 ${end_number}  " iniciando copia.." && sleep 2
#
# @since   2023-28-14
#######################################
function ProgressBar {
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done
# Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")
printf "\r[${_fill// /#}${_empty// /-}] ${_progress}%% | ${3}"
}
