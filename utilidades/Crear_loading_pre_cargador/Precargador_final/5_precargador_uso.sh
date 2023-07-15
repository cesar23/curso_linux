#!/bin/bash
# 1. Create ProgressBar function
# 1.1 Input is currentState($1) and totalState($2)

#######################################
# @description Progresab para usarlo de maneja secuencial
# @author Cesar Auris
# @param str
# @return void
# @example
#       ProgressBar 10 ${end_number}  " iniciando copia.." && sleep 2
# @since   2023-28-14
#######################################

function ProgressBar {
# Process data
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done
# Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

# 1.2 Build progressbar strings and print the ProgressBar line
# 1.2.1 Output example:
# 1.2.1.1 Progress : [########################################] 100%
#printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%%"
printf "\r[${_fill// /#}${_empty// /-}] ${_progress}%% | ${3}"
}

end_number=100

ProgressBar 10 ${end_number}  " iniciando copia.." && sleep 2
ProgressBar 20 ${end_number}  " iniciando copia 2.." && sleep 2
ProgressBar 100 ${end_number} " iniciando copia 3.." && sleep 2
echo ""
echo "completado2"


