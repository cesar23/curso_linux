<?php
//* A帽adimos el bot贸n antes de &lt;/body&gt;

if (!function_exists('scrollTopButton')) {
    add_action ( 'wp_footer', 'scrollTopButton' );
    function scrollTopButton() {
        ?>
        <!-- Boton hacia arriba -->
        <a class="ir-arriba"  javascript:void(0) title="Volver arriba">
          <span class="fa-stack">
            <i class="fa fa-circle fa-stack-2x"></i>
            <i class="fa fa-arrow-up fa-stack-1x fa-inverse"></i>
          </span>
        </a>
        <?php
    }
}
