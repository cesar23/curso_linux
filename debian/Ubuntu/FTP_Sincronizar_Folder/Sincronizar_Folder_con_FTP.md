# Sincronizar Folder con FTP
fuente: https://costaricamakers.com/sincronizar-folder-con-ftp/

En muchos tipos de sistema requerimos mantener sincronizada una carpeta de un computador «local» con un computador remoto mediante el protocolo FTP. Por ejemplo si tienes un hospedaje de tipo Bluehost, podría interesarte mantener una carpeta de tu laptop en sincronía con tu servidor en blue host.

En este tutorial te explicamos como configurar una tarea programada en Windows 10 para usar la utilidad WINSCP y mantener una carpeta de tu laptop sincronizada con un servidor FTP.

Paso 1: Descargar el utilitario para Windows WINSCP (https://winscp.net/eng/download.php)

Paso 2: Crea una carpeta en el disco duro de tu laptop. Digamos c:\carpeta_sincronizada

Paso 3: Crea otra carpeta en el disco duro de tu laptop para contener los scripts que usaremos para la sincronía. Digamos c:\scripts_winscp


<img width="100%" src="https://i.imgur.com/VfLcCQ6.png" alt="My cool logo"/>

-- -- 

Paso 4: En la carpeta de scripts agregamos un script llamado «sync_winscp.txt» (en realidad se puede llamar como tú quieras) y agregamos el siguiente contenido:

```shell
#Official WINSCP Site: https://winscp.net/eng/docs/scripting

option batch abort
option confirm off
open ftp://tu_usuario:tu_CoNtRaSeñA@tu_servidor.remoto.com
synchronize remote c:\carpeta_sincronizada /
exit
```

En el anterior script, vemos que hacemos una conexión con tu servidor remoto (usa el nombre de servidor correspondiente!) usando tu usuario y contraseña FTP. Luego definimos un comando «synchronize» de tipo remoto de forma que los archivos se sincronizarán desde tu carpeta local hacia la carpeta remota. (tambien puede ser «local» o «both») y al final de dicho comando tenemos un / (slash) indicando la raíz de tu carpeta FTP remota.

Paso 5: Creamos un script .bat denominado «sync_winscp.bat» (también puedes llamrle como quieras) que ejecute el utilitario WinSCP con el siguiente contenido:

```shell
@echo off  
"C:\Program Files (x86)\WinSCP\winscp.com" /script=sync_winscp.txt
```

Este archivo .bat simplemente invoca el programa winscp.com (no confundir con winscp.exe) indicando que se ejecutará el script de Winscp denominado sync_winscp.txt que creamos en el paso 4.


<img width="100%" src="https://i.imgur.com/k47EaEJ.png  " alt="My cool logo"/>

-- -- 

Paso 6: Finalmente vamos al Programador de tareas de Windows (Windows Task Scheduler) y definimos una tarea que se ejecute de forma que invoque al archivo sync_winscp.bat cada minuto configurado de tal forma que no se requiera password para ser ejecutado con acceso irrestricto.

El siguiente conjunto de pantallas demuestra el proceso para crear la tarea programada.

Paso 7: Cada minuto la tarea programada ejecutará el programa WinScp.com con la especificación del script WinScp sincronizando la carpeta. También se puede usar el protocolo SFTP de forma que la transferencia de archivos sea más segura. El siguiente video muestra esta configuración usando SFTP.


<img width="100%" src="https://i.imgur.com/FKx9pNg.png" alt="My cool logo"/>

-- -- 

