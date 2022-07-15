sudo apt purge nautilus gnome-shell-extension-desktop-icons -y

sudo apt install nemo -y

xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search

gsettings set org.gnome.desktop.background show-desktop-icons false

gsettings set org.nemo.desktop show-desktop-icons true

sudo gedit /etc/xdg/autostart/nemo-autostart.desktop

Copia este contenido en el fichero:
[Desktop Entry]
Type=Application
Name=Files
Exec=nemo-desktop
OnlyShowIn=GNOME;Unity;
X-Ubuntu-Gettext-Domain=nemo

Ponemos Nemo como favorito en el lanzador de Unity.

Y reiniciamos el PC.


sudo apt install nautilus gnome-shell-extension-desktop-icons -y
sudo apt purge nemo -y
gsettings set org.gnome.desktop.background show-desktop-icons true
sudo rm /etc/xdg/autostart/nemo-autostart.desktop
Y reiniciar.