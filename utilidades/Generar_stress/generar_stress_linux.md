# instalaciond e  herramienta de  strees

```shell
	
sudo apt-get install stress
sudo apt-get install stress-ng
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

```shell
Los parámetros más comunes son:

-c o –cpu N : Crea un número dado de hilos de trabajo en sqrt()
-i o –io N : Crea un número dado de hilos de trabajo en sync()
-m o –vm N : Crear un número dado de hilos de trabajo en malloc/free() Memoria
-t 10s : Tiempo de espera
-v : Modo en detalle (verbose)


# stress -c 8 -i 4 -m 2 -t 20s
```

Se enviaron 2 procesos intensivos en cada CPU, 1 procesos de entrada y salida, y 1 procesos directos a la memoria RAM , cada uno de 128Mb , durante un tiempo de 10 segundos
```shell
stress -c 2 -i 1 -m 1 --vm-bytes 128M -t 10s
```


Se enviaron 8 procesos intensivos en cada CPU, 4 procesos de entrada y salida, y 6 procesos directos a la memoria RAM , cada uno de 256Mb , durante un tiempo de 20 segundos
```shell
stress -c 4 -i 4 -m 6 --vm-bytes 256M -t 20s --verbose 
 
```

Si solo queremos estresar la memoria, podemos ejecutar el comando de la siguiente manera:

```shell
stress -m 4 -t 20s
```


# usando stress-ng

Para imponer una carga del 100% en la CPU de un servidor Linux (por ejemplo), ejecuta stress o stress-ng, usando el indicador –cpu especifica el número de núcleos, -v habilita el modo detallado y –timeout especifica el tiempo después del cual el comando terminara:

```shell
stress-ng --cpu 4 -v --timeout 60s

stress-ng --cpu 4 --timeout 60s -v --metrics-brief
```

### Stresando MEMORIA
Presión de memoria e intercambio:
```shell
stress-ng --brk 0 --stack 0 --bigheap 0
```

##### Opciones de tamaño del estresor:
```shell
# para  la memoria
stress-ng --vm 1 --vm-bytes 2G
stress-ng --vm 1 --vm-bytes 50%
```

### Stresando Disco

```shell
# discos
stress-ng --hdd 1 --hdd-bytes 10%
stress-ng --malloc 1 --malloc-bytes 120%
stress-ng --shm –-shm-bytes 256M
```

```shell
stress-ng --disk 2 --timeout 60s --metrics-brief
```

Matrix usara 3 cpu de manera aletoria durante 1 minuto
```shell
stress-ng --matrix 3 -t 1m
```


fuemte: https://manpages.ubuntu.com/manpages/bionic/man1/stress-ng.1.html


ejecutar 8 factores estresantes de memoria virtual que combinados usan el 80% de la memoria disponible para 1
hora. Así, cada estresor utiliza el 10% de la memoria disponible.
```shell
stress-ng --vm 8 --vm-bytes 80% -t 1h
```

se ejecuta durante 60 segundos con 4 factores de estrés de CPU, 2 factores de estrés de io y 1 factor de estrés de vm usando
1 GB de memoria virtual.
```shell
 stress-ng --cpu 4 --io 2 --vm 1 --vm-bytes 1G --timeout 60s
```


ejecuta 2 instancias de factores de estrés de E/S combinados utilizando un total del 10% del
espacio disponible del sistema de archivos durante 10 minutos. Cada factor de estrés utilizará el 5% del
espacio disponible del sistema de archivos.
```shell
  stress-ng --iomix 2 --iomix-bytes 10% -t 10m
```


mide las latencias de programación en tiempo real creadas por el estresor hdd. Esto utiliza el
reloj de nanosegundos de alta resolución para medir latencias durante el sueño de 10.000
nanosegundos. Al final de 1 minuto de estrés,
se mostrará la distribución de latencia con intervalos de 2500 ns. NOTA: esto debe ejecutarse con privilegios de superusuario
para habilitar la programación en tiempo real para obtener mediciones precisas. 
```shell
   stress-ng  --cyclic  1  --cyclic-dist  2500  --cyclic-method  clock_ns  --cyclic-prio  100
       --cyclic-sleep 10000 --hdd 0 -t 1m
```


ejecuta los factores de estrés de la CPU en todas las CPU en línea trabajando con todos los
factores de estrés de la CPU disponibles durante 1 hora. 

```shell
 stress-ng --cpu 0 --cpu-method all -t 1h
```

ejecute 4 instancias de todos los factores estresantes durante 5 minutos. 
```shell
stress-ng --all 4 --timeout 5m
```

# Matando procesos  de Stress

```shell
# cuando se mando a  usar el stress  de  cpu
kill -9 pidof stress-ng-cpu

# cuando se mando a  usar el stress  de  memoria
kill -9 pidof stress-ng-mv
```
