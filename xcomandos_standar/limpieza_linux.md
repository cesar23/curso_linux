

## comandos para limpiar linux


```shell
sudo apt-get purge <paquete>

sudo apt-get autoclean
sudo apt-get clean
# este comando se encarga de eliminar todos los paquetes del cache. Pero recuerda que si quieres reinstalar un paquete concreto, vas a tener que volver a instalarlo. Es un comando fundamental en toda limpieza, lo vas a utilizar más de lo que crees (sobre todo si descargas e instalas muchos paquetes).

apt-get autoremove 
# eliminar carpetas y dependencias de todas las aplicaciones que instalas. Aunque elimines algunas apps, siempre quedan restos, por eso es importante que ejecutes este comando en la consola de vez en cuando.




```
