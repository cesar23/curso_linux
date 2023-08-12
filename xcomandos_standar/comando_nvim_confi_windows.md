
🎗️🎖️⛏️⚒️🛠️⚙️🏷️🗂️⏱️🛸⛱️❤️‼️✔️☢️☣️⚠️🗓️🧱🧬🪛🗝️🕹️🎗️✌️👁️ℹ️Ⓜ️☄️🌨️🌩️🌦️🌤️🏚️

fuente: 
- https://dev.to/ojoshuacg/configurando-neovim-3ng0



<a href="#" id="indice">Indice 👌</a>

## Tabla de contenido

- <a href="#instalar-vim">Instalar Nvim</a>
- <a href="#script_init"> config simple nvim</a>

---
# 1. Instalacion 
### 1.1 Instalacion Windows: <img width="30" src="https://cdn.worldvectorlogo.com/logos/microsoft-windows-22.svg" alt="My cool logo"/>
Aqui se  instalara par a windows
```shell
choco install neovim
```



# 2. Instalacion de vim plug
### 2.1 para Windows: <img width="30" src="https://cdn.worldvectorlogo.com/logos/microsoft-windows-22.svg" alt="My cool logo"/>    

Instalar Plugin
```shell
# :::::::::::::::::: (PowerShell como user) ::::::::::::::::::::

# :::::::::::::: 1. Creamos una carpeta para almacenar la configuracion y plugins y descargamos del repositorio de github
md ~\AppData\Local\nvim\autoload

# :::::::::::::: 2. Desccargamos el plug.vim
#$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#(New-Object Net.WebClient).DownloadFile(
#    $uri,
#    $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("~\AppData\Local\nvim\autoload\plug.vim")
#)
#

iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |` ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

# -------------------------------------------------------
# Para confirmar su instalacion, basta con ir a la ruta

# 3. Hacer que el enlace se rediriga a  ( AppData/Local/nvim/init.vim > ~/_vimrc )
#$init = @"
#set runtimepath^=~/.vim runtimepath+=~/.vim/after
#let &packpath=&runtimepath
#source ~/_vimrc 
#"@
#
#echo $init > "$env:userprofile/AppData/Local/nvim/init.vim"
#
## 4. este  sera el archivo de configuracion
#echo "" > "$env:userprofile/_vimrc"

``` 
Para confirmar su instalacion, basta con ir a la ruta :`%USERPROFILE%\AppData\Local\nvim-data\site\autoload`



# 3. Instalacion de Plugins

1. Primero vamos a dirigirnos a `%USERPROFILE%\AppData\Local`
2. creamos una carpeta llamada 📁 `nvim` 
3. dentro la carpeta otra llamada `plugged`




Dentro de nvim creamos un archivo llamado `init.vim` 
o descargamos el siguiente archivo.

<img src="https://i.imgur.com/UEKxYcz.png" >
-- --------------------------

### 3.1 editar el fichero `init.vim`

```
" --- Instalacion de Plugins --- "
call plug#begin('~/AppData/Local/nvim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/everforest'
Plug 'sainnhe/sonokai'

Plug 'sheerun/vim-polyglot'	  " Sintaxis
Plug 'scrooloose/nerdtree'		" Gestor de archivos en forma de arbol

Plug 'itchyny/lightline.vim'	" Barra de abajo

" Typing
Plug 'mattn/emmet-vim' 				          " emmet para diseño web
Plug 'jiangmiao/auto-pairs'				      " Autocompletado de llaves, corchetes, etc
Plug 'yggdroot/indentline'				      " Ver la identaciond de alguna condicion/funcion
Plug 'alvan/vim-closetag'				        " Cerrar tags (html, xml)
Plug 'tpope/vim-surround'				        " Encerrar entre ()[]{} palabras
Plug 'scrooloose/nerdcommenter'		      " Realizar comentarios
Plug 'christoomey/vim-tmux-navigator'	  " Poder navegar entre archivos abiertos

" Plug 'sirver/ultisnips'				                    " Snipets para codigo NO SIRVE
Plug 'neoclide/coc.nvim', {'branch': 'release'}	    " Autocompletado inteligente

"Plug 'tpope/vim-repeat'    " Dependencia para vim-surround

call plug#end()

set encoding=utf-8
set title  " Muestra el nombre del archivo en la ventana de la terminal
set number  " Muestra los números de las líneas
" set numberwidth=1
" set relativenumber    " Muestra el numero de linea donde te encuentras
set mouse=a  " Permite la integración del mouse (seleccionar texto, mover el cursor)
set cursorline  " Resalta la línea actual
set encoding=utf-8
syntax enable 				  " activa el coloreado de sintaxis en algunos tipos de archivos como html, c, c++
set sw=4 					      " la indentación genera 4 espacios
set nowrap					    " el texto en una linea no baja a la siguiente, solo continua en la misma hasta el infinito.
set clipboard=unnamed		" para poder utilizar el portapapeles del sistema operativo 'esto permite poder copiar y pegar desde cualquier parte a nvim y viceversa.
set showmatch   " Muestra el parentesis/corchete/llave de cierre
set showcmd

" " Indentación a 2 espacios
" set tabstop=2
" set shiftwidth=2
" set softtabstop=2
" set shiftround
" set expandtab  " Insertar espacios en lugar de <Tab>s

set ignorecase  " Ignorar mayúsculas al hacer una búsqueda
set smartcase  " No ignorar mayúsculas si la palabra a buscar contiene mayúsculas

set termguicolors 			"activa el true color en la terminal

set background=dark
colorscheme sonokai

let g:lightline = {'colorscheme': 'one'}

" colorscheme gruvbox
" let g:gruvbox_contrast_dark='hard'
" colorscheme onedark

" configuracion por defecto de coc
" TextEdit might fail if hidden is not set.
set hidden
```
### 3.1 instalar los plugins

Este archivo contendra la configuracion personalizada de cada usuario. 
Ahora vamos a abrir el archivo en la terminal con el comando:

```shell
cd ~\AppData\Local\nvim
nvim init.vim
```

<img src="https://i.imgur.com/lfEjfgE.png" >

-- --------------------------

<img src="https://i.imgur.com/QhlHrVD.png" >

-- --------------------------
 
escapanos y instalamos el plugins
comandos `<esc>:q` y Para instalar los plugins `:PlugInstall`


<img src="https://i.imgur.com/8s64Ikg.png" >

-- --------------------------

<img src="https://i.imgur.com/MyjGuz6.png" >

-- --------------------------

Final:

<img src="https://i.imgur.com/MwaqUDd.png" >
-- --------------------------




## Version sin plugins

```
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

set incsearch			"Mientras busca en un archivo, resalte de forma incremental los caracteres coincidentes a medida que escribe.

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

```
