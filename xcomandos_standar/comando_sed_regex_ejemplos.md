#### 1. ejemplo para reemplazar php.ini de host

- `sed -E ` => es para probar como se vera
- `sed -E -i` => es para ya sobreescribir el fichero


```shell
#(;?)(post_max_size[[:space:]]=[[:space:]])[0-9]+M

#sed -E -i 's/(;?)(post_max_size[[:space:]]=[[:space:]])[0-9]+M/\2328M/g' ./php.demo.ini
#sed -E -i 's/(^;?)(post_max_size[[:space:]]=[[:space:]])[0-9]+M/\2328M/g' ./php.demo.ini
sed -E -i 's/^(post_max_size[[:space:]]=[[:space:]])[0-9]+M/\1328M/g' ./php.demo.ini
sed -E -i 's/^(upload_max_filesize[[:space:]]=[[:space:]])[0-9]+M/\1528M/g' ./php.demo.ini
sed -E -i 's/^(memory_limit[[:space:]]=[[:space:]])[0-9]+M/\11024M/g' ./php.demo.ini
sed -E -i 's/^(max_execution_time[[:space:]]=[[:space:]])[0-9]+/\13600/g' ./php.demo.ini
sed -E -i 's/^(max_input_time[[:space:]]=[[:space:]])[0-9]+/\13600/g' ./php.demo.ini


```
