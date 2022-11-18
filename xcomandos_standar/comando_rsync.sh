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



rsync -zvh archivo destino
rsync -r '/cygdrive/d/expt64/' '/cygdrive/d/expt64_3'
rsync -vazh '/cygdrive/d/expt64/' '/cygdrive/d/expt64_3'

#---------------Exluyendo files
rsync -vazh --exclude='*.exe' '/cygdrive/d/expt64/' '/cygdrive/d/expt64_3'

#---------------Exluyendo Directorios o files
rsync -arv --exclude='.history' --exclude='.swt'  --exclude='1' '/cygdrive/d/expt64/' '/cygdrive/d/expt64_3'


#fuente :https://norfipc.com/comandos/como-usar-comando-robocopy-ejemplos.html
robocopy 'D:\expt64' 'D:\expt64_3' yearly-report.mov /s /e
ROBOCOPY %userprofile%\Documents D:\BACKUP\Documentos\ *.doc /S


#Crea un respaldo de Mis documentos pero solo copiando archivos mayores de 10 KB.
ROBOCOPY %userprofile%\Documents D:\BACKUP\Documentos\ /e /MAX:10000

#Crea un respaldo de Mis documentos pero solo copiando archivos creados o modificados en las últimas 24 horas (/MAXAGE:1)
ROBOCOPY %userprofile%\Documents D:\BACKUP\Documentos\ /S /MAXAGE:1


#La misma operación que con el código anterior, pero en este caso con un archivo batch que cada vez que se ejecuta crea una nueva carpeta con el formato dia-mes-año y permita conservar los respaldos anteriores.
#--POWERSHELL
$fecha=Get-Date -Format "yyyy-MM-dd_HH_mm_s"
ROBOCOPY  "D:\expt64" "D:\expt64_3\$fecha" /S


#Crea un respaldo completo de Mis documentos iniciándolo a las 11:50pm.
ROBOCOPY "D:\expt64" "D:\expt64_3" /E /RH:2258-2359



