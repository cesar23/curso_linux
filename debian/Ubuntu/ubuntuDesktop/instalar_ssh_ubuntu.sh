#fuente: https://comoinstalar.me/como-instalar-ssh-en-ubuntu-20-04-lts/

sudo apt install ssh

systemctl status ssh
sudo systemctl reload ssh

# -------------------
# habilitar cortafuego
sudo ufw allow ssh

# --------------------
# habilitar iptable

sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
# para guardar los cambios
sudo /sbin/iptables-save



iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -F



ssh cesar@192.168.202.143
