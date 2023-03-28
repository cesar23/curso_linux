# ------------------------------------
# Docker alias and function
# ------------------------------------

# Get container process
alias dps="docker ps"
# obtiene otos
alias dpsa="docker ps -a"

# obtiene las imagenes
alias di="docker images"


# obtine el ultimo id del contendor creado
function d_GetlatestContainerID {
    echo "obtine el ultimo id del contendor creado"
    sleep 1
    # ----------------------------
    docker ps -l -q
}



# Get container IP
function d_GetContainerIP {
    echo "Se obtiene el ip del contenedor :como parametro"
    sleep 4
    # ----------------------------
    id=$1
    docker inspect --format '{{ .NetworkSettings.IPAddress }}' $id
}

# Ingresar contendor contenedor interacctivamenete
function d_ContainerInteractive {
    echo "Ingresar contenedor interacto :parametro en nombre del contenedor"
    sleep 4
    # ----------------------------
    $name=$1
    docker exec  -ti $name bash
    # como root
    #    docker exec -u root -ti $id bash

}

function d_RunContainerInteractive {
    echo "Correr Crear contenedor interacctivamenete :como parametro"
    sleep 4
    # ----------------------------
    id=$1
    docker run -i -t -P $id
}



#  Parar y Remover Todos los Contendores Activos o ejecuccion
function d_StopRemoveContainers {
    echo "Se removera los contenedores que estas prendidos"
    sleep 4
    # ----------------------------
    docker stop $(docker ps -q) && docker rm $(docker ps -q)
}

# remover  todos los  contendores (Acctivos y no activo)
function d_StopRemoveAllContainers {
    echo "Se removera los contenedores Todos apagados y prendidos"
    sleep 4
    # ----------------------------
    docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
}

# obtine el ultimo id del contendor creado
function d_StopRemoveCurrentContainer {
    echo "obtiene el ultimo id del contendor creado"
    echo ""
    sleep 1
    # ----------------------------
    id=$(docker ps -l -q)
    name=$(docker ps -l -q  --format '{{.Names}}')
    echo "Id contenedor: ${id}"
    echo "Name contenedor: ${name}"
    sleep 3
    docker stop $id && docker rm $id
    
}

# obtine el ultimo id del contendor creado
function d_RemoveContainer {
    echo "Listado contenedores"
    docker ps -a
    echo ""
    read -p "Ingresa el id del contenedor eliminar: " id
    docker stop $id && docker rm $id
}


function d_RemoveAllImages {
    echo "Se las imagenes que no estan usadas"
    sleep 4
    # ----------------------------
    docker rmi $(docker images -q)
}

