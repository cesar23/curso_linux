  # fuente:
    #  https://geekland.eu/uso-del-comando-sed-en-linux-y-unix-con-ejemplos/
    # https://www.ionos.es/digitalguide/servidores/configuracion/comando-sed-de-linux/

# trucos:
#   https://es.ccm.net/faq/3052-sed-trucos-y-tips
#   https://linuxhint.com/50_sed_command_examples/


#---------------------------------------------------------------------
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>> PARAMETROS <<<<<<<<<<<<<<<<<<<<<<<<<<<
#---------------------------------------------------------------------<


#      +-----------+------------------------------------------------------------------------------------------+
#      | Parametro | Descripcion                                                                              |
#      +-----------+------------------------------------------------------------------------------------------+
#      | -v        | modo detallado.                                                                          |
#      +-----------+------------------------------------------------------------------------------------------+
#      | -r        | esta opción copia los datos de forma recursiva sin dejar las marcas de tiempo y el       |
#      |           | permiso durante el proceso.                                                              |
#      +-----------+------------------------------------------------------------------------------------------+
#      | -a        | modo de archivo el cual permite copiar archivos de forma recursiva y conserva enlaces    |
#      |           | simbólicos, permisos de archivos, propiedad de usuarios y grupos y marcas de tiempo.     |
#      +-----------+------------------------------------------------------------------------------------------+
#      | -z        | esta opción comprime los datos del archivo.                                              |
#      +-----------+------------------------------------------------------------------------------------------+
#      | -h        | modo legible por humanos, números de salida en un formato legible por humanos .          |
#      +-----------+------------------------------------------------------------------------------------------+
#      | -q        | quiet suprime la salida del mensaje                                                      |
#      +-----------+------------------------------------------------------------------------------------------+
#      | -n        | realiza una ejecución de prueba sin sincronización                                       |
#      +-----------+------------------------------------------------------------------------------------------+
#      | -e        | –rsh = COMMAND menciona el shell remoto para usar en rsync                               |
#      +-----------+------------------------------------------------------------------------------------------+
#      | -u        | no copia los archivos del origen al destino si los archivos de destino son más recientes |
#      +-----------+------------------------------------------------------------------------------------------+

mount -t ext4 /dev/sda3 /mnt

#para  windows cygwin

mount -t ntfs D: /d
