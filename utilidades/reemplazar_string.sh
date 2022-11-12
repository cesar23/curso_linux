

replace=peru

variable="comos estan  todos oro aqui"
replace_quoted=$(echo $variable | sed -e "s/oro/\"${replace}\"/g")

echo $replace_quoted
read ff