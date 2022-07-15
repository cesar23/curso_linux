header="| header | header |\n| ------ | ------ |\n";
for i in *sh; do;
    header+="| ${i} |  |\n";
done;
printf "$header"


echo "------------------ for  simple------------------------"
for i in 1 2 3 4 5; do
   echo $i
done



sleep 4
echo "-----------------For con intervalo-------------------------"


for i in $(seq 0 7); do
  echo $i
done




sleep 10
echo "-----------------For recorriendo array -------------------------"

array=("A" "B" "ElementC" "ElementE")
for element in "${array[@]}"
do
    echo "$element"
done


sleep 10
echo "-----------------For recorriendo array 2 -------------------------"


NAME[0]="Zara"
NAME[1]="Qadir"
NAME[2]="Mahnaz"
NAME[3]="Ayan"
NAME[4]="Daisy"
for e in "${NAME[@]}"
do
    echo "$e"
done
sleep 10
