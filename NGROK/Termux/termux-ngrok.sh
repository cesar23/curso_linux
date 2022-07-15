#!/bin/dash
# Desenvolvido por Tchelo Noob
atualizar='\033[1;32m'
echo "$atualizar Atualizando repositório..."
apt update && upgrade -y
apt install -y wget
clear
k='\033[01;32m'
echo
echo "${k} ██████ ███████ ███████  █████  ██████       █████  ██    ██ ██████  ██ ███████ "
echo "${k}██      ██      ██      ██   ██ ██   ██     ██   ██ ██    ██ ██   ██ ██ ██      "
echo "${k}██      █████   ███████ ███████ ██████      ███████ ██    ██ ██████  ██ ███████ "
echo "${k}██      ██           ██ ██   ██ ██   ██     ██   ██ ██    ██ ██   ██ ██      ██ "
echo "${k} ██████ ███████ ███████ ██   ██ ██   ██     ██   ██  ██████  ██   ██ ██ ███████ "
echo "${k}                                                                                "
echo "${k}                                                                                "
echo "${k}████████ ███████ ██████  ███    ███ ██    ██ ██   ██                            "
echo "${k}   ██    ██      ██   ██ ████  ████ ██    ██  ██ ██                             "
echo "${k}   ██    █████   ██████  ██ ████ ██ ██    ██   ███                              "
echo "${k}   ██    ██      ██   ██ ██  ██  ██ ██    ██  ██ ██                             "
echo "${k}   ██    ███████ ██   ██ ██      ██  ██████  ██   ██                            "
echo "${k}                                                                                "

echo
echo "Desea instalar o Ngrok? [Y/n]"
read opcao
case $opcao in
y)
  echo
  echo "Downloading Termux-ngrok..."
  case $(dpkg --print-architecture) in
  aarch64)
    architectureURL="arm64"
    ;;
  arm)
    architectureURL="arm"
    ;;
  armhf)
    architectureURL="armhf"
    ;;
  amd64)
    architectureURL="amd64"
    ;;
  i*86)
    architectureURL="i386"
    ;;
  x86_64)
    architectureURL="amd64"
    ;;
  *)
    echo "Arquitetura desconhecida"
    ;;
  esac
  #//https://cesar23.github.io/repos_util/linux/ngrok/ngrok-stable-linux-amd64.zip?raw=true
  wget "https://cesar23.github.io/repos_util/linux/ngrok/ngrok-stable-linux-${architectureURL}.zip?raw=true" -O ngrok.zip
  unzip ngrok.zip
  cat ngrok >/data/data/com.termux/files/usr/bin/ngrok
  chmod 700 /data/data/com.termux/files/usr/bin/ngrok
  rm ngrok ngrok.zip
  clear
  echo "${k}███╗   ██╗ ██████╗ ██████╗  ██████╗ ██╗  ██╗"
  echo "${k}████╗  ██║██╔════╝ ██╔══██╗██╔═══██╗██║ ██╔╝"
  echo "${k}██╔██╗ ██║██║  ███╗██████╔╝██║   ██║█████╔╝ "
  echo "${k}██║╚██╗██║██║   ██║██╔══██╗██║   ██║██╔═██╗ "
  echo "${k}██║ ╚████║╚██████╔╝██║  ██║╚██████╔╝██║  ██╗"
  echo "${k}╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝"
  echo
  echo "Exemplo de comando (ngrok http 80\nOu ngrok para ajuda)"
  echo ""
  echo ""
  echo "Activar el uso compartido del internet para que  funcione"
  echo "Ejemplo: https://i.imgur.com/qFq5ub6.png "

  #------------------ usuario codetips
  ngrok authtoken 223rFTunHUYWrDPkor5N9PM6tVm_7CL5d6rhdZqYzuuSDv6hz

  ;;

n)
  clear
  echo "Ngrok No instalado "
  echo
  ;;
esac
