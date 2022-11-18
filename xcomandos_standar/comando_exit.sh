
# Exit code 0        Success
# Exit code 1        General errors, Miscellaneous errors, such as "divide by zero" and other impermissible operations
# Exit code 2        Misuse of shell builtins (according to Bash documentation)        Example: empty_function()
# Exit code 3        variable no defined etc

# ------- con parentesis ejecutamos esto para que nos ejecute y nos arroge lo que  bote exit
(
a=10
c=10

if [ $a == $b ]
then
  echo "BIEN"
else
   echo "No son iguales"
   exit 3
   echo "este  codigo ya no se  ejecuta"

fi
)

# :::::::::::::::::::::::::::::::::::::
#---------- probar primero esto
# aqui  capturamos la  salida
echo "Code Exit:${?}"
# despues de esto ya exit valdra 0
echo "Code Exit:${?}"

# :::::::::::::::::::::::::::::::::::::
#---------- Despues probar esto
if [ $? == 3 ]
then
  echo "Bail out detected"
fi

