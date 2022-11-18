#!/bin/bash
# captura  entradas y  salidas
# STDIN = 0, STDOUT= 1 , STDERR = 2




#----------------------------Opcion 1-----------------------------------
# Descripcion
  # > /dev/null  : mandara la salida (STDOUT=1) a /dev/null
  # 2>&1         : mandara la salida (STDERR=2) a /dev/null tambien por que  recuerda que 1 es STDOUT

ls -l /noexiste > /dev/null 2>&1

# O
#----------------------------Opcion 2-----------------------------------
# que envia toda (TDIN = 0, STDOUT= 1 , STDERR) /dev/null
#ls -l /noexiste &> /dev/null




#ls -l /noexiste > salida.txt 2> errores.txt

#fuente: https://www.youtube.com/watch?v=CvuDVlnsASE
