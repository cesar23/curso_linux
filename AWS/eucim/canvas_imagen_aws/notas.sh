# entrar al server

 #---------------------------------------------------
 server: ssh root@192.168.0.75
 password: eucim2020

# inicar servicios de nginx
systemctl start nginx
systemctl stop nginx
systemctl restart nginx
systemctl status nginx

# inicar servicios de canvas
systemctl start canvas.service
systemctl stop canvas.service
systemctl restart canvas.service
systemctl status canvas.service


# ruta del canvas
/srv/canvas/current

# -------------------------------------------------------------------------
# --- ruta donde estan las configuraciones del canvas---------------
# -------------------------------------------------------------------------

/srv/canvas/current/config/

# ---------------- script que  arregla la configuracion

systemctl start restorecanvas.service
systemctl stop restorecanvas.service
systemctl restart restorecanvas.service
