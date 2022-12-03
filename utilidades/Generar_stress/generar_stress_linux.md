# instalaciond e  herramienta de  strees

```shell
	
sudo apt-get install stress
sudo apt-get install stress
```

## ver nuestra  ram
```shell
Memoria RAM:
free -m
# output:
#               total        used        free      shared  buff/cache   available
# Mem:           3901         770        2298           5         831        2884
# Swap:          3906           0        3906

```
## Modelo y Velocidad del CPU

```shell
cat /proc/cpuinfo | grep "model name"
# output:

# model name      : Intel(R) Core(TM) i7-9700K CPU @ 3.60GHz
# model name      : Intel(R) Core(TM) i7-9700K CPU @ 3.60GHz
# model name      : Intel(R) Core(TM) i7-9700K CPU @ 3.60GHz
# model name      : Intel(R) Core(TM) i7-9700K CPU @ 3.60GHz

```
#### numero de procesadores:
```shell
grep processor /proc/cpuinfo | wc -l
# output:
# 4
```


## Ejecutando Pruebas
Se enviaron 8 procesos intensivos en cada CPU, 4 procesos de entrada y salida, y 6 procesos directos a la memoria RAM , cada uno de 256Mb , durante un tiempo de 20 segundos
```shell
stress -c 4 -i 4 -m 6 --vm-bytes 256M -t 20s --verbose 
 
```

Si solo queremos estresar la memoria, podemos ejecutar el comando de la siguiente manera:


```shell
stress -m 4 -t 20s
```
