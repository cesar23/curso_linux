<?php
function contador()
{
    $archivo = "./contador.txt"; //el archivo que contiene en numero
    if(!is_file($archivo)){
        $contents = '1';           // Some simple example content.
        file_put_contents($archivo, $contents);     // Save our content to the file.
    }


    $f = fopen($archivo, "r"); //abrimos el archivo en modo de lectura
    if($f)
    {
        $contador = fread($f, filesize($archivo)); //leemos el archivo
        $contador = $contador + 1; //sumamos +1 al contador
        fclose($f);
    }
    $f = fopen($archivo, "w+");
    if($f)
    {
        fwrite($f, $contador);
        fclose($f);
    }
    return $contador;
}
$i=0;
while (true){
    $i++;
    echo "Creando numero: ${i}"."\n";
    sleep(10);
    contador();
}

?>
