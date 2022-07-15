#!/bin/bash

maxEdad=18

echo "Escribe tu nombre: "; read nombre
echo "Escribe tu edad: "; read edad
if [[ $maxEdad -le $edad ]]; then
    echo "Hola $nombre, tienes $edad años ¡Y puedes votar!"
else
    echo "Hola $nombre, tienes $edad años y no puedes votar..."
fi

echo "Pulsa [Enter Para Terminar XD]: "
read
exit 0