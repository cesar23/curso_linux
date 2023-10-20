fuente: 
- como instalar en Linux: https://www.youtube.com/watch?v=u6IX8TlVEZ8
- https://www.youtube.com/watch?v=jBVEuRbHwdU


repositorio: https://github.com/phiresky/ripgrep-all


## 1. instalacion linux

descargar : https://github.com/phiresky/ripgrep-all/releases



<img src="https://i.imgur.com/CxFbq9B.png" >

-- --------------------------

luego descargados los binarios `rga` y `rga-pre-proc`

los pegaremos enal ruta `/usr/local/bin` con atributos de ejecucion

```shell
chmod +x /usr/local/bin/rga
chmod +x /usr/local/bin/rga-pre-proc
```

Ahora instalacmos los paquetes que necesita
```shell
apt install ripgrep pandoc poppler-utils ffmpeg
```

y  ya  podemso  usarlo

## instalacion en Windows 
```shell
choco install ripgrep-all
```

<img src="https://i.imgur.com/Raw6ulz.png" >
-- --------------------------

### programas 
```shell
# para  abirir PDF
choco install xpdf-utils
```

# 3. comandos
👀 ojo si no le pasas un `path` donde buscar. buscara en la ubicacion donde se ejecuta el comando

```shell
# buscar en un arhcivo
rg "user_nicename" /D/repos/wordpress_docker/my_resource/backup_db/backup_wp.sql
```
<img src="https://i.imgur.com/3F0kdCW.png" >

-- --------------------------

## Excluir y agregar carpetas

1. Aqui excluimos las carpetas `utils` `sequelize*` y solo buscamos los archivos `*.js`
```shell
rg "fecha" /D/repos/curso_nodejs_mongo -g '*.js'  -g '!{utils,sequelize*}'
```
2. aqui extendmos las consultas extensiones `*.js  y *.json`
```shell
rg "fecha" /D/repos/curso_nodejs_mongo -g '{*.js,*.json}'  -g '!{utils,sequelize*}'
```

```shell
rg "wget" /D/repos -g '*.sh'  -g '!{utils,node_modules*}'
```


```shell



rg "cadena_de_texto" /ruta/al/directorio/

rg "cadena_de_texto" /ruta/al/directorio/ -r

# Que no difeencie  de mayusculas y minusculas (en el directorio actual)
rg -i 'red hat empresa linux'

# busqueda con expresion regular
rg "pe[a-z]u" 
rg 'peru*.com'
```
Buscar una cadena de texto en varios archivos, ignorando archivos o directorios específicos:
```shell
rg "localhost:5000" . --exclude-dir="node_modules" --exclude=archivo.txt
```
### Ejemplo 1
buscar ficheros en un directorio

```shell
rg --no-filename --color "error" /D/repos/curso_nodejs_mongo -r -g '!venv/*' -G '*.py'
```
Aquí te explico las opciones utilizadas,

- `--no-filename:` hace que ripgrep no muestre el nombre de archivo en la salida, lo que facilita la lectura.
- `--color:` resalta la cadena de búsqueda en la salida para que sea más fácil de ver.
- `/ruta/al/directorio/`: el directorio donde se va a realizar la búsqueda.
- `-r`: buscar de manera recursiva en subdirectorios.
- `-g` '!venv/*': ignorar archivos en el directorio venv.
- `-G` '*.py': buscar solo en archivos con extensión .py.

### Ejemplo 2
buscar ficheros en un directorio

```shell
rg --no-filename --color "foo.*error" /D/repos/curso_nodejs_mongo -r -g '!node_modules/*' -G '*.js' -C 2 -o --context-separator="" > output.txt
```
Aquí te explico las opciones utilizadas,

- `--no-filename`: hace que ripgrep no muestre el nombre de archivo en la salida, lo que facilita la lectura.
- `--color`: resalta la cadena de búsqueda en la salida para que sea más fácil de ver.
- `/ruta/al/directorio/`: el directorio donde se va a realizar la búsqueda.
- `-r`: buscar de manera recursiva en subdirectorios.
- `-g` '!node_modules/*': ignorar archivos en el directorio node_modules.
- `-G` '*.js': buscar solo en archivos con extensión .js.
- `-C 2`: mostrar 2 líneas de contexto antes y después de cada coincidencia de búsqueda.
- `-o`: solo mostrar las líneas que coinciden con la búsqueda.
- `--context-separator=""`: no mostrar la línea de separación entre cada coincidencia de búsqueda.
- `> output.txt`: redirigir la salida de ripgrep a un archivo llamado output.txt.


## -----mis jemplos



```shell
rg "localhost:5000" /D/repos -g '{*.js,*.json}'  -g '!{node_modules,babel-webpack,plugins}'
  
rg "tinymce.init" /D/repos -g '{*.js,*.json,*.html}'  -g '!{node_modules,babel-webpack,plugins}'

rg "tinymce.init" /D/repos -g '{*.js,*.json,*.html}'  -g '!{node_modules,babel-webpack,plugins}'


```
- `localhost:5000` : busco la palabra
- `/D/repos` : en el directorio
- `-g '{*.js,*.json}'` : que extensiones de ficheros cogere para buscar
- `-g '!{node_modules,babel-webpack,plugins,file.js}'` : que rutas path ficheros excluire


### Otras opciones
```shell
rg "tinymce.init" /D/repos -g '{*.js,*.json,*.html}'  -g '!{node_modules,babel-webpack,plugins}' -C 2

```

- `-C 2`: mostrar 2 líneas de contexto antes y después de cada coincidencia de búsqueda.

<img src="https://i.imgur.com/uqjF34u.png" >
-- --------------------------


```shell
rg "tinymce.init" /D/repos -g '{*.js,*.json,*.html}'  -g '!{node_modules,babel-webpack,plugins}' -o

```
- `-o`: solo mostrar las líneas que coinciden con la búsqueda.


<img src="https://i.imgur.com/9gHflKG.png" >

-- --------------------------
