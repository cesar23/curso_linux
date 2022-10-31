# Comandos Mobax para consola
fuente: https://blog.mobatek.net/post/mobaxterm-command-lines/

### 1. Ejecutar mobax directamente un  comando
Puede ejecutar un script de shell directamente al inicio de MobaXterm. Solo tienes que lanzar MobaXterm con la siguiente línea de comando:
```shell
 MobaXterm_Personal_22.1.exe -exec ls
 # ejecutar y salir de mobax
 MobaXterm_Personal_22.1.exe -exec ls -exitwhendone
```

### 2. Ejecutar mobax directamente un  comando
```shell
# MobaXterm.exe <script_file>
MobaXterm_Personal_22.1.exe "D:\repos\curso_linux\xcomandos_standar\current_dir.sh"
MobaXterm_Personal_22.1.exe "D:\repos\curso_linux\xcomandos_standar\current_dir.sh"  -exitwhendone
```

### 3. Ejecutar mobax directamente un  comando
```shell
# MobaXterm.exe -newtab ["<Comando>"]
MobaXterm_Personal_22.1.exe  -newtab ls
```

### 4. Abrir carpeta
```shell
# abrir marcados
# MobaXterm.exe -openfolder "<Folder_name>"
MobaXterm_Personal_22.1.exe -openfolder "D:\repos\curso_linux"
MobaXterm_Personal_22.1.exe -openfolder "/drives/D/repos/curso_linux"
```

### 5. Variables de entorno Mobax
```shell
PUTTYHOME # C:\Users\cesar\mobax\home
VERSION # 22.1
MOBAEXTRACTONTHEFLY # 
MY_IP_ADDRESS # muestra la ip


# comprobar que estoy en al shell mobax
if [ -n "$PUTTYHOME" ]; then
  echo "Si existe variable"
else
  echo "No existe"
fi


```

### 4. Abrir sessiones o marcadores
```shell
# abrir marcados
# MobaXterm.exe -bookmark "<Bookmark_name>"
MobaXterm_Personal_22.1.exe -bookmark "Terminal-local"
```
