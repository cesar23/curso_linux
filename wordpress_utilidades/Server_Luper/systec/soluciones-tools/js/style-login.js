//Cambiar la url del boton login
document.querySelector('h1 a').setAttribute("href", "https://solucionessystem.com/?link=admin-wp");
// cmabiar  enlaces
docReady(function() {
    BuscarReemplazarEnlaces('wordpress.org','#')
});