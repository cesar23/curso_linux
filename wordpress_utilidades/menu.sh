title=" -------- Sistema de Utilidades ----------"
prompt="Escoga una opcion:"
options=("A" "B" "C" "D")

echo "$title"
PS3="$prompt "
select opt in "${options[@]}" "Quit"; do
    case "$REPLY" in
    1) echo "You picked $opt which is option 1" ;;
    2) echo "You picked $opt which is option 2";;
    3) echo "You picked $opt which is option 3";;
    4) echo "You picked $opt which is option 3";;
    # si se escogio la ultima opcion
    $((${#options[@]}+1))) echo "Goodbye!"; break;;
    # si eligio una opcion invalida
    *) echo "Opcion invalida.";continue;;
    esac
done
