## Para Shell Linux
```shell
#eliminar todo el contendido de una carpeta
rm -rf "/c/Users/Cesar/Downloads/*"
```

## Equibalencia en PowerShell
```powershell
rd -r "D:\Docker-Volumes\sqlServer19\mssql\data\*"
```


## eliminar archivos de una carpeta y solo dejar los 3 ultimos archivos

```shell
# ls -t => lista los rachivos ordenados por fecha de creacion DESC
rm `ls -t  | awk 'NR>5'`
# con esto  solo eliminara los  tar
#rm `ls -t *.tar.gz | awk 'NR>5'`
```
 De forma ASC

```shell
# ls -r => lista los rachivos ordenados por fecha de creacion ASC
rm `ls -r | awk 'NR>5'`
```