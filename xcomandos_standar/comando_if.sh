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
echo "----------------------- ejemplo 2"
echo ""
a=10
if [[ $VAR -gt 10 ]]
then
  echo "es  mayor que 10."
else
  echo "es  menor que 10."
fi
