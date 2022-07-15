ls -d */ | cut -f1 -d'/' > lista.txt

while IFS= read -r line
do
  echo "$line"
done < lista.txt
