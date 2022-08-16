# repositorio curso_linux

### descargar por primera vez el repositorio

```shell

# 1. clonamos el repositorio de gitlab
git clone git@gitlab.com:perucaos/curso_linux.git
cd curso_linux 
# 2. agregamos el repositorio de github
git remote add origin2 git@github.com:cesar23/curso_linux.git
# 3. descargar si ahy algun cambio
git push origin master && git push origin2 master
```

### para actualizar repos con los cambios correr

```shell
./gitup.sh
```