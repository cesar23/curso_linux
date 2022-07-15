fuente: https://www.computerhope.com/unix/test.htm



# comprobamo si 100 es  mayor
test 100 -gt 99 && echo "Si es mayor." || echo "NO es mayor."

# Este comando imprimirá "0" porque la expresión es verdadera; 
# Las dos cuerdas son idénticas.
[ "awesome" = "awesome" ]; echo $?


# Este comando imprimirá "1" porque la expresión es falsa; 5 no es igual a 6.
[ 5 -eq 6 ]; echo $?


# ARCHIVO existe y se otorga permiso de ejecución (o búsqueda)
test -x /root/conexioness.sh || echo "NO existe y no es ejecutable"