# fuente: https://www.youtube.com/watch?v=K9GIGpPqd5k

Temas:
1. Instalamos gnome-tweak-tool
    sudo apt-get install gnome-tweak-tool

2. vamos a la  pagina de tehemas y  descargamos

    nome-look.org

    escogemos  los de tipo: GTK3/4 Themes

3. Nos movemos al directorio Descargas
    cd ~/Downloads
    Extraemos el contenido
    tar -xvf [nombre de tema].tar.xz


4. +Instalación usuario único:
    Creamos la carpeta themes
        mkdir -p ~/.themes
    Movemos el contenido a la carpeta themes
        mv [nombre de tema]/ ~/.themes/

# +Todo el sistema:
# Obtenemos permisos de super usuario
#     sudo -s
# Copiamos el tema a la carpeta themes para todos
#     [nombre del tema]/ /usr/share/themes/