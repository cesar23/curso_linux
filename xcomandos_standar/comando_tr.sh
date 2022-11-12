fuente: https://www.youtube.com/watch?v=7nFHE_8orUU
#    Traduce su entrada standard sustituyendo cada carácter del primer argumento por el que se encuentra
#     en la misma posición en el segundo argumento, elimina caracteres repetidos.
#
#    Opciones:
#
#    -d Suprime los caracteres asignados en el argumento-l.
#    -s Filtra los caracteres repetidos en la salida por aquellos especificados en el argumento-2, dejando en la salida solo uno de los caracteres repetidos.
#    -c Sustituye en la salida todos los caracteres excepto los indicados en el argumento por los especificados en el argumento2. (Argumento2 debe ser un solo carácter).
#




#----------------------------------------------------------------
#Formar cadenas:
#    NNN NNN valor del carácter en octal (1 a 3 dígitos en octal).
#    a Alarma
#    b Retroceso
#    f Pasa a la siguiente línea en la misma columna que se encuentra
#    n nueva línea
#    r Ir al principio de la línea
#    t Tabulación horizontal
#    v Tabulación vertical
#    CAR1-CAR2 Todos los caracteres desde CAR1 a CAR2 en orden ascendente
#    [CAR1-CAR2] Igual a CAR1-CAR2, preferible utilizar este
#    [CAR*] En cadena2, copia el CAR hasta la longitud de cadena1
#    [:alnum:] Todas las letras y dígitos
#    [:alpha:] Todas las letras
#    [:blank:] Todos los espacios en blanco
#    [:cntrl:] Todos los caracteres de control
#    [:digit:] Todos los dígitos
#    [:graph:] Todo carácter imprimible no incluido el espacio
#    [:lower:] Todas las letras minúsculas. Sólo se puede utilizar con -d
#    [:print:] Todo carácter imprimible, incluido el espacio
#    [:punct:]Todo símbolo de puntuación
#    [:space:] Todo espacio en blanco horizontal o vertical
#    [:upper:] Toda las letras mayúsculas. Sólo se puede utilizar con -d
#    [:xdigit:] Todo dígito hexadecimal
#    [=CAR=] Todo carácter que sea equivalente a CAR


#--ejemplos:
# -------1. reemplazar 1 por 2
> echo "Hola mundo 11 22 33 11 22 33" |tr "1" "2"
      #Hola mundo 22 22 33 22 22 33

# -------2.  reemplazar espacios en blanco por   comas
> tr " " "," <empresas.txt> empresas_salida.txt

#----------------------------------------------------------------------------------------

#:: letras.txt
#  Hola  como estas abc xyz
#
#  aaa bbb cc  yyy  cc {+ perú Á COMó Esta uuu xxx ccc
#  vvv
#  zzzzz ccccc aaaa
#
#  abc  xyz



# -------3.  OJO reemplazara  la  a =>x , b=>y , c=>z
# ahora  solo  lo  mostramos  en pantalla
> tr "abc" "xyz" < letras.txt


#    Holx  zomo estxs xyz xyz
#
#    xxx yyy zz  yyy  zz  uuu xxx zzz
#    vvv
#    zzzzz zzzzz xxxx
#
#    xyz  xyz




# -------4.  OJO reemplazara  la  a =>z , b=>z , c=>z
# ahora  solo  lo  mostramos  en pantalla
> tr "abc" "x" < letras.txt
#  Holx  xomo estxs xxx xyz
#
#  xxx xxx xx  yyy  xx  uuu xxx xxx
#  vvv
#  zzzzz xxxxx xxxx
#
#  xxx  xyz


# -------5.  Reemplazar  minusculas por  mayusculas
# ahora  solo  lo  mostramos  en pantalla
> tr "a-z" "A-Z" < letras.txt
> tr [:lower:] [:upper:] < letras.txt

#  HOLA  COMO ESTAS ABC XYZ
#
#  AAA BBB CC  YYY  CC  UUU XXX CCC
#  VVV
#  ZZZZZ CCCCC AAAA
#
#  ABC  XYZ


# -------6.  Reemplazar borrar numero
# -d borrar
> tr -d "0-9" < letras.txt



# -------7. solo dejar Letras y lo demas  borrar hasta  los  espacios
# -c  -d => omitir y eliminar  todo los  demas
> tr -c -d "a-z A-Z" < letras.txt



# -------8. borra  todos los  escpacios en blanco
# -c  -d => omitir y eliminar  todo los  demas
> tr -s [:blank:] < letras.txt


#------------------Otros ejemplos
#Suprimir la repetición de espacios en blanco:

>$ echo "Hola     que    tal   " | tr -s [:space:]



#Dejar sólo los caractéres numéricos:
$ echo "El día 14 cumpliré 23 años" | tr -cd [:digit:]


#Sustituir los espacios en blanco por tabuladores:
$ echo "Hola Mundo Hola Mundo" | tr [:space:] '\t'




#Quitar  todos los  espacios en blanco:
cat  letras.txt | tr -d ' ' > nuevo archivo.txt


#7. La opción -c le dice a tr que use el complemento en el SET
# . En este ejemplo, queremos eliminar todas las letras y solo dejar el UID .

$ echo "My UID is $UID" | tr -cd "[:digit:]\n"
OR
$ echo "My UID is $UID" | tr -d "a-zA-Z"


#dvidir cada  espacion en una  linea
echo "My UID is $UID" | tr " "  "\n"

