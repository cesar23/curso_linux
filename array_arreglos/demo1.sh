#! /bin/bash 
# To declare static Array  
arr=(prakhar ankit 1 rishabh manish abhinav) 
  
# Para imprimir todos los elementos
#[@] y [*]medios Todos los elementos de la matriz.
sleep 5 && echo "-----------------Para imprimir todos los elementos"
echo ${arr[@]}        # prakhar ankit 1 rishabh manish abhinav 
echo ${arr[*]}        # prakhar ankit 1 rishabh manish abhinav 

echo ${arr[@]:0}    # prakhar ankit 1 rishabh manish abhinav 
echo ${arr[*]:0}    # prakhar ankit 1 rishabh manish abhinav 
  




# Para imprimir el primer elemento
sleep 5 && echo "-----------------Para imprimir el primer elemento"
echo ${arr[0]}        # prakhar 
echo ${arr}            # prakhar 
  

# To print particular element 
sleep 5 && echo "-----------------imprimir  elemento en particular "
echo ${arr[3]}        # rishabh 
echo ${arr[1]}        # ankit 
  
# Para imprimir elementos de un índice particular
#--- esto imprimira a partir desde un indicie inicial
sleep 5 && echo "-----------------Para imprimir elementos de un índice particular "
echo ${arr[@]:0}    # prakhar ankit 1 rishabh manish abhinav 
echo ${arr[@]:1}    # ankit 1 rishabh manish abhinav 
echo ${arr[@]:2}    # 1 rishabh manish abhinav 
echo ${arr[0]:1}    # rakhar 
  



# Para imprimir elementos en rango
sleep 5 && echo "-----------------Para imprimir elementos en rango "
echo ${arr[@]:1:4}    # ankit 1 rishabh manish 
echo ${arr[@]:2:3}    # 1 rishabh manish 
echo ${arr[0]:1:3}    # rak 
  


# Para contar la longitud de la matriz.
sleep 5 && echo "-----------------Para contar la longitud de la matriz "
echo ${#arr[0]}        # 7 
echo ${#arr}        # 7 
  

#  Size of an Array. 
sleep 5 && echo "----------------- Tamaño en un Array "
echo ${#arr[@]}        # 6 
echo ${#arr[*]}        # 6 
  


# Para buscar en la matriz 
sleep 5 && echo "----------------- Para buscar en la matriz "
echo ${arr[@]/*[aA]*/}    # 1 
  


# Para buscar y reemplazar en matriz
        # Buscar y reemplazar no cambia en el valor original del elemento de matriz. 
        # Acaba de devolver el nuevo valor. 
        # Por lo tanto, puede almacenar este valor en la misma o diferente variable.
sleep 5 && echo "----------------- Para buscar y reemplazar en matriz temporal"

echo ${arr[@]//a/A}        # prAkhAr Ankit 1 rishAbh mAnish AbhinAv 
echo ${arr[@]}            # prakhar ankit 1 rishabh manish abhinav 
echo ${arr[0]//r/R}        # pRakhaR 
sleep 200