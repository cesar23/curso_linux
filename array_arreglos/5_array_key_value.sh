declare -A assArray1
assArray1["D:\www\curso_plugin_theme_wordpress"]="Mango"
assArray1[bird]=Cockatail
assArray1[flower]=Rose
assArray1[animal]=Tiger




for key in "${!assArray1[@]}"; do
  echo "${key} ${assArray1[${key}]}"
done

declare -A assArray2=( ["D:\www\curso_plugin_theme_wordpress"]="master" [HDD]=Samsung [Monitor]=Dell [Keyboard]=A4Tech )

for key in "${!assArray2[@]}"; do
  echo "${key} ${assArray2[${key}]}"
done
