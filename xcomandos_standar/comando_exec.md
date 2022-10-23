## Comando exec
El comando exec en Linux se usa para ejecutar un comando desde el propio bash. 
Este comando no crea un nuevo proceso, simplemente reemplaza 
el bash con el comando a ejecutar. Si el comando exec tiene éxito, no regresa al proceso de llamada.

>👁‍🗨**Nota**: el comando exec no crea un nuevo proceso. Cuando ejecutamos el comando exec desde la terminal, 
el proceso terminal en curso se reemplaza por el comando que se proporciona como argumento para el comando exec.
Opciones:
```shell
  -a name pasa NOMBRE como argumento cero a COMANDO
  -c ejecutar COMANDO con un entorno vacío
  -l coloco un guión en el argumento cero de COMMAND
  
  c: Se utiliza para ejecutar el comando con un entorno vacío.
un nombre: se utiliza para pasar un nombre como argumento cero del comando.
l: se utiliza para pasar el guión como argumento cero del comando.
```
Si el comando no se puede ejecutar, sale un shell no interactivo, a menos que
se establece la opción de shell `execfail'.
Estado de salida:

### tambien teber encuenta que  lo que pongas dentro  del conamdno `exec` no contendra las variables de entorno locales

### 1. ejemplo si ejecutamos esto saldra de la session actual ya que reemplazara la session actual

```shell

exec /sbin/ip a
```
