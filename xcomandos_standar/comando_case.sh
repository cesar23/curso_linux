variable=10
case $variable in
  "10")
    echo "selecionastes 10"
  ;;
  "2")
    echo "selecionastes 2"
  ;;
  "1")
    echo "selecionastes 1"
  ;;
  *)
    echo "No selecionastes nada"
  ;;
esac

printf "\n\n\n"

echo "Cuantos años tengo"
read edad
case $edad in
  37)
    echo "¡Correcto!"
  ;;
  *)
    echo "¡Nop!"
  ;;
esac
# ----------------------------------------------------------------------
# ----------------------------------------------------------------------
# ----------------------------------------------------------------------
echo "Escribe tu nombre sin usar mayusculas"
read nombre
case $nombre in
  a*)
    echo "tu nombre empieza con a"
  ;;
  c*t)
    echo "tu nombre empieza con c y termina con t"
  ;;
  *se)
    echo "tu nombre termina con la cadena se"
  ;;
  *)
    echo "no soy capaz de reconocer tu nombre"
  ;;
esac
