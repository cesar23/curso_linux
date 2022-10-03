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
apt -y install neovim


echo '' >> /tmp/init.vim
echo '" TABLE OF CONTENTS:' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo '" 1. Generic settings' >> /tmp/init.vim
echo '" 2. File settings' >> /tmp/init.vim
echo '" 3. UI' >> /tmp/init.vim
echo '" 4. Maps and functions' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo '"-----------------------------------------' >> /tmp/init.vim
echo '" 1. GENERIC SETTINGS' >> /tmp/init.vim
echo '"-----------------------------------------' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo 'set nocompatible " disable vi compatibility mode' >> /tmp/init.vim
echo 'set history=1000 " increase history size' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo '"-----------------------------------------' >> /tmp/init.vim
echo '" 2. FILE SETTINGS' >> /tmp/init.vim
echo '"-----------------------------------------' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo '" :::::: Stop creating backup files, please use Git for backups' >> /tmp/init.vim
echo 'set nobackup' >> /tmp/init.vim
echo 'set nowritebackup' >> /tmp/init.vim
echo 'set noswapfile' >> /tmp/init.vim
echo 'set backspace=indent,eol,start' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo '" :::::: Modify indenting settings' >> /tmp/init.vim
echo 'set autoindent " autoindent always ON.' >> /tmp/init.vim
echo 'set expandtab " expand tabs' >> /tmp/init.vim
echo 'set shiftwidth=2 " spaces for autoindenting' >> /tmp/init.vim
echo 'set softtabstop=2 " remove a full pseudo-TAB when i press <BS>' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo '" :::::: Modificar algunas otras configuraciones sobre archivos' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo 'set hidden' >> /tmp/init.vim
echo 'set ignorecase' >> /tmp/init.vim
echo 'set scrolloff=8 " Keep at least 8 lines below cursor' >> /tmp/init.vim
echo 'set foldmethod=manual " To avoid performance issues, I never fold anything so...' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo '"-----------------------------------------' >> /tmp/init.vim
echo '" 3. UI' >> /tmp/init.vim
echo '"-----------------------------------------' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo 'set fillchars+=vert:\ " Retire las tuberías desagradables de las divisiones verticales.' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo '" - Sauce on this: http://stackoverflow.com/a/9001540' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo 'set wildmenu " enable visual wildmenu' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo 'set nohlsearch' >> /tmp/init.vim
echo 'set lazyredraw' >> /tmp/init.vim
echo 'set ttyfast' >> /tmp/init.vim
echo 'set hidden' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo 'set showcmd				" mostrar los comandos que se ejecuta en barra (show the comand that are executed in bar)' >> /tmp/init.vim
echo 'set number 				" mostrar numero de lineas (show line numbers)' >> /tmp/init.vim
echo 'syntax enable       	" sintaxis de codigo resaltado de color (color highligth code syntax)' >> /tmp/init.vim
echo 'set clipboard=unnamedplus   " habilitar copiar al movernos con el mouse (enable copy on mouse move)' >> /tmp/init.vim
echo 'set mouse=a     		" poder mover el mouse y arrastrar selecionar (begin able to move the mouse and drag select)' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo 'set relativenumber   	" mostrar numeracion arriba y abajo (show top and botton numbering)' >> /tmp/init.vim
echo 'set laststatus=2        " mostrar barrita status  de abajo en vim  (show bar status botton)' >> /tmp/init.vim
echo '" set noshowmode        " No mostrar barrita de status insert o visual (show bar status insert or visual)' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo 'set showmatch 			" resaltar paréntesis y corchetes coincidentes (highligth matching parentheses and brackets)' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo 'set hidden              " para ocultar la advertencia al abrir archivos (to hide warning when opening files)' >> /tmp/init.vim
echo '" set scrolloff=8         " Mantenga al menos 8 líneas debajo del cursor' >> /tmp/init.vim
echo 'set encoding=UTF-8 		" codificacion de archivos siempre al guardar (file encoding always on save)' >> /tmp/init.vim
echo 'set shiftwidth=2    	" Tab por espacios, indentado de 2 espacios (2 space indent)' >> /tmp/init.vim
echo '" :::::::::::: IU' >> /tmp/init.vim
echo 'let &t_ut=''  			"VIM: Para representar adecuadamente el fondo de la combinación de colores' >> /tmp/init.vim
echo 'set ruler 				" habilitar en barra linea y posicion (enable in bar line and position)' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo '"-----------------------------------------' >> /tmp/init.vim
echo '" 4. PLUGINS' >> /tmp/init.vim
echo '"-----------------------------------------' >> /tmp/init.vim
echo 'let mapleader =" "' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo 'if has('nvim')' >> /tmp/init.vim
echo '    set background=dark' >> /tmp/init.vim
echo 'else' >> /tmp/init.vim
echo '	set background=dark' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo 'end' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo '' >> /tmp/init.vim
echo '" para  guardar arhcivos' >> /tmp/init.vim
echo 'nmap <leader>so :source $HOME\_vimrc<CR>' >> /tmp/init.vim
echo 'nmap <leader>w :w <CR>' >> /tmp/init.vim
echo 'nmap <leader>x :x <CR>' >> /tmp/init.vim
echo 'nmap <leader>q :q <CR>' >> /tmp/init.vim
echo '"# Panel Navegador de Archivos (LEX) uso: Ctrl+b' >> /tmp/init.vim
echo 'nnoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>   " minim' >> /tmp/init.vim
echo 'inoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>' >> /tmp/init.vim
echo '" ------------------------------------------------' >> /tmp/init.vim


# --------------------------------------------------
# ----------instalar neoVim
# --------------------------------------------------



echo "">/tmp/neovim_cesar.sh

echo '# ---- isntalr  neovim' >> /tmp/neovim_cesar.sh
echo 'apt-get install -y neovim' >> /tmp/neovim_cesar.sh
echo '# para la configuracion' >> /tmp/neovim_cesar.sh
echo 'mkdir -p ~/.config/nvim && touch ~/.config/nvim/init.vim' >> /tmp/neovim_cesar.sh
echo '# configuracion plugin' >> /tmp/neovim_cesar.sh
echo 'mkdir -p ~/.vim/plugged' >> /tmp/neovim_cesar.sh
echo '# Crear carpeta' >> /tmp/neovim_cesar.sh
echo 'mkdir -p ~/.config/nvim/autoload' >> /tmp/neovim_cesar.sh
echo '# descargar desde el repositorio de github y guardarlo el archivo de condiguracion' >> /tmp/neovim_cesar.sh
echo 'curl  -L -o "${HOME}/.config/nvim/autoload/plug.vim"  "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"' >> /tmp/neovim_cesar.sh
echo 'sleep 10' >> /tmp/neovim_cesar.sh
echo '# copiamos la  configuracion' >> /tmp/neovim_cesar.sh
echo 'cp /tmp/init.vim ~/.config/nvim/init.vim' >> /tmp/neovim_cesar.sh

chmod +x /tmp/neovim_cesar.sh


# -----------------------------------------------
# -----------------------------------------------
# ------- luego de iniciar como usuario ubuntu ejecutar
# -----------------------------------------------
# :::::::: > sudo chmod +x /tmp/neovim_cesar.sh
# /tmp/neovim_cesar.sh
# -----------------------------------------------