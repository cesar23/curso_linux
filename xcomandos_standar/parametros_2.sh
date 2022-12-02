#!/bin/bash
function cdw {
    typeset dir
    printf "Paste Directory Path: "
    read -r dir || return
    cd ${dir:?}
}

cdw
