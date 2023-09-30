# . =buscar en el directorio actual
# -size por tamaño
# +2097152c = mayor a 2 megas
# exec= ejecutar comando ls paar  listar
find . -size +2M -exec ls -lah {} \;
#find . -size +3G -exec ls -l {} \; # mayor a 3GB



#buscar  archivos  mayores a 2 mb y menores a 10 mb y los imprima
find . -size +2M -size -10M -print

#(busca archivos mayores a 15 megas del tipo jpg)
find /var/log -size +15000k -name "*.jpg" 


find . -type f -name "*.js" -exec grep -i 'jQuery=Jt' {} + ;
#buscar texto en los  archivos
 find /var/www/geosupply.com.pe/public_html  -type f -name "*.php" -exec grep -i 'jvarela@geosupply.com.pe' {} + ;
 find /var/www/geosupply.com.pe/public_html  -type f -name "*.php" -exec grep -i 'alertachinalco@geosupply.com.pe' {} + ;


 find /var/www/geosupply.com.pe/public_html/ -name "*.php" -exec grep -i 'jvarela@geosupply.com.pe' {} + ;
 find /E/gspmarinov1-master/application/views/ -name "*.php" -exec grep -i '1111' {} && sed -i  "s/1111/2222/g" + {} ;

 find /G/ -name *.* -exec grep -i 'Win10_SpanishMexico__x84_x64' {} \;


#buscar archivo  en una  carpeta y reemplazar su contenido con sed
find /E/bcit-ci-CodeIgniter-b73eb19/ -name "*.php" -exec sed -i "s/CI_Controller/CI_CesarController/g" {} \;
find /E/gspmarinov1-master/application/views/ -name "*.php" -exec sed -i  "s/PHP/PHPCESAR/g" >/E/gspmarinov1-master/corregidos.txt {} \;


find /c/laragon/www/geoweb/ -name fuente.sql -exec sed -i "s/https:\/\/www.geosupply.com.pe\//http:\/\/geosupply.test\//g" {} \;


#buscar en el directorio actual y eliminar los archivos sh 
find . -name "*.sh" -exec rm {} \;
find . -name "*.rar" -exec  rm -f {} \;

#bus los rachivos temporales y los  eli mia
find /tmp -size +1024k -exec rm -f {} \;


#buscar archivos que mas de 80 dias y con un  peso   de 10 M los liste
find . -mtime +80 -size +2M -exec ls -lah {} \;

# find /c/Users/Cesar/Desktop/temp/mail/mail -mtime +30 -exec ls -lah {}

#busca los enlaces symbolicos con de type l  y los muestre
find . -type l -print | xargs ls -ld

#lo mismo de arriba pero(que no dee errores cuando la carpeta o archivo tiene espacios
# en blanco en el nombre))
find . -type l -print0 | xargs -0 ls -ld



#buscar  virus en servidor
find /home/kpopilrp/inversionesletich.com/ -type f -name *.php -exec grep -i 'No direct script access' {} + ;
find /home/kpopilrp/inversionesletich.com/ -type f -name *.php -exec grep -i 'Access from your IP address' {} + ;

du -sh /home/kpopilrp/inversionesluper.com/public_html/wp-content/themes/flatsome
du -sh /home/kpopilrp/vitafitperu.com/wp-content/themes/flatsome

ln -s /home/kpopilrp/inversionesluper.com/public_html/wp-content/themes/flatsome /home/kpopilrp/vitafitperu.com/wp-content/themes/flatsome


find /c/Users/Cesar/Desktop/temp/mail/mail/cur -mtime +15  -exec  rm -rf   {} \;

tar -cf archiv.tar --exclude="/c/Users/Cesar/Desktop/temp/mail/mail/cur/salida" /c/Users/Cesar/Desktop/temp/mail/mail/cur

FECHA_HORA=$(date +'%Y-%m-%d_%H-%M-%S')
tar -czvf "/home/kpopilrp/mail/mibackup${FECHA_HORA}.tar.gz" '/home/kpopilrp/mail/corporacionpacifico.com.pe' --exclude='*mp3' --exclude='*mp4' --exclude='*avi'
