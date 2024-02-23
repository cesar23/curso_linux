### ::::::::: Ejemplo por defecto
echo ''
echo '::::::::::::::::::::::::::::::::::'
echo '::::::::: String por default ::::'
echo '::::::::::::::::::::::::::::::::::'
echo ''

default="Peru"
pais=""
result="${pais:-$default}"

echo "Salida: ${result}"
