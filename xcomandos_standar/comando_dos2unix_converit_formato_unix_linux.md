# Convertir formato de fichero en unix


# 🔴 Error comun
```shell
syntax error near unexpected token `$'{\r''
```
<img src="https://i.imgur.com/F2A8tke.png" alt="My cool logo"/>

-- --





# 1. Opcion con progrma desde Linux

instalar packete
```shell
sudo apt install dos2unix
```


## Buscar ficheros con formato y salto de linea Windows
- CRLF -> de Windows
- LF   -> de Linux

```shell
# busca todos con formato Windows
find ${HOME}/libs_shell -type f -exec grep -Iq . {} \; -and -exec grep -Il $'\r' {} +
```

Usando el paquete confvertitr a formato linux
```shell
find ${HOME}/libs_shell -name "*.*" -exec dos2unix {} +
```




# Convertir  metodo 2 `unix`

converit un solo fichero
```shell
 dos2unix myfile.txt
```

con salida
```shell
 dos2unix -n input.txt output.txt
```


Por lotes
```shell
dos2unix $HOME/libs_shell/linux/*

# output:

#    cesar@serv-docker:~$ dos2unix $HOME/libs_shell/linux/*
#    dos2unix: converting file /home/cesar/libs_shell/linux/colors_2.sh to Unix format...
#    dos2unix: converting file /home/cesar/libs_shell/linux/colors.sh to Unix format...
#    dos2unix: converting file /home/cesar/libs_shell/linux/conf_alias_docker.sh to Unix format...
#    dos2unix: converting file /home/cesar/libs_shell/linux/conf_alias_level_1.sh to Unix format...
#    dos2unix: converting file /home/cesar/libs_shell/linux/conf_extras.sh to Unix format...
#    dos2unix: converting file /home/cesar/libs_shell/linux/conf_funciones_files.sh to Unix format...
#    dos2unix: converting file /home/cesar/libs_shell/linux/conf_funciones_ides.sh to Unix format...
#    dos2unix: converting file /home/cesar/libs_shell/linux/conf_funciones_level_1.sh to Unix format...
#    dos2unix: converting file /home/cesar/libs_shell/linux/conf_funciones_level_2.sh to Unix format...
#    dos2unix: converting file /home/cesar/libs_shell/linux/conf_funciones_proxmox.sh to Unix format...
#    dos2unix: converting file /home/cesar/libs_shell/linux/conf_menu.sh to Unix format...
#    dos2unix: converting file /home/cesar/libs_shell/linux/conf_neofetch.sh to Unix format...
#    dos2unix: converting file /home/cesar/libs_shell/linux/funGit.sh to Unix format...
#    dos2unix: converting file /home/cesar/libs_shell/linux/git-prompt.sh to Unix format...
#    dos2unix: converting file /home/cesar/libs_shell/linux/mobax.sh to Unix format...
#    dos2unix: Binary symbol 0x1B found at line 3586
#    dos2unix: Skipping binary file /home/cesar/libs_shell/linux/neofeth.sh
#    dos2unix: converting file /home/cesar/libs_shell/linux/no_sirve.txt to Unix format...
#    dos2unix: converting file /home/cesar/libs_shell/linux/server_python.py to Unix format...
#    dos2unix: converting file /home/cesar/libs_shell/linux/util.py to Unix format...
#    cesar@serv-docker:~$

```


# 2. Opcion Con windows desde notepad

desde Windows  abrir notepad++ y abajo en la barra de estado  buscar el formato
de salto de linea

<img src="https://i.imgur.com/ThW3oFy.png" alt="My cool logo"/>

-- --

# 3. ✅ opcion con comando SED (Mejor que utilize)

```shell
find ${HOME}/libs_shell -type f -exec sed -i 's/\r//g' {} +
```
