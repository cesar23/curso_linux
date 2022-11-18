
sudo apt-get -y update
sudo apt-get -y install libmms0 libc-ares2 libc6 libcrypto++6 libgcc1 libmediainfo0v5 libpcre3 libpcrecpp0v5 libssl1.1 libstdc++6 libzen0v5 zlib1g apt-transport-https
#------ se  descargara de la pagina  oficiald e mega  el mega
# https://mega.nz/cmd
#-- : para  64 bits
sudo curl -sL -o /var/cache/apt/archives/MEGAcmd.deb https://mega.nz/linux/MEGAsync/Debian_9.0/amd64/megacmd-Debian_9.0_amd64.deb
#-- : para  32 bits
#sudo curl -sL -o /var/cache/apt/archives/MEGAcmd.deb https://mega.nz/linux/MEGAsync/Debian_9.0/i386/megacmd-Debian_9.0_i386.deb


sudo dpkg -i /var/cache/apt/archives/MEGAcmd.deb