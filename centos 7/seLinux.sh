fuente: https://francisconi.org/linux/comandos/setsebool
fuente: https://www.youtube.com/watch?v=DHORwN7TiH0
---------------------------------------------------------------
------------- Aplicar contexto SELinux --------------------
---------------------------------------------------------------

#.1 Veamos el contexto predeterminado de SELinux:
sestatus -v
#-- modo seLinux enforcing 0
setenforce 1 #enforcing
setenforce 0  #premisivo
#editar selinux 
vi /etc/selinux/config

#verificar si hay errores de linux si los  hay
#less /var/log/messages



#.1 Veamos el contexto predeterminado de SELinux:
sestatus -v
#-- modo seLinux enforcing 0
setenforce 1 #enforcing
setenforce 0  #premisivo
#editar selinux 
vi /etc/selinux/config

#verificar si hay errores de linux si los  hay
#less /var/log/messages





# En preparación para configurar /samba como un recurso compartido de Samba, 
# tendremos que desactivar SELinux o establecer los valores de contexto 
# booleanos y de seguridad adecuados de la siguiente manera 
# (de lo contrario, SELinux evitará que los clientes accedan al recurso compartido):

setsebool -P smbd_anon_write=1
setsebool -P samba_export_all_ro=1 samba_export_all_rw=1
getsebool -a | grep samba_export

#permitir a las carpetas en se linux la escritura
semanage fcontext -a-t samba_share_t "/samba/josh(/.*)?"
semanage fcontext -at samba_share_t "/samba/public(/.*)?"
restorecon /samba/public
restorecon /samba/josh
restorecon -Rv /samba/*
