#!/bin/bash
# function dir_gspMarino(){
#   cd C:\\laragon\\www\\gspmarinov1
# }
# TODO ddsd
# function dir_gspTerrestre(){
#   cd C:\\laragon\\www\\gsptrackv1
# }
# function dir_cursoReact(){
#   cd C:\\Users\\Cesar\\cesar\\curso_ReacJs
# }

# function dir_aws(){
#   cd C:\\Users\\Cesar\\cesar\\aws
# }

# function dir_projectTerrestre(){
#   cd C:\\laragon\\www\\project_terrestre_node
# }

#######################################
# setea la hora de la variables globales
# @author Cesar Auris
# @return void
# @param name sin referencia
# @version 0.1 2022-03-04
#######################################
function reload_date(){
  DATE_HOUR="`date +%d`/`date +%m`/`date +%Y` - `date +%H`:`date +%M`:`date +%S`"
  DATE_HOUR_GIT="`date +%Y`-`date +%m`-`date +%d`_`date +%H`:`date +%M`:`date +%S`"
}

#######################################
# @description convierte path de shella  windows
# @author Cesar Auris
# @return object
# @param name $1
# @example path_shell_to_path_windows '/c/Desktop/proyecto-tracking/NonFood'
# @version 0.1 2022-03-04
#######################################
function path_shell_to_path_windows (){
    PATH_REPO=$1

  # --------- para Cmder
#  result=$(echo "${PATH_REPO}" | sed "s/\//\\\\/g")
#  result=$(echo "${result}" | sed 's/\\c\\/c:\\/')
#  result=$(echo "${result}" | sed 's/\\d\\/d:\\/')
#  result=$(echo "${result}" | sed 's/\\e\\/e:\\/')

  # --------- para Mobax
  result=$(echo "${PATH_REPO}" | sed -r -e 's/^\/drives\/([a-zA-Z])+\/(.*)/\/\1\/\2/' )
  result=$(echo "${result}" | sed "s/\//\\\\/g")
  result=$(echo "${result}" | sed -r -e 's/^\\([a-zA-Z])+\\(.*)$/\1:\\\2/' )

  echo $result
}

#######################################
# @description convierte un path windows a  shell
# @author Cesar Auris
# @return object
# @param name $1
# @example path_windows_to_path_shell "D:\repos\test_repos"
# @version 0.1 2022-03-04
#######################################
#function path_windows_to_path_shell (){
function path_windows_to_path_shell (){
    PATH_REPO=$1
    # PATH_REPO='/c/Desktop/proyecto-tracking/NonFood'

    # si pasan (D:/repos/otro)  salida (D:\repos\otro)
    PATH_REPO=$(echo "${PATH_REPO}"  | sed -e 's/\//\\/g')

    #\c\Desktop\proyecto-tracking\NonFood
    REGEX='s/^([a-zA-Z])+:\\(.*)$/\/\1\/\2/'
    if [ "$CURRENT_TERMINAL" == "mobax" ]
    then
       REGEX='s/^([a-zA-Z])+:\\(.*)$/\/drives\/\1\/\2/'
    fi

    # para cmder
    #result=$(echo "${PATH_REPO}" | sed -r -e 's/^([a-zA-Z])+:\\(.*)$/\/\1\/\2/' | sed -e 's/\\/\//g')
    # para mobax
    result=$(echo "${PATH_REPO}" | sed -r -e $REGEX  | sed -e 's/\\/\//g')
    echo $result
}



#######################################
# @description pasa como parametro un path windows y se ubica con cd en el directorio
# @author Cesar Auris
# @return void
# @param name sin referencia
# @example cds 'D:\repos\test_repos'
# @version 0.1 2022-03-04
#######################################
function cds (){
    typeset dir
    echo -en "${BIPurple}Paste Directory Path: ${Color_Off}"
    # printf "Paste Directory Path: "
    read -r dir || return
    # cd ${dir:?}

    # read -p "Ingresa path windows: " path_dir
    PATH_WINDOWS=$(path_windows_to_path_shell  "${dir}")
    cd "${PATH_WINDOWS}"
}



function login() {
  read -p 'Username: ' uservar
  read -sp 'Password: ' passvar
  echo ""
  echo "Thankyou ${uservar} tu passwork es:${passvar}"
}
#:: para  hacer commit en git
function gcm() {
    # ::-- start -- actualizar fecha y hora
    reload_date
    # ::-- end -- actualizar fecha y hora
	  git add -A
    read -p 'Message commit: ' msg_commit
    git commit -m "${msg_commit} | ${INFO_PC} se actualizo :${DATE_HOUR_GIT}"
    # git push -u origin master
}

function gitup() {
    # ::-- start -- actualizar fecha y hora
    reload_date
    CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
    echo -en "Actualizando rama actual: [${BGreen}${CURRENT_BRANCH}${Color_Off}] \n" && sleep 3
    git pull origin $CURRENT_BRANCH
    git add -A
    git commit -m "${msg_commit} | ${INFO_PC} se actualizo rama ${CURRENT_BRANCH} :${DATE_HOUR_GIT}"
    git push -u origin $CURRENT_BRANCH

    # git push
}

