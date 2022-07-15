fuentes: 

- https://stackoverflow.com/questions/11162406/open-and-write-data-to-text-file-using-bash



### 1 shell simple
```shell
printf "Primera fila\n Segunda \n Tercera" >> /tmp/demo1.txt
```

### 2  varias lineas
```shell

cat > file_2.txt <<EOF

info code info 
info code info 
info code info 
info code info 

EOF
```

### 3 shell simple
```shell

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'cesar203';" >> /tmp/demo1.sql

```
### 4 shell simple

```shell
my_var="some value -e \n"
cat <<< "my variable is $my_var" > file.log
cat file.log
```
