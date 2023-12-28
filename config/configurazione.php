<?php
// Solo per Debugging: da rimuovere alla
error_reporting(E_ALL);
ini_set('display_errors', 1);


/* Connettiamo il DB */
$mysqli = new mysqli("localhost", "test", "SQLpass", "books_db");

if ($mysqli->connect_errno) {
    printf("Connessione fallita: %s\n", $mysqli->connect_error);
    exit();
}

$mysqli->close();
?>