function gitup-qa() {
    # ::-- start -- actualizar fecha y hora
    reload_date
    # ::-- end -- actualizar fecha y hora
    git checkout qa
    git pull
	  git add -A
    read -p 'Message commit: ' msg_commit
    git commit -m "${msg_commit} | ${INFO_PC} se actualizo :${DATE_HOUR_GIT}"
    # git push -u origin master
    git push origin qa
}
function gitup-qa-fast() {
    # ::-- start -- actualizar fecha y hora
    reload_date
    # ::-- end -- actualizar fecha y hora
    git checkout qa
    git pull
	  git add -A
    git commit -m "commit fast| ${INFO_PC} se actualizo :${DATE_HOUR_GIT}"
    # git push -u origin master
    git push origin qa
}
function gitup-master() {
      # ::-- start -- actualizar fecha y hora
    reload_date
    # ::-- end -- actualizar fecha y hora
    git checkout master
    git pull
	  git add -A
    git commit -m "se actualizo :${DATE_HOUR_GIT}"
    # git push -u origin master
    git push master
}



function clo (){
  current_dir_this=$(pwd)
  read -p 'ingrese  repo: ' git_repo

  # Set comma as delimiter
  IFS='@'

  read -a strarr <<< "$git_repo"
  #cogemos el path ultimo
  REPO_DIR="${strarr[1]}"

  PATH_REPO="${current_dir_this}/${REPO_DIR}"
  PATH_WINDOWS=$(path_shell_to_path_windows  "${PATH_REPO}")


  echo "PATH_REPO: ${PATH_REPO}"
  echo "PATH_WINDOWS: ${PATH_WINDOWS}"
      if [ -d $PATH_WINDOWS ]
        then

            echo "------------------El repo ya  existe-----------------------------"
            echo "PATH_REPO: ${PATH_REPO}"

        else

            echo "------------------clonando-----------------------------"
              $git_repo
              sleep 2
              cd $PATH_REPO
              git checkout qa
              sleep 2
              pwd
              cd ..
          clear
      fi

  # cd $REPO_DIR
  # git checkout qa
  # sleep 2
  # pwd
  # cd ..
}


#######################################
# @descripcion
# @author Cesar Auris
# @return array
# @param name sin referencia
# @version 0.1 2022-03-04
#######################################

function fn_str_length() {
  #----paranmetros
  PARAM_1=$1
  #---variables
  STRLENGTH=$(echo -n $PARAM_1 | wc -m)
  printf $STRLENGTH
}

function fn_spaces(){
  #----paranmetros
  PARAM_1=$1

  STRLENGTH=$(fn_str_length $PARAM_1 )
  for i in $(seq 0 $STRLENGTH); do
  printf " "
  done
}

function fn_tal(){
  PARAM_1=$1
  # tail -f $PARAM_1 | awk '

  #   /DEBUG/ {print "\033[32m" $0 "\033[39m"}
  #   /TRACE/ {print "\033[4m" $0 "\033[39m"}
  #   /INFO/ {print "\033[33m" $0 "\033[39m"}

  # '

tail -f $PARAM_1 | sed --unbuffered \
    -e 's/\(.* DEBUG.*\)/\o033[1;32m\1\o033[39m/' \
    -e 's/\(.* WARN.*\)/\o033[1;33m\1\o033[39m/' \
    -e 's/\(.* ERROR.*\)/\o033[1;31m\1\o033[39m/' \
    -e 's/\(.* INFO.*\)/\o033[1;30m\1\o033[39m/' \
    -e 's/\(.* TRACE.*\)/\o033[34m\1\o033[39m/'

}


#------------------------------------------------------
#------------ para abrir Ides de Windows
#------------------------------------------------------

#:: Webstorm
function xws (){
  current_dir_this=$(pwd)

   PATH_IDE='/c/Program Files/JetBrains/WebStorm 2021.3/bin/'
   if [ "$CURRENT_TERMINAL" == "mobax" ]
    then
      PATH_IDE='/drives/c/Program Files/JetBrains/WebStorm 2021.3/bin/'
   fi

  PATH_EXE='webstorm64.exe'
  # Aqui ejecutamos el ide con el path para  abrir el proyecto como en VSCODE
  cd "$PATH_IDE" && start $PATH_EXE "${current_dir_this}" && cd "${current_dir_this}"
}

#:: Webstorm
function xidea (){
  current_dir_this=$(pwd)
  PATH_IDE='/c/Program Files/JetBrains/WebStorm 2021.3/bin/'
  if [ "$CURRENT_TERMINAL" == "mobax" ]
   then
     PATH_IDE='/drives/c/Program Files/JetBrains/WebStorm 2021.3/bin/'
  fi
  PATH_EXE='idea64.exe'
  # Aqui ejecutamos el ide con el path para  abrir el proyecto como en VSCODE
  cd "$PATH_IDE" && start $PATH_EXE "${current_dir_this}" && cd "${current_dir_this}"
}


function loadCygwin64(){

    SET CHERE_INVOKING=1 && "C:\cygwin64\bin\bash.exe --login -i" -new_console:p:C:"C:\cygwin64\Cygwin.ico"

}


