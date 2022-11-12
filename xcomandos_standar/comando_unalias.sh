#---------------------------------------------------------
#------------unalias--------------------------------
#---------------------------------------------------------

# Elimina un alias, si el alias fue incluido en .~/.bashrc o en /etc/bashrc no lo elimina (habrá que editar los archivos).

# unalias ls elimina los alias para la orden ls

# unalias -a elimina todos los alias de todas las órdenes.

# A continuación se desarrolla una secuencia de ejemplos, el primer comando alias sin parámetros nos muestra la lista de alias, 
# luego creamos un alias para ls -l, lo ejecutamos, y luego lo borramos.



# alias creado
#alias ls='ls --color=auto'
alias ll='ls -l'
# ll
total 8
-rw-r--r-- 1 root root 716 abr  6 17:54 archivo2.txt
-rw-r--r-- 1 root root 101 abr  6 15:31 archivo.txt
# unalias ll
# ll
-bash: ll: no se encontró la orden