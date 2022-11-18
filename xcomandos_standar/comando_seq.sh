#seq --version
        # El comando seq es una herramienta capaz de imprimir una 
        # secuencia de números naturales, 
        # que pueden ser transmitidos a otros scripts o aplicaciones.

# fuente: https://www.sololinux.es/uso-del-comando-seq-con-ejemplos/

echo "-----------------------------------------------"
echo " hasta un numero definido, por ejemplo el 7."
seq 7

echo "-----------------------------------------------"
echo "seq 3 al 8."
seq 3 8

echo "-----------------------------------------------"
echo "seq empieza desde el 5 y suma 3  hasta el 15"
seq 5 3 15


echo "-----------------------------------------------"
echo "reemplazar los saltos de linea por |"
seq -s "|" 12


echo "-----------------------------------------------"
echo "estilo printf con los caracteres E, e, f, G, g, %."
seq -f '##%g##' 1 7

echo "--------otro ejemplo-----"
seq -f %f 1 7



echo "-----------------------------------------------"
echo "Con -w podemos alinear la secuencia numérica agregando ceros"
seq -w 5 12


echo "-----------------------------------------------"
echo "ejemplo con for"
for i in $(seq 4 0.5 8)
do
echo "El numero es $i"
done