
### buscar si existe palabra y retorna 1 o 0

aqui buscamos en el archivo `demo_1.php` si existe la palabra `WP_DEBUG` si existe
debolvera `1` si no `0`
```shell
grep -c "FS_METHOD" demo_1.php
# output:
#   1
   
grep -c "WP_UG" demo_1.php
# output:
#   0  

# ---------------- validar con if
if [ $(grep -c "FS_METHOD" demo_1.php) -eq 1 ]
then
    echo "Si existe WP_DEBUG"
fi

```
