
🎗️🎖️⛏️⚒️🛠️⚙️🏷️🗂️⏱️🛸⛱️❤️‼️✔️☢️☣️⚠️🗓️🧱🧬🪛🗝️🕹️🎗️✌️👁️ℹ️Ⓜ️☄️🌨️🌩️🌦️🌤️🏚️

fuente: 
- https://codingpotions.com/vim-configuracion
- https://www.youtube.com/watch?v=2dG_Nl_r6s0&t=407s



## configuracion de .vimrc


<a href="#" id="indice">Indice 👌</a>

## Tabla de contenido

- <a href="#instalar-vim">xxxxxxxx</a>
- <a href="#script_init"> config simple nvim</a>

---
## para Windows: <img width="30" src="https://cdn.worldvectorlogo.com/logos/microsoft-windows-22.svg" alt="My cool logo"/>    

Instalar Plugin
```shell
# :::::::::::::::::: (PowerShell como user) ::::::::::::::::::::

# 1. Creamos una carpeta para almacenar la configuracion y plugins y descargamos del repositorio de github
md ~\AppData\Local\nvim\autoload

# 2. Desccargamos el plug.vim
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
    $uri,
    $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("~\AppData\Local\nvim\autoload\plug.vim")
)


# -------------------------------------------------------


# 3. Hacer que el enlace se rediriga a  ( AppData/Local/nvim/init.vim > ~/_vimrc )
$init = @"
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/_vimrc 
"@

echo $init > "$env:userprofile/AppData/Local/nvim/init.vim"

# 4. este  sera el archivo de configuracion
echo "" > "$env:userprofile/_vimrc"

``` 


- **VIM** config      :`~/_vimrc`

- **NEOVIM** config   :`%userprofile%\AppData\Local\nvim\init.vim`
- **NEOVIM** config   :`"$HOME/AppData/Local/nvim/init.vim"`
- **NEOVIM** plugin   :`%userprofile%\AppData\Local\nvim-data\site\autoload\plug.vim`

Confirmar que el archivo `init.vim` tenga lo siguiente en : `~/_vimrc`
```shell
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/_vimrc 

```


---
## Para Linux: <img width="30" src="https://seeklogo.com/images/L/Linux_Tux-logo-DA252F3C21-seeklogo.com.png" alt="My cool logo"/>



