

function htmlUpdatePrecios(soles,dolar){

  
    dolar=dolar.replace('$', '').replace(',','');
    soles=soles.replace('S/.', '').replace(',','');
    //-----------------------------------------------
    //----------------------dolar--------------------
    //-----------------------------------------------

    //-- start aplicar aumento de precio  mas el 5%
    var dolar_add_porcentaje = parseFloat(dolar);
    dolar_add_porcentaje = dolar_add_porcentaje + (dolar_add_porcentaje * 0.05);

    //aplicar formato para  su visualizacion
    dolar_add_porcentaje = number_format_js(dolar_add_porcentaje, 2);
    dolar = number_format_js(dolar, 2);
    //-----------------------------------------------
    //----------------------soles--------------------
    //-----------------------------------------------

     //-- start aplicar aumento de precio  mas el 5%
     var soles_add_porcentaje = parseFloat(soles);
     soles_add_porcentaje = soles_add_porcentaje + (soles_add_porcentaje * 0.05);
 
     //aplicar formato para  su visualizacion
     soles_add_porcentaje = number_format_js(soles_add_porcentaje, 2);
     soles = number_format_js(soles, 2);


    dolar=humanizeNumber(dolar);
    dolar_add_porcentaje=humanizeNumber(dolar_add_porcentaje);
    
    soles=humanizeNumber(soles);
    soles_add_porcentaje=humanizeNumber(soles_add_porcentaje);

    var html =`
            <div class="tabla_monedas">
                <ul class="tabla_monedas_list">
                    <li class="moneda_dolares_m">$ ${dolar_add_porcentaje}</li>
                    <li class="li_space_x2"> </li>
                    <li class="moneda_soles_m">S/ ${soles_add_porcentaje}</li>
                </ul>
                <div class="tabla_monedas_info">
                    5% adicional pagando con T. Debito/Credito
                </div>

                <div class="tdesp"></div>
                <ul class="tabla_monedas_list">
                    <li class="moneda_dolares_l">$ ${dolar}</li>
                    <li class="li_space_x2"> </li>
                    <li class="moneda_soles_l">S/ ${soles}</li>
                </ul>
                <div class="tabla_monedas_info">
                    Ahorre Pagando Efectivo, Transferencia, Deposito Bancario
                </div>
            </div>
    `;
return html;
}


function changeMountStyleListProduct() {

if (document.querySelector('.woocs_price_info_list')) {

    document.querySelectorAll(".woocs_price_info").forEach(element => {
        

        //var data = element.getAttribute("data-id");

        //let elemnto_amount=element.querySelector('.woocs_price_info_list');
        let monto = element.querySelector('.woocs_price_info_list li .woocs_amount').textContent;

        element.innerHTML = `<span class="woocommerce-Price-amount amount">
                            <span class="woocommerce-Price-currencySymbol"
                >${monto}</span></span>`;


    });



}


}




function changeMountStyleProduct() {
var productPrices=document.querySelector('.price-wrapper');
priceDolar=productPrices.querySelector('.price.product-page-price>.woocs_price_code>span').textContent;
priceSoles=productPrices.querySelector('.woocs_price_info>.woocs_price_info_list>li>span.woocs_amount').textContent;

var htmlnewPrecios=htmlUpdatePrecios(priceSoles,priceDolar);
productPrices.innerHTML=htmlnewPrecios;



//----------- Productos listado
/*
if (document.querySelector('.woocs_price_info li .woocs_amount')) {

    var elemnto_amount = document.querySelector('.woocs_price_info');

    var monto = document.querySelector('.woocs_price_info li .woocs_amount').textContent;
    elemnto_amount.innerHTML = `<span class="woocommerce-Price-amount amount">
        <span class="woocommerce-Price-currencySymbol" style="
font-size: 1.2em;
color: #d84232;
">${monto}`;

} else {
    console.log('nos e  encuentra elemento');
}

*/


//----------- Productos del pie de pagina

if (document.querySelectorAll('.product_list_widget .woocs_price_info')) {

    document.querySelectorAll(".product_list_widget .woocs_price_info").forEach(element => {
       

        //var data = element.getAttribute("data-id");

        //let elemnto_amount=element.querySelector('.woocs_price_info_list');
        let monto = element.querySelector('.woocs_amount').textContent;

        element.innerHTML = `<span class="woocommerce-Price-amount amount">
                            <span class="woocommerce-Price-currencySymbol"
                >${monto}</span></span>`;



    });



}

//-------------- Productos relacionados
if (document.querySelectorAll('.box-text.box-text-products .woocs_price_info')) {

    document.querySelectorAll(".box-text.box-text-products .woocs_price_info").forEach(element => {
      
        //var data = element.getAttribute("data-id");

        //let elemnto_amount=element.querySelector('.woocs_price_info_list');
        let monto = element.querySelector('.woocs_amount').textContent;

        element.innerHTML = `<span class="woocommerce-Price-amount amount">
                            <span class="woocommerce-Price-currencySymbol"
                >${monto}</span></span>`;



    });



}


}




(function() {



// paso 1 esperamos que  acrgue la  pagina
setTimeout(function() {

    // si estamos en la pagina del producto
    if (document.querySelector('.product-main')) {
        changeMountStyleProduct();
        console.log('Mostrar precio al mostrar producto');

    } else {
        // si estamso en el listado de productos
        changeMountStyleListProduct();
        console.log('Mostrar precio al listar producto');
    }



}, 2000);

// Your code here...
})();