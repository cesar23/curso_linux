(function($) {

    const isHomePage = document.getElementsByClassName('home-page');
    if (isHomePage.length > 0) {

        const marginTop = 170; // puedes cambiar el margen
        const currentClasses = 'current-menu-item current_page_item';

        if (!window.location.hash) {
            $('li').removeClass(currentClasses);
            $('li:first-child').addClass(currentClasses);
        }

        $('li a[href*="#"]').click(function(event) {
            const link = this;
            let target = $(link.hash);

            event.preventDefault();
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');

            $('html, body').animate({
                scrollTop: target.offset().top - marginTop
            }, 1000, function() {
                $('li').removeClass(currentClasses);
                $(link).parent().addClass(currentClasses);
            });
        });
       
    }
    
    


})(jQuery);




(function($) {
    irArriba();


    function irArriba() {
        const marginTop = 0; // puedes cambiar el margen cuando haga  el top
        $('.ir-arriba').click(function() {
            $('body,html').animate({
                scrollTop: marginTop + 'px'
            }, 1000);
        });
        $(window).scroll(function() {
            if ($(this).scrollTop() > 0) {
                $('.ir-arriba').slideDown(600);
            } else {
                $('.ir-arriba').slideUp(600);
            }
        });
        var altoWeb = document.body.scrollHeight;
        $('.ir-abajo').click(function() {
            $('body,html').animate({
                scrollTop: altoWeb + 'px'
            }, 1000);
        });
    }

})(jQuery);