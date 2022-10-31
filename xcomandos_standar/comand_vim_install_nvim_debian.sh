
sudo apt update
# instalar nvim
sudo apt-get install -y vim neovim && \
sudo apt-get install -y python3-neovim && \
sudo apt install -y git curl


# para la configuracion
mkdir -p ~/.config/nvim && touch ~/.config/nvim/init.vim

# configuracion plugin
mkdir -p ~/.vim/plugged
# Crear carpeta
mkdir -p ~/.config/nvim/autoload

curl -A 'Mozilla/3.0 (Win95; I)' -L -o ~/.config/nvim/autoload/plug.vim \
 "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"


curl -A 'Mozilla/3.0 (Win95; I)' -L -o ~/.config/nvim/autoload/plug.vim \
 "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"


touch ~/.config/nvim/init.vim
