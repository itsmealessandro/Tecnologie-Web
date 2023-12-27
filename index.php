<?php
// solo per debugging, da rimuovere alla consegna
error_reporting(E_ALL);
ini_set('display_errors', 1);


    require 'config/configurazione.php';
    require 'config/template.php';
    

    $main = new Template("templates/author/index.html");

    $main->close();

?>