# ver archivos abiertos y servicios


ver archivos abiertos por un usuario
```shell
# ver los archivos que tiene abierto apache
lsof | grep apache
```

ver qeu puertos de red TCP y UDP tenemos abiertos
```shell
lsof -i
lsof -i | grep UDP
lsof -i | grep TCP
```