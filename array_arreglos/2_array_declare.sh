#! /bin/bash
declare -a Unix=('Debian' 'Red hat' 'Red hat' 'Suse' 'Fedora');

echo "Ahora Hay:${Unix[1]}"

#vaciar 
unset Unix

echo "Ahora Hay:${Unix[1]}"