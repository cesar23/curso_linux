dosomething () {
  echo "Doing something with $1"
}

cd '/C/Users/Cesar/mobax/home/libs_shell/mobax'

#::::::::::::::::::::::: primer metodo
#export -f dosomething
#find . -exec bash -c 'dosomething "$0"' {} \;


#::::::::::::::::::::::: segundo metodo (este es mas rapido)
find '/C/Users/Cesar/mobax/home/libs_shell/mobax' -type f | while read file; do dosomething "$file"; done
