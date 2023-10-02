/*
tienda: perustore21.com
version: 1.0.1
 */
function htmlUpdatePrecios(soles, dolar,dolarAnt) {


    dolar = dolar.replace('$', '').replace(',', '');
    soles = soles.replace('S/.', '').replace(',', '');
    if(dolarAnt && dolarAnt!==null){
        dolarAnt = dolarAnt.replace('$', '').replace(',', '');
        dolarAnt = number_format_js(dolarAnt, 2);
        dolarAnt=`<div className="tabla_monedas_info" style="text-decoration: line-through;font-size: 1em;">Precio anterior $${dolarAnt}</div>`
    }else{
        dolarAnt=''
    }

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
            ${dolarAnt}
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
            let elementHtml=element.innerHTML

            // ----------------------------------------------------
            // --------- Opcion 1 reemplazo con regex -------------
            // ----------------------------------------------------
            /*
            aqui haremos un regex para remplazar el contenido
            tenemos esto: <strong>SKU:</strong> P127177</div>
            $1=SKU: y $2= P127177
            con esto ya  podemso hacer el remplazo del contenido
             */
            // aqui obtenemos de (<strong>SKU:</strong> P127177) = SKU:  y P127177
            // element.innerHTML=elementHtml.replaceAll(/<strong>([\s\w:]+)<\/strong>+([\s\w]+)/gi, `<strong>Codigo:</strong>$2</div>`)
            // ----------------------------------------------------
            // --------- Opcion 2 reemplazo simple -------------
            // ----------------------------------------------------
            element.innerHTML=`<strong>Comprar</strong> `

        });


    }


}

function changeStockList() {

    if (document.querySelector('.list-prod-stock')) {

        document.querySelectorAll(".list-prod-stock").forEach(element => {
            let elementHtml=element.innerHTML

            // ----------------------------------------------------
            // --------- Opcion 1 reemplazo con regex -------------
            // ----------------------------------------------------
            /*
            aqui haremos un regex para remplazar el contenido
            tenemos esto: <strong>STOCK:</strong> 1</div>
            $1=STOCK: y $2= 1
            con esto ya  podemso hacer el remplazo del contenido
             */
            // aqui obtenemos de (<strong>STOCK:</strong> 1) = STOCK:  y 1
            // element.innerHTML=elementHtml.replaceAll(/<strong>([\s\w:]+)<\/strong>+([\s\w]+)/gi, `<strong>Codigo:</strong>$2</div>`)
            // ----------------------------------------------------
            // --------- Opcion 2 reemplazo simple -------------
            // ----------------------------------------------------
            element.innerHTML=`<strong>Disponible</strong> `

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
    let productPrices = document.querySelector('.price-wrapper');
    let priceDolarAnt=null;
    let priceDolar=null;
    let priceSoles=null;
    // Verificar si Tiene Descuento
    const typePrice= productPrices.querySelector('.price.product-page-price>.woocs_price_code>span') ? 'withoutDiscount' :'withDiscount'
    switch (typePrice) {
        case 'withoutDiscount':
            priceDolar = productPrices.querySelector('.price.product-page-price>.woocs_price_code>span');
            priceSoles = productPrices.querySelector('.woocs_price_info>.woocs_price_info_list>li>span.woocs_amount');
            priceDolar = priceDolar.textContent;
            priceSoles = priceSoles.textContent;
            break;
        case 'withDiscount':
            priceDolarAnt = productPrices.querySelector('.price.product-page-price>.woocs_price_code>del');
            priceDolar = productPrices.querySelector('.price.product-page-price>.woocs_price_code>ins');
            priceSoles = productPrices.querySelector('.woocs_price_info>.woocs_price_info_list>li>span.woocs_amount');
            priceDolar = priceDolar.textContent;
            priceDolarAnt = priceDolarAnt.textContent;
            priceSoles = priceSoles.textContent;
            break;
        default:


    }

    if(!priceDolar || !priceSoles){
        return false;
    }





    let htmlnewPrecios = htmlUpdatePrecios(priceSoles, priceDolar,priceDolarAnt);
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
            changeNameSkuList();
            changeStockList();
            console.log('Pagina Producto');

        } else {
            //------ si estamso en el listado de productos ----------
            // 1.cambiar el icono [informacion del plugin money]
            changeMountStyleListProduct();
            changeNameSkuList();
            changeStockList();
            console.log('Pagina Listados');
        }


    }, 2000);

// Your code here...
})();