Descargar el `plug.vim` desde:
![](https://i.imgur.com/kvxMP5S.png) 


En este caso solo usaremos Nvim


##### Instalar Git Necesario
```shell
# instalar Git ️
sudo apt install git curl -y

```

Ahora continuemos con la configuracion 🏅
```shell
# para la configuracion
mkdir ~/.config/nvim && touch ~/.config/nvim/init.vim

# configuracion plugin
mkdir -p ~/.vim/plugged
# Crear carpeta
mkdir -p ~/.config/nvim/autoload 
# descargar desde el repositorio de github y guardarlo el archivo de condiguracion
#curl -A 'Mozilla/3.0 (Win95; I)' -L -o "${HOME}/.config/nvim/autoload/plug.vim"  "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
curl -A 'Mozilla/3.0 (Win95; I)' -L -o "~/.config/nvim/autoload/plug.vim"  "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

```
#### Ahora editar el archivo de configuracion
```shell

#Editar configuracion
nano ~/.config/nvim/init.vim
```
o ejecutar el siguiente comando para la configuracion

<a href="#script_init"> script confgi nvim:</a> `~/.config/nvim/init.vim` 



## (Opcional) Instalar Plugins forma Manual

https://github.com/junegunn/vim-plug


para vim
```shell
# desde powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
```

para neovim
```shell
# powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

## Para agregar Autocompletado
fuente : https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md


## Atajos de teclas
fuente: https://dev.to/mr_destructive/vim-keymapping-guide-3olb

**sintaxis:**

_{ n | v | i | s | x | c | o }_ map
- `n` para normal
- `v` para visual y seleccion
- `i` para insertar
- `s` para seleccion
- `x` para visual
- `c` para linea comandos
- `x` para pendiente de operador

Puede mostrar una lista de mapas de 
teclas existentes utilizando los siguientes comandos sin ningún argumento:

```shell
# Mostrar atajos Modo: normal, visual y de selección y operador pendiente
:mapa 

# Mostrar atajos Modo: inserción y línea de comandos.
:mapa!
```

## MODO: NORMAL
```shell
# atajos de teclas

# ::: <Ctrl+s> => :w <Enter>
nnoremap <C-s> :w<CR>

# ---------- Asignar 
nnoremap py :!python %<CR>                          " Python run keymap
nnoremap cpp :!c++ % -o %:r && ./%:r <CR>           " C++ compile and run keymap
nnoremap sh :!chmod +x % && source %<CR>            " Bash sourcing keymap 
nnoremap c :!clang % -o %:r && ./%:r <CR>           " C compile and run keymap 
nnoremap jv :!javac % && java %:r <CR>              " Java compile and run keymap

```

## MODO: INSERCCION
```shell
let mapleader =" "
# MODO Insert: <F2> para insertar el nombre del directorio del búfer actual
inoremap <F2> <C-R>=expand('%:p:h')<CR>


# para  guardar arhcivos
nmap <leader>so :source $HOME\_vimrc<CR>
nmap <leader>w :w<CR>
```

## UTILIDADES
```shell
# Panel Navegador de Archivos (LEX)
nnoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>   " minim
inoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>



```



# Ultimo config `_vimrc`

```shell
" TABLE OF CONTENTS:

" 1. Generic settings
" 2. File settings
" 3. UI
" 4. Maps and functions


"-----------------------------------------
" 1. GENERIC SETTINGS
"-----------------------------------------

set nocompatible " disable vi compatibility mode
set history=1000 " increase history size

"-----------------------------------------
" 2. FILE SETTINGS
"-----------------------------------------

" :::::: Stop creating backup files, please use Git for backups
set nobackup
set nowritebackup
set noswapfile
set backspace=indent,eol,start

" :::::: Modify indenting settings
set autoindent " autoindent always ON.
set expandtab " expand tabs
set shiftwidth=2 " spaces for autoindenting
set softtabstop=2 " remove a full pseudo-TAB when i press <BS>

" :::::: Modificar algunas otras configuraciones sobre archivos

set hidden
set ignorecase
set scrolloff=8 " Keep at least 8 lines below cursor
set foldmethod=manual " To avoid performance issues, I never fold anything so...

"-----------------------------------------
" 3. UI
"-----------------------------------------

set fillchars+=vert:\ " Retire las tuberías desagradables de las divisiones verticales.

" - Sauce on this: http://stackoverflow.com/a/9001540

set wildmenu " enable visual wildmenu


set nohlsearch
set lazyredraw
set ttyfast
set hidden


set showcmd				" mostrar los comandos que se ejecuta en barra (show the comand that are executed in bar)
set number 				" mostrar numero de lineas (show line numbers)
syntax enable       	" sintaxis de codigo resaltado de color (color highligth code syntax)
set clipboard=unnamedplus   " habilitar copiar al movernos con el mouse (enable copy on mouse move)
set mouse=a     		" poder mover el mouse y arrastrar selecionar (begin able to move the mouse and drag select)

set relativenumber   	" mostrar numeracion arriba y abajo (show top and botton numbering)
set laststatus=2        " mostrar barrita status  de abajo en vim  (show bar status botton)
" set noshowmode        " No mostrar barrita de status insert o visual (show bar status insert or visual)

set showmatch 			" resaltar paréntesis y corchetes coincidentes (highligth matching parentheses and brackets)

set hidden              " para ocultar la advertencia al abrir archivos (to hide warning when opening files)
" set scrolloff=8         " Mantenga al menos 8 líneas debajo del cursor
set encoding=UTF-8 		" codificacion de archivos siempre al guardar (file encoding always on save)
set shiftwidth=2    	" Tab por espacios, indentado de 2 espacios (2 space indent)
" :::::::::::: IU
let &t_ut=''  			"VIM: Para representar adecuadamente el fondo de la combinación de colores 
set ruler 				" habilitar en barra linea y posicion (enable in bar line and position)


"-----------------------------------------
" 4. PLUGINS
"-----------------------------------------
let mapleader =" "

if has('nvim')
	
	" :::: Puede especificar un directorio de complemento personalizado pasándolo como argumento
	call plug#begin('~/.vim/plugged') " donde se guardaran los plugins


	" Temas

	" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
	Plug 'morhetz/gruvbox'


	" IDE
	Plug 'easymotion/vim-easymotion'

    " ---- para el explorador
    Plug 'preservim/nerdtree'
        
    " --- plugin para iconos del explorador
    Plug 'ryanoasis/vim-devicons'
	set guifont=DroidSansMono_Nerd_Font:h11



	call plug#end()

	colorscheme gruvbox
	let g:gruvbox_contrast_dark = "hard"


	nmap <Leader>s <Plug>(easymotion-s2)
else


	set background=dark

end

	




" para  guardar arhcivos
nmap <leader>so :source $HOME\_vimrc<CR>
nmap <leader>w :w <CR>
nmap <leader>x :x <CR>
nmap <leader>q :q <CR>
"# Panel Navegador de Archivos (LEX)
nnoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>   " minim
inoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>
" ------------------------------------------------
" Configuracion de NERDTREE navegador de archivos
let NERDTreeQuitOnOpen=1 " para que se cierre al abrir un fichero

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>










```


# Ultimo config sin plugins
```shell
" TABLE OF CONTENTS:

" 1. Generic settings
" 2. File settings
" 3. UI
" 4. Maps and functions


"-----------------------------------------
" 1. GENERIC SETTINGS
"-----------------------------------------

set nocompatible " disable vi compatibility mode
set history=1000 " increase history size

"-----------------------------------------
" 2. FILE SETTINGS
"-----------------------------------------

" :::::: Stop creating backup files, please use Git for backups
set nobackup
set nowritebackup
set noswapfile
set backspace=indent,eol,start

" :::::: Modify indenting settings
set autoindent " autoindent always ON.
set expandtab " expand tabs
set shiftwidth=2 " spaces for autoindenting
set softtabstop=2 " remove a full pseudo-TAB when i press <BS>

" :::::: Modificar algunas otras configuraciones sobre archivos

set hidden
set ignorecase
set scrolloff=8 " Keep at least 8 lines below cursor
set foldmethod=manual " To avoid performance issues, I never fold anything so...

"-----------------------------------------
" 3. UI
"-----------------------------------------

set fillchars+=vert:\ " Retire las tuberías desagradables de las divisiones verticales.

" - Sauce on this: http://stackoverflow.com/a/9001540

set wildmenu " enable visual wildmenu


set nohlsearch
set lazyredraw
set ttyfast
set hidden


set showcmd				" mostrar los comandos que se ejecuta en barra (show the comand that are executed in bar)
set number 				" mostrar numero de lineas (show line numbers)
syntax enable       	" sintaxis de codigo resaltado de color (color highligth code syntax)
set clipboard=unnamedplus   " habilitar copiar al movernos con el mouse (enable copy on mouse move)
set mouse=a     		" poder mover el mouse y arrastrar selecionar (begin able to move the mouse and drag select)

set relativenumber   	" mostrar numeracion arriba y abajo (show top and botton numbering)
set laststatus=2        " mostrar barrita status  de abajo en vim  (show bar status botton)
" set noshowmode        " No mostrar barrita de status insert o visual (show bar status insert or visual)

set showmatch 			" resaltar paréntesis y corchetes coincidentes (highligth matching parentheses and brackets)

set hidden              " para ocultar la advertencia al abrir archivos (to hide warning when opening files)
" set scrolloff=8         " Mantenga al menos 8 líneas debajo del cursor
set encoding=UTF-8 		" codificacion de archivos siempre al guardar (file encoding always on save)
set shiftwidth=2    	" Tab por espacios, indentado de 2 espacios (2 space indent)
" :::::::::::: IU
let &t_ut=''  			"VIM: Para representar adecuadamente el fondo de la combinación de colores 
set ruler 				" habilitar en barra linea y posicion (enable in bar line and position)


"-----------------------------------------
" 4. PLUGINS
"-----------------------------------------
let mapleader =" "

if has('nvim')
    set background=dark
else


	set background=dark

end

	




" para  guardar arhcivos
nmap <leader>so :source $HOME\_vimrc<CR>
nmap <leader>w :w <CR>
nmap <leader>x :x <CR>
nmap <leader>q :q <CR>
"# Panel Navegador de Archivos (LEX) uso: Ctrl+b
nnoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>   " minim
inoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>
" ------------------------------------------------


```



---
[//]: # (------------------)
<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>
<h2  id="script_init">Agregar conf `sin plugins` desde consola</h2>

```shell
 cat > ~/.config/nvim/init.vim <<EOF
" TABLE OF CONTENTS:
" -----------confg sin plugins

" 1. Generic settings
" 2. File settings
" 3. UI
" 4. Maps and functions


"-----------------------------------------
" 1. GENERIC SETTINGS
"-----------------------------------------

set nocompatible " disable vi compatibility mode
set history=1000 " increase history size

"-----------------------------------------
" 2. FILE SETTINGS
"-----------------------------------------

" :::::: Stop creating backup files, please use Git for backups
set nobackup
set nowritebackup
set noswapfile
set backspace=indent,eol,start

" :::::: Modify indenting settings
set autoindent " autoindent always ON.
set expandtab " expand tabs
set shiftwidth=2 " spaces for autoindenting
set softtabstop=2 " remove a full pseudo-TAB when i press <BS>

" :::::: Modificar algunas otras configuraciones sobre archivos

set hidden
set ignorecase
set scrolloff=8 " Keep at least 8 lines below cursor
set foldmethod=manual " To avoid performance issues, I never fold anything so...

"-----------------------------------------
" 3. UI
"-----------------------------------------

set fillchars+=vert:\ " Retire las tuberías desagradables de las divisiones verticales.

" - Sauce on this: http://stackoverflow.com/a/9001540

set wildmenu " enable visual wildmenu


set nohlsearch
set lazyredraw
set ttyfast
set hidden


set showcmd				" mostrar los comandos que se ejecuta en barra (show the comand that are executed in bar)
set number 				" mostrar numero de lineas (show line numbers)
syntax enable       	" sintaxis de codigo resaltado de color (color highligth code syntax)
set clipboard=unnamedplus   " habilitar copiar al movernos con el mouse (enable copy on mouse move)
set mouse=a     		" poder mover el mouse y arrastrar selecionar (begin able to move the mouse and drag select)

set relativenumber   	" mostrar numeracion arriba y abajo (show top and botton numbering)
set laststatus=2        " mostrar barrita status  de abajo en vim  (show bar status botton)
" set noshowmode        " No mostrar barrita de status insert o visual (show bar status insert or visual)

set showmatch 			" resaltar paréntesis y corchetes coincidentes (highligth matching parentheses and brackets)

set hidden              " para ocultar la advertencia al abrir archivos (to hide warning when opening files)
" set scrolloff=8         " Mantenga al menos 8 líneas debajo del cursor
set encoding=UTF-8 		" codificacion de archivos siempre al guardar (file encoding always on save)
set shiftwidth=2    	" Tab por espacios, indentado de 2 espacios (2 space indent)
" :::::::::::: IU
let &t_ut=''  			"VIM: Para representar adecuadamente el fondo de la combinación de colores
set ruler 				" habilitar en barra linea y posicion (enable in bar line and position)


"-----------------------------------------
" 4. PLUGINS
"-----------------------------------------
let mapleader =" "

if has('nvim')
    set background=dark
else
	set background=dark

end


" para  guardar arhcivos
nmap <leader>so :source $HOME\_vimrc<CR>
nmap <leader>w :w <CR>
nmap <leader>x :x <CR>
nmap <leader>q :q <CR>
"# Panel Navegador de Archivos (LEX) uso: Ctrl+b
nnoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>   " minim
inoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>
" ------------------------------------------------
EOF

```



## Agregar fuentes para ponerle icono a archivos

fuente: https://www.nerdfonts.com/

```shell
# :::::::::::::::::::::::::::::::: Shell CMDER :::::::::::::::::::::

#mkdir -p "${HOME}/Downloads"
# Linux or Windows
DIR_DOWNLOAD="${HOME}/Downloads"


# -------------------------------------------------

# 1. Descargar fuentes (el zip es de mi repo github)
curl -A 'Mozilla/3.0 (Win95; I)' -L -o "${DIR_DOWNLOAD}/fonts_droid.zip"  "https://github.com/cesar23/utils_dev/raw/master/vim/fonts/fonts_droid.zip"

# 2. crear directorio descarga
mkdir "${DIR_DOWNLOAD}/fonts_droid"

# 3. Descomprimir fuentes 
unzip "${DIR_DOWNLOAD}/fonts_droid.zip" -d "${DIR_DOWNLOAD}/fonts_droid" 

# ::::::: OJO Aqui pueda que  nbecesitamos instalar las fuentes manualmente 
$DIR_DOWNLOAD="$env:userprofile/Downloads"

# 1. Descargar fuentes (el zip es de mi repo github)
(New-Object Net.WebClient).DownloadFile(
    "https://github.com/cesar23/utils_dev/raw/master/vim/fonts/fonts_droid.zip",
    $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("${DIR_DOWNLOAD}/fonts_droid.zip")
)
# 2. crear directorio descarga
mkdir "${DIR_DOWNLOAD}/fonts_droid"

# 3. Descomprimir fuentes 
Expand-Archive -Path "${DIR_DOWNLOAD}/fonts_droid.zip" -DestinationPath "${DIR_DOWNLOAD}/fonts_droid"


Copy-Item -Path "${DIR_DOWNLOAD}/fonts_droid/*" -Destination "C:\Windows\Fonts" -Recurse



# 4. ahora pasamos solo las fuentes ttf a nuestras fuentes
# ::::::: para Windows
find "${DIR_DOWNLOAD}/fonts_droid/"  -maxdepth 1 -iregex '.*\.ttf.*'  -exec cp {} "/c/Windows/Fonts/" \;
# ::::::: para Linux
sudo find "${DIR_DOWNLOAD}/fonts_droid/"  -maxdepth 1 -iregex '.*\.ttf.*'  -exec cp {} "/usr/share/fonts/truetype/" \;

```

Ahora agregar el plugin a nuestra configuracion de neovim `init.vim`
```shell
Plug 'ryanoasis/vim-devicons'
```

Luego de eso reiniciar y si es de windows hay que modificar en windows

descargar y instalar las fuentes del link:

- https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DroidSansMono/complete


![](https://i.imgur.com/UAi1hoT.png) 


## Atajo de `nvim` a `nv` para  agilizar

- En windows copiar `C:\tools\neovim\nvim-win64\bin\nvim.exe` a `C:\tools\neovim\nvim-win64\bin\nv.exe`
- En linux copiar `sudo cp /usr/bin/nvim /usr//bin/nv`


## configurar `nvim` a root
```shell
sudo mv /root/.config/nvim /root/.config/nvim.bkp; sudo ln -s $HOME/.config/nvim /root/.config/
```

## Cambiar syntaxis de lenguaje
```shell
# configurar la sisntaxis
: set syntax=bash
```
<img width="80%" src="https://i.imgur.com/sDPmiQO.png" alt="My cool logo"/>
