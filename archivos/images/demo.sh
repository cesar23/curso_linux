#for i in peru*; do mv ${i} ${i}_v1 ; done
#regex para agrupar
regex='(^[a-z]+)+_+([a-z0-9]+)+(.*)'

#1. buscamos todos los archivos que empiezen con la  palabra  peru
for i in peru*
do
   # echo "${i}  - ${i}_v1"
   # sed -e 's/${i}/otro/g'
   # echo "$MYVAR" | sed -e 's/[a-zA-Z]/X/g' -e 's/[0-9]/N/g'

#reemplazar letras por la X
# echo "${i}" | sed -e 's/[a-zA-Z]/X/g'
[[ ${i} =~ $regex ]]
echo ${i}

#2. aplicamos el regex para obtener el nuevo nombre de archivo
# echo "${BASH_REMATCH[1]}_mio_${BASH_REMATCH[2]}.png" | sed -e 's/e/E/g'
new_file= "${BASH_REMATCH[1]}_mio_${BASH_REMATCH[2]}.png" | sed -e 's/e/E/g'
#reemplazamos el nombre del archivo aqui
mv ${i} $new_file
done
