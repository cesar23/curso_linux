# comando para eliminar el lismo script que se ejecuta

### ejemplo 1
creamos el archo `delete_me.sh`

```shell

currentscript="$0"

# Function that is called when the script exits:
function finish {
echo $(date +'%Y-%m-%d_%H-%M-%S') 
echo $(date +'%Y-%m-%d_%H-%M-%S') > salida.txt
# shred -u  ::: esto es un comando para  eliminado pero se obiara si no esta instalado
#echo "Securely shredding ${currentscript}"; shred -u ${currentscript};
echo "Securely shredding ${currentscript}"; 
sleep 3
}

# When your script is finished, exit with a call to the function, "finish":
trap finish EXIT
rm --  "$( readlink -f -- "${BASH_SOURCE[0]:-$0}" 2> '/dev/null'; )";

```

Opcion desde la linea comando

```shell
### ----------rsumido

echo "" > delete_me.sh
echo 'currentscript="$0"' >>delete_me.sh
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
chmod +x delete_me.sh

```