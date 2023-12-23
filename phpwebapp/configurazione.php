<?php
/* Connettiamo il DB */
$mysqli = new mysqli("localhost","test","SQLpass","dbtest");

if($mysqli -> connect_errno){
    printf("Connessione fallita: %s\n", $mysqli -> connect_error);
    exit();
}
else{
    printf("Connessione Riuscita");
    exit();
}
?>
