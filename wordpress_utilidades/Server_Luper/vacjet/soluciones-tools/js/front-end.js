
jQuery('#audio_web')
   .click(function (event) {       
       event.preventDefault();
       event.stopPropagation();
});

function audioStart(){

document.getElementById('audio_web').play();
jQuery('#btn_audio_start').hide();
jQuery('#btn_audio_stop').show();

}

function audioStop(){
jQuery('#btn_audio_stop').hide();
jQuery('#btn_audio_start').show();
document.getElementById('audio_web').pause();
}


if (document.getElementById("'contenedor_audio")) {
        
    let primeraPromesa = new Promise((resolve, reject) => {
        setTimeout(() => {
                /*        
               jQuery('<iframe id="frame_audio" style="display:none" src="https://inversionesletich.com/assets/audios/silence.mp3" allow="autoplay"></iframe>')
                .appendTo('#contenedor_audio');
                */
                 jQuery('<iframe id="frame_audio" style="display:none" src="https://inversionesletich.com/assets/audios/silence.mp3""></iframe>')
                .appendTo('#contenedor_audio');
    
                document.getElementById('contenedor_audio').insertAdjacentHTML('afterend', '<a id="btn_audio_start" style="display:block" href="#" onclick="audioStart()"><i class="fas fa-play-circle  fa-lg"></i>&nbsp</a><a id="btn_audio_stop" href="# "style="display: none;"  onclick="audioStop()"><i class="fas fa-pause-circle"></i>&nbsp</a>');
    
            
            resolve('Se ejecuto Primera');
            // reject('Salio mal');
        }, 1000);
    });
    
    let segundaPromesa = new Promise((resolve, reject) => {
          let ruta_audio_alert='https://inversionesletich.com/assets/audios/fondo.mp3';
            var ElementMp3 = document.createElement("AUDIO");
            ElementMp3.setAttribute("src", ruta_audio_alert);
            ElementMp3.setAttribute("id", 'audio_web');
            //ElementMp3.setAttribute("loop", true);
            ElementMp3.setAttribute("controls", "controls");
            ElementMp3.style.display = "none";
            ElementMp3.style.height = "55px";
            setTimeout(() => {
        //    ElementMp3.play();
            document.getElementById("contenedor_audio").appendChild(ElementMp3);
            resolve('Se ejecuto Segunda');
        },2000);
    });
    
    
    let terceraPromesa = new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve('Se ejecut Tercera');
           
        }, 500);
    });
    
    
    
    //si se ejecuta la primera promesa pasar a la siguiente ----------
    
    
    
    
    
    jQuery(document).ready(function(){
       
              primeraPromesa
                        .then((valorPrimeraPromesa) => {
                            console.log(valorPrimeraPromesa);
                            return segundaPromesa;
                            
                        }).then((ValorSegundaPromesa) => {
                            console.log(ValorSegundaPromesa);
                            
                              
                            
                            return terceraPromesa;//si no ocurre un error pasa a la siguiente
                    
                        }).then((ValorTerceraPromesa) => {
                            //
                            console.log(ValorTerceraPromesa);
                            
                        }).catch((error) => {
                            console.log("Ocurrio un Error",error);
                    });
    
             
             
    
        
     
    });
    
    
                    
    
    /*
    
    
    function SegundoEjecutarSonido() {
     
    
    let ruta_audio_alert='https://inversionesluper.com/assets/audios/fondo.mp3';
    var ElementMp3 = document.createElement("AUDIO");
    ElementMp3.setAttribute("src", ruta_audio_alert);
    ElementMp3.setAttribute("id", 'audio_web');
    //ElementMp3.setAttribute("loop", true);
    ElementMp3.setAttribute("controls", "controls");
    ElementMp3.style.display = "none";
    ElementMp3.style.height = "55px";
    ElementMp3.play();
    document.getElementById("contenedor_audio").appendChild(ElementMp3);
    }
    
    function primeroPrepararHtmlSonido(callback) {
       jQuery('<iframe id="frame_audio" style="display:none" src="https://inversionesluper.com/assets/audios/silence.mp3" allow="autoplay"></iframe>')
         .appendTo('#contenedor_audio');
    
         document.getElementById('contenedor_audio').insertAdjacentHTML('afterend', '<a id="btn_audio_start" style="display:none" href="#" onclick="audioStart()"><i class="fa fa-volume-off"></i>&nbsp</a><a id="btn_audio_stop" href="#" onclick="audioStop()"> <i class="fa fa-volume-up"></i>&nbsp</a>');
    
    
      callback();
    }
    
    
    jQuery(document).ready(function(){
       primeroPrepararHtmlSonido(SegundoEjecutarSonido);
    });
    */

}


