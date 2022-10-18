
fuente
- https://linuxhint.com/trim_string_bash/

## Trim de string
```shell


# Declare a variable, $myVar with a string data
myVar="     Web Design Courses    "

# The following command will print the output with the leading and trailing spaces of the

echo "I want to learn $myVar from this site"

# The following `sed` command will remove the trailing spaces from the variable
myVar=`echo $myVar | sed 's/ *$//g'`

# Print the output after removing the spaces
echo "I want to learn $myVar from this site"
```

## Escribir en fichero
#### OPCION: 1 - puede fallar si hay codigo script shell
```shell
#cat > file_2.txt <<EOF
cat > ~/files_salida.txt <<EOF

info code info
info code info
info code info
info code info

EOF
```
#### OPCION: 2 - esta no falla hasta la fecha
aqui pintar con `echo ' '` ahi dentro lo que escribiremos
```shell
echo '' > delete_me.sh
echo 'currentscript="$0"'  >> delete_me.sh
echo '' >>delete_me.sh
echo '# Function that is called when the script exits:' >>delete_me.sh
echo 'function finish {' >>delete_me.sh
echo 'echo $(date +'%Y-%m-%d_%H-%M-%S')' >>delete_me.sh 
echo 'echo $(date +'%Y-%m-%d_%H-%M-%S') > salida.txt' >>delete_me.sh
echo '# shred -u  ::: esto es un comando para  eliminado pero se obiara si no esta instalado' >>delete_me.sh
echo '#echo "Securely shredding ${currentscript}"; shred -u ${currentscript};' >>delete_me.sh
echo 'echo "Securely shredding ${currentscript}";' >>delete_me.sh 
echo 'sleep 3' >>delete_me.sh
echo '}' >>delete_me.sh
echo '' >>delete_me.sh
echo '# When your script is finished, exit with a call to the function, "finish":' >>delete_me.sh
echo 'trap finish EXIT' >>delete_me.sh
echo 'rm --  "$( readlink -f -- "${BASH_SOURCE[0]:-$0}" 2> '/dev/null'; )";' >>delete_me.sh
```


# echo condicional
```shell
VARIABLE="yes"
# imprimora no si no existe al variable: VARIABLE
echo  ${VARIABLE-no}
```




read -p "Presionar:"
