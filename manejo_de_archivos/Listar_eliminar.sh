#for i in $(ls  /D/backup/*.rar -ltr)
#for i in $(ls -ltr /D/backup/*.rar | grep ".rar")

# con est e  scriot eliminamos los backup antiguos y dejamos solo los  tres ultimos generados


array_dir_exclude=("uno" "tres")

PATH_DIR='/d/intel_vga_CFL'
cd $PATH_DIR

# ahora listamos | y  quitamos las barra /  con sed
for i in `ls  | sed 's/\///'`; do
        # si es  directorio entra  aqui
        if [ -d $i ]; then
                # si es un director que no hay  que  eliminar entrar  aqui
                if [[ " ${array_dir_exclude[@]} " =~ " ${i} " ]]; then
                   echo "No se elimino ${i}"
                else
                   echo "Si se elimino >>>>> ${i}"
                   rm -rf $i
                fi

        fi
done

read -p "Presionar [Enter]:" name

#echo "termino--------------------"
#sleep 5
#
##secuencia  corta
#for i in $(ls -ltr /D/backup/*.rar | awk '{ print $9 }'); do echo $i ; echo "Eliminar:${i}"; done
#echo "termino--------------------"
#sleep 20