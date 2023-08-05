// :::: <file: func.cesar.numbers.js >
 function isInt(value){return!isNaN(value)&&parseInt(Number(value))==value&&!isNaN(parseInt(value,10))}function convertInt(value){return isInt(value)?parseInt(value):""}function humanizeNumber(n){n=n.toString();while(true){var n2=n.replace(/(\d)(\d{3})($|,|\.)/g,"$1,$2$3");if(n==n2)break;n=n2}return n}function removeNullString(value){return value==null?"":value}function number_format_js(number,decimals,dec_point,thousands_point){if(typeof number==="number"){}else if(typeof number==="string"){number=number.replace(",","")}else if(typeof number==="object"){throw new TypeError("es object invalido")}if(number==null||!isFinite(number)){throw new TypeError("number is not valid")}if(!decimals){var len=number.toString().split(".").length;decimals=len>1?len:0}if(!dec_point){dec_point="."}if(!thousands_point){thousands_point=","}number=parseFloat(number).toFixed(decimals);number=number.replace(".",dec_point);var splitNum=number.split(dec_point);splitNum[0]=splitNum[0].replace(/\B(?=(\d{3})+(?!\d))/g,thousands_point);number=splitNum.join(dec_point);return number}function parseFloatDecimal(numero,decimales){soles_add_porcentaje=parseFloat(numero).toFixed(decimales);soles_add_porcentaje=parseFloat(soles_add_porcentaje);return soles_add_porcentaje}
// :::: <file: front-end.js >
 function htmlUpdatePrecios(soles,dolar){dolar=dolar.replace("$","").replace(",","");soles=soles.replace("S/.","").replace(",","");var dolar_add_porcentaje=parseFloat(dolar);dolar_add_porcentaje=dolar_add_porcentaje+dolar_add_porcentaje*.05;dolar_add_porcentaje=number_format_js(dolar_add_porcentaje,2);dolar=number_format_js(dolar,2);var soles_add_porcentaje=parseFloat(soles);soles_add_porcentaje=soles_add_porcentaje+soles_add_porcentaje*.05;soles_add_porcentaje=number_format_js(soles_add_porcentaje,2);soles=number_format_js(soles,2);dolar=humanizeNumber(dolar);dolar_add_porcentaje=humanizeNumber(dolar_add_porcentaje);soles=humanizeNumber(soles);soles_add_porcentaje=humanizeNumber(soles_add_porcentaje);var html=`
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
    `;return html}function changeNameSkuList(){if(document.querySelector(".list-prod-sku")){document.querySelectorAll(".list-prod-sku").forEach(element=>{let sku=element.querySelector("strong");sku.innerText=`CODIGO:`})}}function changeMountStyleListProduct(){if(document.querySelector(".woocs_price_info_list")){document.querySelectorAll(".woocs_price_info").forEach(element=>{let monto=element.querySelector(".woocs_price_info_list li .woocs_amount").textContent;element.innerHTML=`<span class="woocommerce-Price-amount amount">
                            <span class="woocommerce-Price-currencySymbol"
                >${monto}</span></span>`})}}function changeMountStyleProduct(){var productPrices=document.querySelector(".price-wrapper");var priceDolar=productPrices.querySelector(".price.product-page-price>.woocs_price_code>span");var priceSoles=productPrices.querySelector(".woocs_price_info>.woocs_price_info_list>li>span.woocs_amount");if(!priceDolar||!priceSoles){return false}priceDolar=priceDolar.textContent;priceSoles=priceSoles.textContent;var htmlnewPrecios=htmlUpdatePrecios(priceSoles,priceDolar);productPrices.innerHTML=htmlnewPrecios;if(document.querySelectorAll(".product_list_widget .woocs_price_info")){document.querySelectorAll(".product_list_widget .woocs_price_info").forEach(element=>{let monto=element.querySelector(".woocs_amount").textContent;element.innerHTML=`<span class="woocommerce-Price-amount amount">
                            <span class="woocommerce-Price-currencySymbol"
                >${monto}</span></span>`})}if(document.querySelectorAll(".box-text.box-text-products .woocs_price_info")){document.querySelectorAll(".box-text.box-text-products .woocs_price_info").forEach(element=>{let monto=element.querySelector(".woocs_amount").textContent;element.innerHTML=`<span class="woocommerce-Price-amount amount">
                            <span class="woocommerce-Price-currencySymbol"
                >${monto}</span></span>`})}}function ocultarBotonCompra(){if(document.getElementById("consultar_producto")){document.querySelectorAll(".cart").forEach(element=>{element.style.display="none"})}}(function(){setTimeout(function(){ocultarBotonCompra();if(document.querySelector(".product-main")){changeMountStyleProduct();console.log("Mostrar precio al mostrar producto")}else{changeMountStyleListProduct();changeNameSkuList();console.log("Mostrar precio al listar producto")}},2e3)})();