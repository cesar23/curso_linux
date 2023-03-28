#------------------------------------------------------
#------------ para abrir Ides de Windows
#------------------------------------------------------

#:: Webstorm
function xwst (){
  current_dir_this=$(pwd)
  PATH_IDE='/c/Program Files/JetBrains/WebStorm 2021.3/bin/'
  PATH_EXE='webstorm64.exe'
  # Aqui ejecutamos el ide con el path para  abrir el proyecto como en VSCODE
  cd "$PATH_IDE" && start $PATH_EXE "${current_dir_this}" && cd "${current_dir_this}"
}

#:: Webstorm
function xidea (){
  current_dir_this=$(pwd)
  PATH_IDE='/c/Program Files/JetBrains/IntelliJ IDEA 2021.3/bin/'
  PATH_EXE='idea64.exe'
  # Aqui ejecutamos el ide con el path para  abrir el proyecto como en VSCODE
  cd "$PATH_IDE" && start $PATH_EXE "${current_dir_this}" && cd "${current_dir_this}"
}

#:: mobax
function xmobax (){
  current_dir_this=$(pwd)
  PATH_IDE="${CMDER_ROOT}/MobaXterm_Portable/"
  PATH_EXE='MobaXterm_Personal_21.1.exe'
  # Aqui ejecutamos el ide con el path para  abrir el proyecto como en VSCODE
  cd "$PATH_IDE" && start $PATH_EXE "${current_dir_this}" && cd "${current_dir_this}"
}
