echo "------------------------------------------------------------"
echo "-----------------funcion  normal-----------------------------"
echo "------------------------------------------------------------"
Fun_Saludo() {
  retval="hola muno"
  echo $retval # uso SALIDA=$(Fun_Saludo)

}
SALIDA=$(Fun_Saludo) # para  recoger el echo que  bota  la  funcion
echo "SE recogio Fun_Saludo: ${SALIDA}"

Fun_Saludo #mostrar defrente lo que  contiene  

echo "------------------------------------------------------------"
echo "------------------funcion con param-------------------------"
echo "------------------------------------------------------------"

Fun_Tarea_Param() {
    FECHA_HORA=$(date +'%d-%m-%Y %H:%M:%S')
    sleep 3
    echo "Tarea $1 completa - $FECHA_HORA"
}


SALIDA=$(Fun_Tarea_Param  "N°1" ) # para  recoger el echo que  bota  la  funcion
echo "SE recogio Fun_Tarea_Param: ${SALIDA}"