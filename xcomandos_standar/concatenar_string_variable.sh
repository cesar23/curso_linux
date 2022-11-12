# manejo de varables o string por defecto
animal=cat

echo $animal
  # cat

echo ${#animal}         # String length
  # 3

echo ${animal/at/111}   # Substitution
  # c111


#----------------------------------------------------------------------------------------------
APACHE_DOCUMENT_ROOT="/var/log/apache"
echo ${APACHE_DOCUMENT_ROOT-/var/www/html} # si no encuentra al variable por defecto dara: /var/www/html
  # /var/log/apache

echo ${APACHE_DOCUMENT_ROOT_2-/home/cesar} # aqui lo reemplazara por el defecto

date_directory=`ls `date '+%Y-%m-%d'`` # Makes no sense

#----------------------------------------------------------------------------------------------
