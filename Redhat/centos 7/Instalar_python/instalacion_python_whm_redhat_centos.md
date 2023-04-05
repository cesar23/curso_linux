# instalacion python redhat - Centos
 fuente :
 https://my.hostmonster.com/hosting/help/python-install


```shell
mkdir ~/python

cd ~/python

wget http://www.python.org/ftp/python/3.9.2/Python-3.9.2.tgz

tar zxfv Python-3.9.2.tgz

find ~/python -type d | xargs chmod 0755

cd Python-3.9.2
```
## PYTHON INSTALLATION
Once extracted, you can use the following commands to configure and install Python.

```shell
./configure --prefix=$HOME/python

make

make install
```

## MODIFY THE .BASHRC
Para que se cargue su versión local de python, deberá agregarla al archivo .bashrc.
```shell
vim ~/.bashrc
```

presionar i

ingresar:
```shell
export PATH=$HOME/python/Python-3.9.2/:$PATH
```

Write the changes (press ESC) and close vim:
```shell
:wq
```
Press Enter
```shell
source ~/.bashrc
```

## CONFIGURATION ERROR
```shell
configure: error: in `/home2/tomstec2/Python_3.9.2/Python-3.9.2':
configure: error: no acceptable C compiler found in $PATH
See `config.log' for more details
```

## comprobar version ahora
```shell
python --version
#  Python 3.9.2

```