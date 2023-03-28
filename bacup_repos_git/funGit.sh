scriptPathDir=$(dirname $0)
scriptPathFile=$(realpath $0)
scriptPathFileName="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

fun_show_message_python() {
PARAM_1=$1
  PYCMD=$(cat <<EOF
import win32api
message="${PARAM_1}"
win32api.MessageBox(0, message, 'title')
EOF
  )
  python -c "$PYCMD"
}
# echo "scriptPath: $scriptPath"
# echo "scriptPath2: $scriptPath2"
Fun_gitUp() {
  #----paranmetros
  PARAM_1=$1
  #---variables
  FECHA_HORA=$(date +'%Y-%m-%d_%H:%M:%S')
  cd $PARAM_1
  #---aqui se ejecuta
  git pull origin master >null
  git add -A >null
  git commit -am "actualidador diario ${FECHA_HORA} | ${INFO_PC}" >null
  git push origin master >nulll
  echo "-------------------------------------------------"
  echo "se actualizo repositorio $PARAM_1  - $FECHA_HORA"
}


Fun_gitUp_v2() {
  #----paranmetros
  PARAM_1=$1
  PARAM_2=$2
  RAMA=$PARAM_2
  #---variables
  FECHA_HORA=$(date +'%Y-%m-%d_%H:%M:%S')
  cd $PARAM_1
  #---aqui se ejecuta
  echo "==================================="
  echo "===========  salida  =============="
  echo "==================================="
  echo ""
  echo "Repositorio: ${PARAM_1//\\//}"
  echo "Rama:        ${RAMA}"
  echo "Fecha:       ${FECHA_HORA}"
  echo "==================================="
  echo ""



  STD_OUT=""
  STD_ERR=""
  STD_RC=""
  #--------------------------------------------------------------------------------
  #---------------------- 1 Para origin : que es para gitlab-------------------------
  #--------------------------------------------------------------------------------
    echo "::::::::::::::::::::::::::::::::::::::::"
    echo ":::::::::: Repo - GITLAB :::::::::::::::"
    echo "::::::::::::::::::::::::::::::::::::::::"
    echo ""

#  git pull origin ${RAMA} >null
#ERROR=$(cat file1.txt nofile.txt 2>&1 > /dev/null)
  if result=$(git pull origin ${RAMA} 2>&1); then
      STD_OUT=$result
  else
      STD_RC=$?
      STD_ERR=$result
      GLOBAL_MSG+=('aaaaaaaa')
      fun_show_message_python "Erro en repositorio: ${PARAM_1//\\//}"
      #echo "xxx :: $STD_ERR"
      #echo "STD_OUT:${STD_OUT}, STD_ERR:${STD_ERR}, STD_RC:${STD_RC} \n" && echo $GLOBAL_AUTHOR
  fi



    git add -A >null
    git commit -am "actualidador diario ${FECHA_HORA} | ${INFO_PC}" >null
    git push origin ${RAMA} >null

    #--------------------------------------------------------------------------------
    #---------------------- 2 Para origin2 : que es para gitHub-------------------------
    #--------------------------------------------------------------------------------
    echo "::::::::::::::::::::::::::::::::::::::::"
    echo ":::::::::: Repo - GITHUB :::::::::::::::"
    echo "::::::::::::::::::::::::::::::::::::::::"
    echo ""
    git push origin2 ${RAMA}
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


