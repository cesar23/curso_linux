#https://www.jasoft.org/Blog/post/tutorial-ngrok-como-publicar-en-internet-cualquier-pagina-o-aplicacion-web-que-tengas-en-tu-equipo-local


#------- http con seguridad
ngrok http -auth="usuario:clave" 15666





#--paar  poner en salida una web local
ngrok http -host-header=rewrite cesar.test:80


curl -H "authorization: Bearer 1SUMV0bQWCU8lTXuKvpyF6eIEyO_4g3xTatHJ122Xk4BETrSa" -H "ngrok-version: 2" https://api.ngrok.com/
