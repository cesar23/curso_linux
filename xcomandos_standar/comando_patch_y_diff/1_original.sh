#!/bin/bash

echo "Escribe tu nombre: "
read nombre
echo "Escribe tu edad: "
read edad
if [[ 18 -lt $edad ]]
then
echo "Hola $nombre, tienes $edad ¡Y puedes votar!"
else
echo "Hola $nombre, tienes $edad y no puedes votar..."
fi

echo "Pulsa [Enter Para Terminar]: "
read