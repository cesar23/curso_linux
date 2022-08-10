# Eliminación local de Kaspersky Endpoint Security

Mientras se elimina la aplicación, se detendrán todas las tareas de Kaspersky Endpoint Security.

Para desinstalar Kaspersky Endpoint Security que se instaló desde un paquete RPM, ejecute el siguiente comando:

```shell
 rpm -e kesl
```

Para desinstalar Kaspersky Endpoint Security que se instaló desde un paquete DEB, ejecute el siguiente comando:

```shell
 dpkg -r kesl
```

Para desinstalar Kaspersky Endpoint Security que se instaló en el sistema operativo Astra Linux Special Edition desde un paquete DEB, ejecute el siguiente comando:

```shell
 dpkg –r kesl-astra
```

Para eliminar el Agente de red que se instaló desde un paquete RPM en un sistema operativo de 32 bits, ejecute el siguiente comando:

```shell
 rpm -e klnagent
```

Para eliminar el Agente de red que se instaló desde un paquete RPM en un sistema operativo de 64 bits, ejecute el siguiente comando:

```shell
 rpm -e klnagent64
```

Para eliminar el Agente de red que se instaló desde un paquete DEB en un sistema operativo de 32 bits, ejecute el siguiente comando:

```shell
 dpkg -r klnagent
```

Para eliminar el Agente de red que se instaló desde un paquete DEB en un sistema operativo de 64 bits, ejecute el siguiente comando:

```shell
 dpkg -r klnagent64
```

# Eliminar residuos
aqui hay residuos `/var/opt/kaspersky/klnagent`

```shell
rm -rf /var/opt/kaspersky
```