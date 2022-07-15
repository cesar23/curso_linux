scriptPath=$(dirname $0)
scriptPath2=${0%/*}
# echo "scriptPath: $scriptPath"
# echo "scriptPath2: $scriptPath2"
Fun_Tarea_Param() {
    FECHA_HORA=$(date +'%d-%m-%Y %H:%M:%S')
    sleep 3
    echo "Tarea $1 completa - $FECHA_HORA"
}

Fun_Saludo() {
  retval="hola muno"
  echo $retval # uso SALIDA=$(Fun_Saludo)

}