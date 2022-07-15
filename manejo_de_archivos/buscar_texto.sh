#!/bin/bash
 
palabra="hola"
buscar="a"
 
 echo $palabra
 var=`echo $palabra | grep $buscar | wc -l`
 
if [ $var -ge 1 ];then
	echo "esta"
else
	echo "NO esta"
fi