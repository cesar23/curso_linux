#### También podemos contar lineas dentro de ficheros
```shell
cat ficheros.txt | wc -l

```
#### Tambien podemos contar caracteres dentro de un fichero
```shell
cat ficheros.txt | wc -m

```

#### Crear un archivo con el comando cat
```shell
cat > filename.txt
```

#### Para evitar desplazarse por archivos muy grandes, puedes agregar la opción | more ver la pantalla de menos o más:
```shell
cat filename.txt | less

cat source.txt > destination.txt
```



#### concatenar fichero
```shell
cat source1.txt source2.txt > destination.txt
```

#### numeracion
```shell
cat -n filename.txt
```

## En windows (PowerShell)

```powershell
Get-Content '.\colores.txt'
```

```powershell
PS C:\Scripts\Carpeta> Get-Content '.\Bienvenido a sobrebits.txt' -Tail 10
PS C:\Scripts\Carpeta> Get-Content '.\Bienvenido a sobrebits.txt' -TotalCount 10
```
