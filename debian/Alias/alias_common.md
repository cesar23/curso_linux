# alias comunes en linux

para limpieza consola
```shell
# ::::::: clear (para limpieza consola)
alias c="clear"
alias cl="clear"
alias ckear="clear"
alias clr="clear"
```

Calcule el uso del espacio de archivos a la profundidad máxima
```shell
# ::::::: du
alias du1="du -d 1"
```

Git commands
```shell
# ::::::: git
alias gs="git status"
alias gst="git status -sb"
alias gl="git log"
alias ga="git add"
alias gaa="git add -A"
alias gal="git add ."
alias gall="git add ."
alias gca="git commit -a"
alias gc="git commit -m"
alias gcot="git checkout"
alias gchekout="git checkout"
alias gchckout="git checkout"
alias gckout="git checkout"
alias go="git push -u origin"
alias gsh='git stash'
alias gw='git whatchanged'
alias gitlg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias nah="git clean -df && git checkout -- ."
```


History commands
```shell
# ::::::: history
alias h="history"
alias h1="history 10"
alias h2="history 20"
alias h3="history 30"
alias hgrep='history | grep'
```


List commands
```shell
# ::::::: listar
alias l="ls"
alias l='ls -lAh'
alias ls="ls -a"
alias la="ls -a"
alias ll="ls -al"
```
Launch Simple HTTP Server

```shell
# ::::::: iniciar server web local
alias serve='python3 -mhttp.server 8081'
```

```shell
# ::::::: iniciar server ftp Local
#pip3 install pyftpdlib
#python -m pyftpdlib -p 21 -w --user=username --password=password
alias serve_ftp='python -m pyftpdlib -p 21 -w --user=cesar --password=cesar203'
```

Install & Update utilties

```shell
# ::::::: update
alias sai="sudo apt install"
alias sai="sudo apt-get install"
alias sau="sudo apt update"
alias sau="sudo apt-get update"
alias update="sudo apt update"
alias update="yum update"
alias updatey="yum -y update"
```

## Completo

```shell
# ::::::: clear (para limpieza consola)
alias c="clear"
alias cl="clear"
alias ckear="clear"
alias clr="clear"

# ::::::: du
alias du1="du -d 1"

# ::::::: git
alias gs="git status"
alias gst="git status -sb"
alias gl="git log"
alias ga="git add"
alias gaa="git add -A"
alias gal="git add ."
alias gall="git add ."
alias gca="git commit -a"
alias gc="git commit -m"
alias gcot="git checkout"
alias gchekout="git checkout"
alias gchckout="git checkout"
alias gckout="git checkout"
alias go="git push -u origin"
alias gsh='git stash'
alias gw='git whatchanged'
alias gitlg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias nah="git clean -df && git checkout -- ."

# ::::::: history
alias h="history"
alias h1="history 10"
alias h2="history 20"
alias h3="history 30"
alias hgrep='history | grep'

# ::::::: iniciar server web local
alias serve='python3 -mhttp.server 8081'

# ::::::: iniciar server ftp Local
#pip3 install pyftpdlib
#python -m pyftpdlib -p 21 -w --user=username --password=password
alias serve_ftp='python -m pyftpdlib -p 21 -w --user=cesar --password=cesar203'

# ::::::: update
alias sai="sudo apt install"
alias sai="sudo apt-get install"
alias sau="sudo apt update"
alias sau="sudo apt-get update"
alias update="sudo apt update"
alias update="yum update"
alias updatey="yum -y update"
```