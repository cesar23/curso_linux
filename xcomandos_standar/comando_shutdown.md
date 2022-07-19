 fuente : https://www.ionos.es/digitalguide/servidores/configuracion/comandos-shutdown-de-linux/

# Apagado correcto de linux shutdown
 

Sintaxis 
```shell
shutdown [opción] [tiempo] [mensaje]
```

## ✅ Apagado

Apagar en 10 min
```shell
shutdown -h 10
# mostrando mensaje
shutdown -h 10 "El equipo será apagado, por favor guarde su trabajo0"
```

Apagar automaticamente
```shell
shutdown -r 0
```

## ✅ Reinicio

Reinicia r en 20 min
```shell
shutdown -r 20
```