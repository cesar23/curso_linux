#--------------------------------------------------------------
#------------------ comando - SET -----------------------
#--------------------------------------------------------------
# fuente:http://redsymbol.net/articles/unofficial-bash-strict-mode/


# Muestra/Modifica "todas" las variables de shell, incluyendo las variables definidas por el usuario, 
# las modificaciones sólo tendrán validez dentro de la sesión.
# set Muestra "todas" las variables de ambiente.
set
	
	set -a #A partir de este momento, las variables que se declaren se exportan automaticamente a globales sin necesidad de ejecutar "export variable"
	set -b #Si disponemos de una aplicacion que se ejecuta en segundo plano, nos reporta el estado una vez haya terminado.
	set -x #Imprime una traza de comandos simples, para comandos, comandos de casos Buevo para hacer DEBUG
	set -vx #Muestra las lineas que va ejecutando nuestra script. Para desactivar-lo: set +xv
	set variable=valor #Se crea una variable local
	export variable #Se pasa la variable local a global
	echo ${variable} Muestra la variable
	


# yo uso 
set -x #modo degub y lo quito set +x
	
#--------------------------------------------------------------
#------------------ ejemplos-----------------------
#--------------------------------------------------------------
	
	# root@ubuntu:~# set -x
	# root@ubuntu:~# echo `expr 10 + 20 `
	# ++ expr 10 + 20
	# + echo 30
	# 30
	
	
	# root@ubuntu:~# set -vx
	# root@ubuntu:~# echo "peru"
	# echo "peru"
	# + echo peru
	# peru
	
	
#---------------------REgresar todo como estaba  antes-----------------------------------------
set +xv
