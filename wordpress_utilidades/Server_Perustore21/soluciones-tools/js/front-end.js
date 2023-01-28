/*
tienda: perustore21.com
version: 1.0.1
 */
function htmlUpdatePrecios(soles, dolar) {


    dolar = dolar.replace('$', '').replace(',', '');
    soles = soles.replace('S/.', '').replace(',', '');
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


    dolar = humanizeNumber(dolar);
    dolar_add_porcentaje = humanizeNumber(dolar_add_porcentaje);

    soles = humanizeNumber(soles);
    soles_add_porcentaje = humanizeNumber(soles_add_porcentaje);

    var html = `
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

function changeNameSkuList() {

    if (document.querySelector('.list-prod-sku')) {

        document.querySelectorAll(".list-prod-sku").forEach(element => {


            //var data = element.getAttribute("data-id");

            //let elemnto_amount=element.querySelector('.woocs_price_info_list');
            let sku = element.querySelector('strong')

            sku.innerText = `CODIGO:`;


        });


    }


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
    var productPrices = document.querySelector('.price-wrapper');
    var priceDolar = productPrices.querySelector('.price.product-page-price>.woocs_price_code>span');
    var priceSoles = productPrices.querySelector('.woocs_price_info>.woocs_price_info_list>li>span.woocs_amount');
    if(!priceDolar || !priceSoles){
        return false;
    }

    priceDolar = priceDolar.textContent;
    priceSoles = priceSoles.textContent;



    var htmlnewPrecios = htmlUpdatePrecios(priceSoles, priceDolar);
    productPrices.innerHTML = htmlnewPrecios;





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

function ocultarBotonCompra() {
    if (document.getElementById('consultar_producto')) {
        document.querySelectorAll(".cart").forEach(element => {
            element.style.display = "none";
        });
    }
}


(function () {


// paso 1 esperamos que  acrgue la  pagina
    setTimeout(function () {
        ocultarBotonCompra();

        // si estamos en la pagina del producto
        if (document.querySelector('.product-main')) {
            changeMountStyleProduct();
            console.log('Mostrar precio al mostrar producto');

        } else {
            // si estamso en el listado de productos
            changeMountStyleListProduct();
            changeNameSkuList();
            console.log('Mostrar precio al listar producto');
        }


    }, 2000);

// Your code here...
})();




