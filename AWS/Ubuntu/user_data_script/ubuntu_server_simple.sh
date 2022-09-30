#!/bin/bash
apt -y update
# ------- Ahora instalamos el paquete que nos instala paquetes esenciales:
apt install -y build-essential

# ------- instalar utilidades
apt -y install util-linux tree curl net-tools htop tree git
# ------- iftop, vigila el consumo de ancho de banda de tu red en tiempo real
apt -y install iftop
apt -y install nmap
apt -y install mlocate
apt -y install iotop

# --------------------------------------------------------
# ---------------------instalaciones adicionales
# --------------------------------------------------------
apt -y install postgresql postgresql-contrib

# --------------------------------------------------------
# ---------------------instalaciones de nvim
# --------------------------------------------------------


#cat > ~/.config/nvim/init.vim <<EOF
cat > /tmp/init.vim <<EOF
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
EOF


cat > /tmp/cesar.sh <<EOF
echo "usuario $USER"> /tmp/cesar.txt
# ---- isntalr  neovim
apt-get install -y neovim
# para la configuracion
mkdir ~/.config/nvim && touch ~/.config/nvim/init.vim

# configuracion plugin
mkdir -p ~/.vim/plugged
# Crear carpeta
mkdir -p ~/.config/nvim/autoload
# descargar desde el repositorio de github y guardarlo el archivo de condiguracion
curl -A 'Mozilla/3.0 (Win95; I)' -L -o "${HOME}/.config/nvim/autoload/plug.vim"  "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

sleep 10

# copiamos la  configuracion
cp /tmp/init.vim ~/.config/nvim/init.vim

EOF
