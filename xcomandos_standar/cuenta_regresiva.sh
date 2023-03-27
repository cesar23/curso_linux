#!/bin/bash
# valor por defecto
name="gitup"
read -e -i "$name" -p "Please enter your name: " input
name="${input:-$name}"
echo "valor:${name}"
