#!/bin/sh


echo ""
echo "----------------------- ejemplo 1"
echo ""
a=10
b=20

if [ $a == $b ]
then
   echo "a is equal to b"
else
   echo "a is not equal to b"
fi
# -----------------------------------------------------------
echo ""
echo "----------------------- ejemplo 2"
echo ""
param_1="uno"
param_2="uno"

if [ $param_1 == $param_2 ]
then
   echo "param_1 is equal to param_2"
else
   echo "param_1 a is not equal to param_2"
fi


# -----------------------------------------------------------
echo ""
echo "----------------------- ejemplo 3"
echo ""
a=10
if [[ $VAR -gt 10 ]]
then
  echo "es  mayor que 10."
else
  echo "es  menor que 10."
fi


# -----------------------------------------------------------
echo ""
echo "----------------------- ejemplo 3"
echo ""
echo " comprueba si existe la variable \$h si no existe asigna valor"
echo ""
#h=2

# Opcion1 : forma larga
#if [ -z ${h} ]; then echo "h is unset"; else echo "h is set to '$h'"; fi

# Opcion1 : forma corta
[ -z $h ] && h=10
echo "valor de \$h es $h "
[ -z $h ] && h=15
echo "valor de \$h es $h "



# -----------------------------------------------------------
echo ""
echo "----------------------- ejemplo 4"
echo ""
echo " comprobar si una variable esta vacia"
echo ""
echo "- (-z) verificar si la variable está vacía en Bash \`No considera los espacio \`"
echo "- (-n) verificar si la variable está vacía en Bash \`SI considera los espacio \`"
printf "\n\n"
#h=2

greet='cesa'

# if [ -n "$greet" ] #:::: verifica con un trim y verifica si esta  vacia
# if [ -z "$greet" ] #:::: No verifica con un trim y verifica si esta  vacia
if [ -n "$greet" ]
then
    echo "\$greet is empty"
else
    echo "\$greet is not empty"
fi
