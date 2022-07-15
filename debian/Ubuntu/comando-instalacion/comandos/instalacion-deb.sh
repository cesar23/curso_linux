
#si nos  sale  erro de  instalacion con archivos deb
sudo chown -R ${USER}:${USER} ~/.gnupg
chmod -R go-rwx ~/.gnupg


sudo dpkg -i code_1.37.1-1565886362_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
