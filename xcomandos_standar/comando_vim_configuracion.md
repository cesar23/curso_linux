fuente: https://codingpotions.com/vim-configuracion

## configuracion de .vimrc



##### para windows:
- **VIM** config      :`~/_vimrc`
- **NEOVIM** config   :`%userprofile%\AppData\Local\nvim\init.vim`
- **NEOVIM** plugin   :`%userprofile%\AppData\Local\nvim-data\site\autoload\plug.vim`

##### para linux:
- ubicado en `~/.vimrc` en neovim `~/.config/nvim/init.vim`



```textmate
" TABLE OF CONTENTS:

" 1. Generic settings
" 2. File settings
" 3. UI
" 4. Maps and functions

"-----------------------------------------
" 1. GENERIC SETTINGS
"-----------------------------------------

set nocompatible           " Anular compatibilidad con Vi, el editor antiguo
set history=1000           " cosas que guarda Vim. en neovim no es necesario
    
    
let &t_ut=''               " terminal dibuje mejor el color de fondo

"-----------------------------------------
" 2. FILE SETTINGS
"-----------------------------------------
" Para desactivar los ficheros swap . en neovim no es  necesario
set nobackup
set nowritebackup
set noswapfile

" usar el backspace del teclado en modo insert en cualquier sitio        
set backspace=indent,eol,start

"El autoident sirve a la hora de crear nuevas líenas en el fichero,
"que dependiendo de donde la crees te meta indentado de forma automática.
set autoindent " autoindent always ON.

" Con expandtab lo que hago es transformar los tabs del identado en espacios
set expandtab " expand tabs
set shiftwidth=2 " espacios de identacion
set softtabstop=2 " remove a full pseudo-TAB when i press <BS>

" Modify some other settings about files . solo en neovim
set encoding=utf-8 " siempre guardar en formato utf8
set hidden
set ignorecase

" scroll suave. no es necesario en neovim
set scrolloff=8 " Keep at least 8 lines below cursor
set foldmethod=manual " To avoid performance issues, I never fold anything so...




"-----------------------------------------
" 3. UI
"-----------------------------------------
set fillchars+=vert:\ " Retire las tuberías desagradables de las divisiones verticales.
" Sauce on this: http://stackoverflow.com/a/9001540
set wildmenu " enable visual wildmenu
set number " show line numbers
set showmatch " resaltar paréntesis y corchetes coincidentes
set nohlsearch
set lazyredraw
set ttyfast
set hidden


  
"-----------------------------------------
" 4. MAPS AND FUNCTIONS
"-----------------------------------------
let mapleader=","
" Fragmento de console.log
nmap <leader><leader>c oconsole.log({});<Esc>==f{a
" To avoid undo points when using arrow keys
inoremap <Left> <c-g>U<Left>
inoremap <Right> <c-g>U<Right>
" Whit leader p you can delete things without saving to register so you can
" paste what you have before
vnoremap <leader>p "_d
" Make window navigation less painful.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Working with buffers is cool.
map <C-d> :bnext<CR>
map <C-a> :bprev<CR>
imap <C-D> <Esc>:bnext<CR>a
imap <C-A> <Esc>:bprev<CR>a
" Capital Y to copy to the end of the line like C or D
nnoremap Y y$
" To move in the search list but keeping the cursor in the middle of screen
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
" To close buffers without closing splits
nnoremap <silent> <C-q> :lclose<bar>b#<bar>bd #<CR>

```

## Instalar Plugins

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

" Sauce on this: http://stackoverflow.com/a/9001540

set wildmenu " enable visual wildmenu


set nohlsearch
set lazyredraw
set ttyfast
set hidden


set showcmd				" mostrar los comandos que se ejecuta en barra (show the comand that are executed in bar)
set number 				" mostrar numero de lineas (show line numbers)
syntax enable       	" sintaxis de codigo resaltado de color (color highligth code syntax)
set clipboard=unnamed   " habilitar copiar al movernos con el mouse (enable copy on mouse move)
set mouse=a     		" poder mover el mouse y arrastrar selecionar (begin able to move the mouse and drag select)

set relativenumber   	" mostrar numeracion arriba y abajo (show top and botton numbering)
set laststatus=2        " mostrar barrita status  de abajo en vim  (show bar status botton)
" set noshowmode        " No mostrar barrita de status insert o visual (show bar status insert or visual)

set showmatch 			" resaltar paréntesis y corchetes coincidentes (highligth matching parentheses and brackets)

set hidden              " para ocultar la advertencia al abrir archivos (to hide warning when opening files)
" set scrolloff=8         " Mantenga al menos 8 líneas debajo del cursor
set encoding=utf-8 		" codificacion de archivos siempre al guardar (file encoding always on save)
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

"# Panel Navegador de Archivos (LEX)
nnoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>   " minim
inoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>


```