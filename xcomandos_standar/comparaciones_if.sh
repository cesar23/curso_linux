#!/bin/bash

#fuente: http://escueladeprogramacion.es/snippets/bash/Comparadores.html


#Como Hacer Comparaciones en bash
#En bash hay diferentes comparadores según lo que queramos comparar:


echo "-------------------------------------------------------"
echo "-----------1 . Comparación de Enteros------------------"
echo "-------------------------------------------------------"
echo ""

a=1
b=1

if [ "$a" -eq "$b" ]; then
	echo "\$a es IGUAL que \$b"
fi

a=100
b=1

if [ "$a" -ne "$b" ]; then
	echo "\$a NO ES IGUAL que \$b"
fi

a=100
b=1

if [ "$a" -gt "$b" ]; then
	echo "\$a es MAYOR que \$b"
fi

a=1
b=5

if [ "$a" -lt "$b" ]; then
	echo "\$a es MENOR que \$b"
fi

a=7
b=5

if [ "$a" -ge "$b" ]; then
	echo "\$a es MAYOR O IGUAL que \$b"
fi

a=5
b=5

if [ "$a" -le "$b" ]; then
	echo "\$a es MENOR O IGUAL que \$b"
fi

echo ""
echo ""
echo "-------------------------------------------------------"
echo "-----------2 . Comparación de Textos-------------------"
echo "-------------------------------------------------------"
echo ""
#!/bin/bash

if [ "$a" = "$b" ]; then
	echo "\$a es IGUAL que \$b"
fi

if [ "$a" == "$b" ]; then
	echo "\$a es IGUAL que \$b"
fi

if [ "$a" != "$b" ]; then
	echo "\$a NO ES IGUAL que \$b"
fi

if [ "$a" \> "$b" ]; then
	echo "\$a es MAYOR que \$b"
fi

if [ "$a" \< "$b" ]; then
	echo "\$a es MENOR que \$b"
fi

if [ -z "$a" ]; then
	echo "\$a ES NULO"
fi

if [ -n "$a" ]; then
	echo "\$a NO ES NULO"
fi


echo ""
echo ""
echo "-------------------------------------------------------"
echo "-----------3 . Comparaciones sobre Ficheros-------------------"
echo "-------------------------------------------------------"
echo ""

#!/bin/bash
#$fichero="~/demo.txt"
$fichero="./demo.txt"

if [ -e "$fichero" ]; then
	echo "\$fichero EXISTE"
fi

if [ -f "$fichero" ]; then
	echo "\$fichero es un fichero REGULAR"
fi

if [ -s "$fichero" ]; then
	echo "\$fichero NO TIENE TAMAÑO CERO"
fi

if [ -d "$fichero" ]; then
	echo "\$fichero es un DIRECTORIO"
fi

if [ -b "$fichero" ]; then
	echo "\$fichero es un DISPOSITIVO DE BLOQUES"
fi
