#!/bin/bash

if [ "$#" -eq 0 ]; then echo "x is \"time in seconds\" and z is \"message\""; echo "Usage: progressbar x z"; exit; fi
progressbar() {
        local loca=$1; local loca2=$2;
        declare -a bgcolors; declare -a fgcolors;
        for i in {40..46} {100..106}; do
                bgcolors+=("$i")
        done
        for i in {30..36} {90..96}; do
                fgcolors+=("$i")
        done
        local u=$(( 50 - loca ));
        local y; local t;
        local z; z=$(printf '%*s' "$u");
        local w=$(( loca * 2 ));
        local bouncer=".oO°Oo.";
        for ((i=0;i<loca;i++)); do
                t="${bouncer:((i%${#bouncer})):1}"
                bgcolor="\\E[${bgcolors[RANDOM % 14]}m \\033[m"
                y+="$bgcolor";
        done
        fgcolor="\\E[${fgcolors[RANDOM % 14]}m"
        echo -ne " $fgcolor$t$y$z$fgcolor$t \\E[96m(\\E[36m$w%\\E[96m)\\E[92m $fgcolor$loca2\\033[m\r"
};
timeprogress() {
        local loca="$1"; local loca2="$2";
        loca=$(bc -l <<< scale=2\;"$loca/50")
        for i in {1..50}; do
                progressbar "$i" "$loca2";
                sleep "$loca";
        done
        echo -e "\n"
};
timeprogress "$1" "$2"
