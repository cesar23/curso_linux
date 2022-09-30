

# ejecutar segundo plano
```shell
python3 backup_completo.py > salida.out 2>&1 &

# ver el proceso que se  ejecuta en segundo plano
ps axjf| grep  backup_completo.py

# matar procesos
sudo kill -9  PID

```