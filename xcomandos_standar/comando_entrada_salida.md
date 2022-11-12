

![](https://i.imgur.com/OWbQzhd.png) 


### 1. redirigir salida a fichero normal
Cuando n, el flujo de salida estándar 1 Por ejemplo, los dos comandos siguientes son iguales; ambos redirigirán el stdout ) al archivo.


```shell
command > salida.txt
command 1> salida.txt
```

### 2. redirigisr errores
Para redirigir el error estándar ( stderr ) use el operador 2>

```shell
command 2> error.txt
```

### 3. redirigir salida  y errore
Puede escribir stderr y stdout en dos archivos separados:
```shell
command 2> error.txt 1> output.txt
```


### 4. Redirigir stderr a stdout (salida y errorees en un solo fichero)
Al guardar la salida del programa en un archivo, es bastante común redirigir stderr a stdout para que pueda tener todo en un solo archivo.

* a. Para redirigir `stderr a stdout` 
    ```shell
    command > output.txt 2>&1
    ```

* b Para redirigir `stdout a stderr`
```shell
command 2>&1 > output.txt
```

* b Para redirigir `stderr a stdout`
```shell
command &>  output.txt
```

## Para Redirigir Salida y error en WINDOWS
```cmd
git pull origin master > a.txt 2>&1
```
