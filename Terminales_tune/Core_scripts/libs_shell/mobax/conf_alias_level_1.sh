#!/bin/bash
# function dir_gspMarino(){
#   cd C:\\laragon\\www\\gspmarinov1
# }
# TODO ddsd
# function dir_gspTerrestre(){
#   cd C:\\laragon\\www\\gsptrackv1#!/bin/bash
#------------------------------------------------------------------
#--------------------------- ALIAS  -------------------------------
#------------------------------------------------------------------

#:: Navigation -------------------------------------------------------
alias ..='cd ..'
alias ...='cd .. ; cd ..'
## Use a long listing format ##
alias ll='ls -la' 
## Show hidden files ##
alias l.='ls -d .* --color=auto'

#:: GIT -------------------------------------------------------
alias gst='git status'
alias gch='git checkout'
alias gcm=gcm
alias gme='git merge'
alias grb='git rebase'
alias gbr='git branch'
alias gpl='git pull'
alias gpu='git push'
alias gad='git add -A'
alias gmt='git mergetool'
alias bdf='git diff'
alias glg='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias glg2='git log --date-order --all --graph --name-status --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'

#:: FILES -------------------------------------------------------
# refresh shell

# open current directory
alias opend='explorer .'

name="Cesar Auris"
alias yo='echo -e "\e[36m${name}\e[0m"'

#:: EXTRAS -------------------------------------------------------

# extraer fichero
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      rar x $1        ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# alias ssh_geo='ssh root@52.37.212.68'
alias ssh_docker_ubuntu='ssh root@52.37.212.68'
alias c='clear'
alias disco='df -h'
# alias ssh_mail='ssh root@52.37.247.50' #pass admings@2016

# alias ls='ls -lart'

## Colorize the ls output ##
#alias ls='ls -lart --color=auto'
## Use a long listing format ##
alias ll='ls -la'
 
## Show hidden files ##
alias l.='ls -d .* --color=auto'
# alias gitup = '!git add -A . && git commit -m "${DATE_HOUR}" && git push origin master'


alias tl=fn_tal


# alias para  paquetes tree
alias tree='tree -I "node_modules|cache|test_*" '