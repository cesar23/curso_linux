
echo '' > ~/.config/nvim/init.vim
echo '" TABLE OF CONTENTS:' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo '" 1. Generic settings' >> ~/.config/nvim/init.vim
echo '" 2. File settings' >> ~/.config/nvim/init.vim
echo '" 3. UI' >> ~/.config/nvim/init.vim
echo '" 4. Maps and functions' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo '"-----------------------------------------' >> ~/.config/nvim/init.vim
echo '" 1. GENERIC SETTINGS' >> ~/.config/nvim/init.vim
echo '"-----------------------------------------' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo 'set nocompatible " disable vi compatibility mode' >> ~/.config/nvim/init.vim
echo 'set history=1000 " increase history size' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo '"-----------------------------------------' >> ~/.config/nvim/init.vim
echo '" 2. FILE SETTINGS' >> ~/.config/nvim/init.vim
echo '"-----------------------------------------' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo '" :::::: Stop creating backup files, please use Git for backups' >> ~/.config/nvim/init.vim
echo 'set nobackup' >> ~/.config/nvim/init.vim
echo 'set nowritebackup' >> ~/.config/nvim/init.vim
echo 'set noswapfile' >> ~/.config/nvim/init.vim
echo 'set backspace=indent,eol,start' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo '" :::::: Modify indenting settings' >> ~/.config/nvim/init.vim
echo 'set autoindent " autoindent always ON.' >> ~/.config/nvim/init.vim
echo 'set expandtab " expand tabs' >> ~/.config/nvim/init.vim
echo 'set shiftwidth=2 " spaces for autoindenting' >> ~/.config/nvim/init.vim
echo 'set softtabstop=2 " remove a full pseudo-TAB when i press <BS>' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo '" :::::: Modificar algunas otras configuraciones sobre archivos' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo 'set hidden' >> ~/.config/nvim/init.vim
echo 'set ignorecase' >> ~/.config/nvim/init.vim
echo 'set scrolloff=8 " Keep at least 8 lines below cursor' >> ~/.config/nvim/init.vim
echo 'set foldmethod=manual " To avoid performance issues, I never fold anything so...' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo '"-----------------------------------------' >> ~/.config/nvim/init.vim
echo '" 3. UI' >> ~/.config/nvim/init.vim
echo '"-----------------------------------------' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo 'set fillchars+=vert:\ " Retire las tuberÃ­as desagradables de las divisiones verticales.' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo '" - Sauce on this: http://stackoverflow.com/a/9001540' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo 'set wildmenu " enable visual wildmenu' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo 'set nohlsearch' >> ~/.config/nvim/init.vim
echo 'set lazyredraw' >> ~/.config/nvim/init.vim
echo 'set ttyfast' >> ~/.config/nvim/init.vim
echo 'set hidden' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo 'set showcmd				" mostrar los comandos que se ejecuta en barra (show the comand that are executed in bar)' >> ~/.config/nvim/init.vim
echo 'set number 				" mostrar numero de lineas (show line numbers)' >> ~/.config/nvim/init.vim
echo 'syntax enable       	" sintaxis de codigo resaltado de color (color highligth code syntax)' >> ~/.config/nvim/init.vim
echo 'set clipboard=unnamedplus   " habilitar copiar al movernos con el mouse (enable copy on mouse move)' >> ~/.config/nvim/init.vim
echo 'set mouse=a     		" poder mover el mouse y arrastrar selecionar (begin able to move the mouse and drag select)' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo 'set relativenumber   	" mostrar numeracion arriba y abajo (show top and botton numbering)' >> ~/.config/nvim/init.vim
echo 'set laststatus=2        " mostrar barrita status  de abajo en vim  (show bar status botton)' >> ~/.config/nvim/init.vim
echo '" set noshowmode        " No mostrar barrita de status insert o visual (show bar status insert or visual)' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo 'set showmatch 			" resaltar parÃ©ntesis y corchetes coincidentes (highligth matching parentheses and brackets)' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo 'set hidden              " para ocultar la advertencia al abrir archivos (to hide warning when opening files)' >> ~/.config/nvim/init.vim
echo '" set scrolloff=8         " Mantenga al menos 8 lÃ­neas debajo del cursor' >> ~/.config/nvim/init.vim
echo 'set encoding=UTF-8 		" codificacion de archivos siempre al guardar (file encoding always on save)' >> ~/.config/nvim/init.vim
echo 'set shiftwidth=2    	" Tab por espacios, indentado de 2 espacios (2 space indent)' >> ~/.config/nvim/init.vim
echo '" :::::::::::: IU' >> ~/.config/nvim/init.vim
echo "let &t_ut=''  			\"VIM: Para representar adecuadamente el fondo de la combinaciÃ³n de colores" >> ~/.config/nvim/init.vim
echo 'set ruler 				" habilitar en barra linea y posicion (enable in bar line and position)' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo '"-----------------------------------------' >> ~/.config/nvim/init.vim
echo '" 4. PLUGINS' >> ~/.config/nvim/init.vim
echo '"-----------------------------------------' >> ~/.config/nvim/init.vim
echo 'let mapleader =" "' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo "if has('nvim')" >> ~/.config/nvim/init.vim
echo '    set background=dark' >> ~/.config/nvim/init.vim
echo 'else' >> ~/.config/nvim/init.vim
echo '	set background=dark' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo 'end' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo '" para  guardar arhcivos' >> ~/.config/nvim/init.vim
echo 'nmap <leader>so :source $HOME\_vimrc<CR>' >> ~/.config/nvim/init.vim
echo 'nmap <leader>w :w <CR>' >> ~/.config/nvim/init.vim
echo 'nmap <leader>x :x <CR>' >> ~/.config/nvim/init.vim
echo 'nmap <leader>q :q <CR>' >> ~/.config/nvim/init.vim
echo '"# Panel Navegador de Archivos (LEX) uso: Ctrl+b' >> ~/.config/nvim/init.vim
echo 'nnoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>   " minim' >> ~/.config/nvim/init.vim
echo 'inoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>' >> ~/.config/nvim/init.vim
echo '" ------------------------------------------------' >> ~/.config/nvim/init.vim

