
# echo "scriptPath: $scriptPath"
# echo "scriptPath2: $scriptPath2"
Fun_gitUp() {
  #----paranmetros
  PARAM_1=$1
  #---variables
  FECHA_HORA=$(date +'%Y-%m-%d_%H:%M:%S')
  cd $PARAM_1
  #---aqui se ejecuta
  git checkout qa
  git pull  
  git add -A 
  git commit -am "actualidado ${FECHA_HORA}"
  git push origin qa
  echo "-------------------------------------------------"
  echo "se actualizo repositorio $PARAM_1  - $FECHA_HORA"
}


Fun_gitTag() {
  #----paranmetros
  PARAM_1=$1
  PARAM_2=$2
  #---variables
  FECHA_HORA=$(date +'%Y-%m-%d_%H:%M:%S')
  FECHA_DATE=$(date +'%Y-%m-%d')
  NUMERO_TAG=$PARAM_2
  cd $PARAM_1
  #---aqui se ejecuta

  git tag -a v1.0.$NUMERO_TAG -m "Version 1.0.${NUMERO_TAG} - Fecha:${FECHA_DATE} "
  git push origin --tags


  echo "-------------------------------------------------"
  echo "Se creo tag en el repositorio $PARAM_1  - $FECHA_HORA"
}


Fun_getContador() {
  #----paranmetros
  PARAM_1=$1
  #PARAM_2=$2
  
  #---variables
  PATH_CONTADOR=$PARAM_1
  CONT=0

  #---aqui se ejecuta
  for line in $(cat $PATH_CONTADOR) 
    do 
      CONT=$line
  done
 
  echo $CONT
}


Fun_setContador() {
  #----paranmetros
  PARAM_1=$1
  PARAM_2=$2
  PARAM_3=$3
  #PARAM_2=$2
  
  #---variables
  PATH_CONTADOR=$PARAM_1
  VALOR_ACTUAL=$PARAM_2
  SUMARLE=$PARAM_3

  # CONT=$((CONT + 1))
  VALOR_ACTUAL=$((VALOR_ACTUAL + SUMARLE))
  echo $VALOR_ACTUAL >$PATH_CONTADOR
}


