#fuente : https://www.aradaen.com/sysadmin/tips-y-trucos/comando-source-evitando-la-creacion-de-subprocesos-en-bash/
#video : https://www.youtube.com/watch?v=ZIqRmp-XBRY



#------------------------------------------------------------
#--------------------- 1 paso ---------------------------------------
#------------------------------------------------------------

#::: ejecutar desde la  consola

#       [usr@srv]: echo "Mi id de processo es :" $$
#       Mi id de processo es : 4455   <------------------- OJO

#::: ahora si ejecutanmos desde consola

#       [usr@srv]: ./comando_source_2.sh
#       [usr@srv]:Mi id de processo es : 6789


#------------------------------------------------------------
#--------------------- 2 paso ---------------------------------------
#------------------------------------------------------------

#       :: al realizar esto corremos en el mismo pid de proceso actual
#       [usr@srv]: source ./comando_source_2.sh
#       [usr@srv]:Mi id de processo es : 4455    <------------------- OJO

#       [usr@srv]:  echo "Mi id de processo es :" $$
#       Mi id de processo es : 4455    <------------------- OJO



echo "Mi id de processo es :" $$
#fuente : http://edgardomarti.blogspot.com/2015/04/para-que-sirve-el-comando-source.html
