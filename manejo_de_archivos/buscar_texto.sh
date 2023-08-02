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

echo ''
echo '--------------- segunda  forma -------------'
echo ''
STR='home/cesar/backups/2023-08-01_22-58-09_name.tar.gz'
SUB='2023-08-01_22-58-09_name.tar.gz'
if [[ "$STR" == *"$SUB"* ]]; then
  echo "It's there."
fi

#[/home/cesar/backups/2023-08-01_22-58-09_name.tar.gz] contiene: [2023-08-01_22-58-09_name.tar.gz]
