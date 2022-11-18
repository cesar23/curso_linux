#for i in $(ls  /D/backup/*.rar -ltr)
#for i in $(ls -ltr /D/backup/*.rar | grep ".rar")

# con est e  scriot eliminamos los backup antiguos y dejamos solo los  tres ultimos generados
count=0
for i in $(ls -lt /D/backup/*.rar | awk '{ print $9 }')
do

    count=$((count + 1))

    if [[ $count -gt 3 ]];  then
            echo "Eliminar:${i} - ${count}"
           else
               echo "Yes:${i} - ${count}"
    fi;



#    rm filename
done


echo "termino--------------------"
sleep 5

#secuencia  corta
for i in $(ls -ltr /D/backup/*.rar | awk '{ print $9 }'); do echo $i ; echo "Eliminar:${i}"; done
echo "termino--------------------"
sleep 20