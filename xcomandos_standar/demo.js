var salida = "DDD";
console.log("Salida peru:" + salida);


  // -----------------------------------------------bloquear cualquier click
  document.addEventListener('click', function (e) {
    e.preventDefault();
    console.log("click cesar");
}, false);
 // bloquear cualquier click en  un class
  document.querySelector('.link').addEventListener('click', function (e) {
    console.log("click cesar");
   e.preventDefault();
}, false);

// con jquery
jQuery(document).on('click',  function(event) {
  event.preventDefault();
  console.log('item clicked');
});


