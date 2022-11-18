# ver discos
fdisk -l 
#montar para  ver  el disco y su contenido
ntfsfix /dev/sda1


#---entra a el disco virtual
cd /media/root/F4A7..

#-------------------- entra al confi de windows
cd Windows/System32/config

##-------------ver si hay el sam
ls -l SAM*

#----------- Ejecutar comando para editar
chntpw  -l  SAM

#-----------selecionamos el usuario
chntpw -u cauris SAM

#luego selecionar la opcion 1 y luego la opcion 2

