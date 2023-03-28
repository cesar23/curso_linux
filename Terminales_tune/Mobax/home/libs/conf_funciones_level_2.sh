function run_server_py() {

  # current_dir_this=$(pwd)
  # PATH_IDE='/c/Program Files/JetBrains/WebStorm 2021.3/bin/'
  # PATH_EXE='webstorm64.exe'
  # # Aqui ejecutamos el ide con el path para  abrir el proyecto como en VSCODE
  # cd "$PATH_IDE" && start $PATH_EXE "${current_dir_this}" && cd "${current_dir_this}"
  # "${CMDER_ROOT}/config/libs/conf_funciones_level_1.sh"


current_dir_this=$(pwd)
port=8082
echo "Inicio Server python en : ${current_dir_this}"
echo "=====> http://localhost: ${port}"

PATH_WINDOWS=$(path_shell_to_path_windows  "${current_dir_this}")
echo $PATH_WINDOWS

#cd "${CMDER_ROOT}/config/libs" && python server_python.py $port "${current_dir_this}"
# cd "${CMDER_ROOT}/libs" && start python server_python.py $port "${PATH_WINDOWS}" && cd "${PATH_WINDOWS}"
cd "${CMDER_ROOT}/libs" && python server_python.py $port "${PATH_WINDOWS}"

}

