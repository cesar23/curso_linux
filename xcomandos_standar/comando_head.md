
## Comandos basicos

ver la primera linea de un arhcivo
```shell
head -n 1 clientes.txt
# output:
#    1:cesar:auris

```

ver  varios  archivos
```shell
head -n 1 example*.conf
```

mostrar lineas desde la linea `1` al `5`
```shell
head -n5 paises.txt
# output:
#   1       AD      Andorra 20
#   2       AE      Emiratos Árabes Unidos  784
#   3       AF      Afganistán      4
#   4       AG      Antigua y Barbuda       28
#   5       AI      Anguila 660
```

mostrar las ultimas 3 linea y despues estas tres 
ultimas linear ordenarlas de forma inversa
```shell
head -n3 paises.txt | sort -r
# output:
#   3       AF      Afganistán      4
#   2       AE      Emiratos Árabes Unidos  784
#   1       AD      Andorra 20
```

obtener las ultimas 3 lineas de un arhcivo
```shell
tail -n 3 paises.txt
# output:
#   98      HU      Hungría 348
#   99      ID      Indonesia       360
#   100     IE      Irlanda 372
```
