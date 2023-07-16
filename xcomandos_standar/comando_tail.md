
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

