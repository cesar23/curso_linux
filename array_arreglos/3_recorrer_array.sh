#! /bin/bash
echo "---------- recorrer 1 ------------"

Unix[0]='Debian'
Unix[1]='Red hat'
Unix[2]='Ubuntu'
Unix[3]='Suse'
for t in ${Unix[@]}
do
echo $t
done
echo "---------- recorrer 2 ------------"


declare -a Lenguajes=('JAVA' 'PHP' 'PYTHON' 'C++' 'JACVASCRITP');

for t in ${Lenguajes[@]}
do
echo $t
done