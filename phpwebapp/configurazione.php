<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

/* Connettiamo il DB */
$mysqli = new mysqli("localhost", "test", "SQLpass", "dbtest");

if ($mysqli->connect_errno) {
    printf("Connessione fallita: %s\n", $mysqli->connect_error);
    exit();
}

// Eseguire la query per ottenere l'utente con ID 1
$query = "SELECT * FROM user WHERE ID = 1";
$result = $mysqli->query($query);

if (!$result) {
    printf("Errore nella query: %s\n", $mysqli->error);
    exit();
}

// Ottenere i dati dell'utente
$user = $result->fetch_assoc();

// Output dei dati con printf
printf("ID: %d, username: %s, password: %s", $user['ID'], $user['username'], $user['password']);

// Chiudere la connessione al database
$mysqli->close();
exit();
?>