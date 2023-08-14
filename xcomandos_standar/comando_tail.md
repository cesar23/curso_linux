
## Comandos basicos

obtener las ultimas 3 lineas de un arhcivo
```shell
tail -n 3 paises.txt
# output:
#   98      HU      Hungría 348
#   99      ID      Indonesia       360
#   100     IE      Irlanda 372


```
buscar dentro de un ficheor y filtrar
```shell
tail -f log_access.log | grep GET
```


## En windows (PowerShell)

```powershell
Get-Content '.\colores.txt'
```

```powershell
PS C:\Scripts\Carpeta> Get-Content '.\Bienvenido a sobrebits.txt' -Tail 10
PS C:\Scripts\Carpeta> Get-Content '.\Bienvenido a sobrebits.txt' -TotalCount 10
```


