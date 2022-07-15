fuentes:
 ttps://itsfoss.com/could-not-get-lock-error/
https://www.youtube.com/watch?v=7g9cD69XRf8




# 1 . Ver si hay  problemas de dependencias
apt check

# 2 si hay problemas de bloqueo de instalacion como el siguiente  mensaje
        # : Could not open lock file /var/lib/dpkg/lock-frontend - open (13: Permission denied)
        # E: Unable to acquire the dpkg frontend lock (/var/lib/dpkg/lock-frontend), are you root?



# ver  los procesos
sudo lsof /var/lib/dpkg/lock
sudo lsof /var/lib/apt/lists/lock
sudo lsof /var/cache/apt/archives/lock

    # si hay  un procesos  eliminarlo con 
    sudo kill -9 <process_id>

# eliminar  todos  los  bloqueos
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock
    # Después de eso, reconfigure los paquetes:

    sudo dpkg --configure -a