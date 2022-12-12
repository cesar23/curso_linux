
function Ahora2() {
    FECHA_HORA=$(date +'%d-%m-%Y %H:%M:%S')
    sleep 1
    echo "Tarea $1 completa - $FECHA_HORA"
}
#-------uso----------
# # Primera tarea: desayuno
# Ahora desayuno 
# # Segunda tarea
# Ahora almuerzo 
# # Tercera tarea
# Ahora cena
 
#---------------------------------- 2 --------------------------------------------------------- 

# Directorio destino
DIR="${CMDER_ROOT}/logs"
 
# Nombre de archivo HTML a generar
ARCHIVO=monitor_prendido_cmder.html
 
# Fecha actual
FECHA=$(date +'%d/%m/%Y %H:%M:%S')
 
# Declaración de la función

# Comienzo de la generación del archivo HTML
# Esta primera parte constitute el esqueleto básico del mismo.
# echo "
# <br>
# <b>log de inicio:</b>$FECHA 
# " >> $DIR/$ARCHIVO

#----------------------------------------------------------------------------------------- 
#----------------------------------------------------------------------------------------- 
#----------------------------------------------------------------------------------------- 

#------ obtene el nombre del directorio actual
cdir(){
  arrIN=(${PWD//\// })
  echo ${arrIN[-1]}
}
