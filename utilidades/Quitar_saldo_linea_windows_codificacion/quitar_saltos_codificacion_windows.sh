# quitar saltos de linea de un fichero
# - CRLF -> de Windows
# - LF   -> de Linux

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# :::::::::: la opcion uno por uno ::::::::::::::::::::::::::
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#cat conf_alias_level_1.sh | sed 's/<CRLF><CRLF>/\n/g' > temp.tmp && cat temp.tmp > conf_alias_level_1.sh


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# :::::::::: la opcion masiva ::::::::::::::::::::::::::
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

dosomething () {
  path_file=$1
  path_file_temp="${1}_temp.tmp"
  echo "convirtiendo fichero: ${path_file}.."
  cat $path_file | sed 's/<CRLF><CRLF>/\n/g' > $path_file_temp && cat $path_file_temp > $path_file
  rm -rf $path_file_temp
  sleep 0.2
}

find '/C/Users/Cesar/mobax/home/libs_shell/mobax' -type f | while read file; do dosomething "$file"; done
