  # entrada de informacion desde la consola read

### ::::::::: Ejemplo basico
echo '::::::::::::::::::::::::::::::::::'
echo '::::::::: Ejemplo basico :::::::::'
echo '::::::::::::::::::::::::::::::::::'
echo ''

  printf "Please enter your name: "
  read opt
  
  echo "El valor es:${opt}"

  sleep 5

### ::::::::: Ejemplo por defecto
echo ''
echo '::::::::::::::::::::::::::::::::::'
echo '::::::::: Ejemplo por default ::::'
echo '::::::::::::::::::::::::::::::::::'
echo ''

name="Ricardo"
read -e -i "$name" -p "Please enter your name: " input
name="${input:-$name}"
echo "El valor es:${name}"
