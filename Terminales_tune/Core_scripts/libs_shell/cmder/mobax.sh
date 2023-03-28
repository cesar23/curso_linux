#!/bin/bash
HOME=/drives/C/Users/cesar
cd $HOME

# -------------------------------------------------
# ------------- Personalizar pront ----------------
# -------------------------------------------------
# PS1=$'\[\e]0;$PWD\007\]$(_gp 1)
#\[\e[44m\e[30m\] \[\xEE\]\x83\xA8 \D{%d/%m/%Y} \[\e[42m\e[34m\]\[\xEE\x82\]\xB0\[\e[30m\] \[\xEE\]\x83\xA9 \D{%H:%M.%S} \[\e[0m\e[32m\]$(_gp 2)\[\xEE\x82\]\xB0\[\e[0m\] '
function ps_cesar (){
PS1=$'\[\e]0;$PWD\007\]$(_gp 1)
\[\e[44m\e[30m\] \[\xEE\]\x83\xA8 \D{%d/%m/%Y} \[\e[0m\e[32m\]$(_gp 2)\[\xEE\x82\]\xB0\[\e[0m\] \n
\[\e[42m\e[30m\]\[\xEE\x82\]\xB0\[\e[30m\] \[\xEE\]\x83\xA9 \D{%H:%M.%S} \[\e[0m\e[32m\]\[\xEE\x82\]\xB0\[\e[0m\] '
}
function ps_reset (){
PS1=$'\[\e]0;$PWD\007\]$(_gp 1)
\[\e[44m\e[30m\] \[\xEE\]\x83\xA8 \D{%d/%m/%Y} \[\e[42m\e[34m\]\[\xEE\x82\]\xB0\[\e[30m\] \[\xEE\]\x83\xA9 \D{%H:%M.%S} \[\e[0m\e[32m\]$(_gp 2)\[\xEE\x82\]\xB0\[\e[0m\] '
}
ps_cesar