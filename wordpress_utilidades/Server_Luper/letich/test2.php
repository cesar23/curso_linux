<?php

if(isset($_COOKIE['contador']))
{
    // Caduca en un año
    setcookie('contador', $_COOKIE['contador'] + 1, time()+3600*2);//dos  horas
    echo  'Número de visitas: ' . $_COOKIE['contador'];
}
else
{
    // Caduca en un año
    setcookie('contador', 1, time() +3600);//dos  horas
    echo  'Bienvenido a nuestra página web';
}
