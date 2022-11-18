if (typeof $x != 'function') {

    //Aqui creamos una  abreviacion
    // como si fuera la funcion que  usa chrome
    function $x(p, c) {
        var i, r = [], x = document.evaluate(p, c || document, null, XPathResult.UNORDERED_NODE_ITERATOR_TYPE, null);
        while (i = x.iterateNext()) r.push(i);
        return r;
    }
}
//---------------------------------------------------------
//-------------------Para  Abreviamosiones Utiles---------------------------
//---------------------------------------------------------

var getId = function( id ) { return document.getElementById( id ); };
var getQuery = function( element ) { return document.querySelector( element ); };
var getQueryAll = function( element ) { return document.querySelectorAll( element ); };
/*
--uso
* getId('main')
* getQuery('.links')
* getQueryAll('.links')
* */




// create Element
function $ec(type, attributes){
    var node = document.createElement(type);
    for (var attr in attributes) if (attributes.hasOwnProperty(attr)){
        node.setAttribute(attr, attributes[attr]);
    }
    return node;
}
/*
--uso
--creo un elemento enlace con sus atributos
elemento=$ec('a', {"id":'peru'})
* */

// delete Element
function $ed(element) {
    element.parentNode.removeChild(element);
}
// insert element after
function $ea(newNode, node) {
    return node.parentNode.insertBefore(newNode, node.nextSibling);
}
// insert element before
function $eb(newNode, node) {
    return node.parentNode.insertBefore(newNode, node);
}
// make element first child of par
function $ef(newNode, par) {
    return par.insertBefore(newNode, par.firstChild);
}
// make element last child of par
function $el(newNode, par) {
    return par.appendChild(newNode);
}