echo currentscript="/usr/bin/bash"  >> delete_me.sh
echo  >> delete_me.sh
# Function that is called when the script exits:
function finish {
echo 2022-10-21_13-03-45
echo 2022-10-21_13-03-45 > salida.txt
# shred -u  ::: esto es un comando para  eliminado pero se obiara si no esta instalado
#echo "Securely shredding "; shred -u ;
echo "Securely shredding ";
sleep 3
}

# When your script is finished, exit with a call to the function, "finish":
trap finish EXIT
rm --  "/usr/bin/bash";
