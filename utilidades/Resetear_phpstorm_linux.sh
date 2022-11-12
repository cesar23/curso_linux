rm -rf ~/.java/.userPrefs/prefs.xml
rm -rf ~/.java/.userPrefs/jetbrains/prefs.xml
rm -rf ~/.java/.userPrefs/jetbrains/rider/
rm -rf ~/.config/JetBrains/Rider*/eval/
rm -rf ~/.config/JetBrains/Rider*/options/other.xml

#-------Opcional , abajo lo puse
#rm -rf ~/.config/JetBrains/PhpStorm2020.2/eval/
#rm -rf ~/.config/JetBrains/PhpStorm2020.2/options/other.xml

PRODUCTO='PhpStorm2020.2' #/root/.config/JetBrains/PhpStorm2020.2/
rm -rf ~/.config/JetBrains/$PRODUCTO/eval
rm -rf  ~/.config/JetBrains/$PRODUCTO/options/other.xml
rm -rf ~/.config/JetBrains/$PRODUCTO/eval/
rm -rf ~/.config/JetBrains/$PRODUCTO/options/other.xml

rm -rf ~/.local/share/JetBrains/$PRODUCTO
rm -rf ~/.cache/JetBrains/$PRODUCTO


#
# por  ultimo si no funciona Eliminar las  carpetas
# ~/.config/JetBrains/
# ~/.java/.userPrefs/jetbrains/
#

#---------------------Recorre  dirctorio y eliminar  el directorio que  es: #$@#%#$%#$%#$%#$%
array_dir_exclude=("phpstorm" "jetprofile","syncsettings")

PATH_DIR=~/.java/.userPrefs/jetbrains/
cd $PATH_DIR

# ahora listamos | y  quitamos las barra /  con sed
for i in `ls  | sed 's/\///'`; do
        # si es  directorio entra  aqui
        if [ -d $i ]; then
                # si es un director que no hay  que  eliminar entrar  aqui
                if [[ " ${array_dir_exclude[@]} " =~ " ${i} " ]]; then
                   echo "No se elimino ${i}"
                else
                   echo "Si se elimino >>>>> ${i}"
                   rm -rf $i
                fi

        fi
done

read -p "Presionar [Enter]:" name