#!/bin/bash
# captura  entradas y  salidas
# STDIN = 0, STDOUT= 1 , STDERR = 2

#ls -l /noexiste
ls -l /noexiste 2>/dev/null

# tambien puedo
ls -l /noexiste 2>errores.txt

