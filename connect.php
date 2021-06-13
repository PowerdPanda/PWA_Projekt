<?php 
    header('Content-Type: text/html; charset=utf-8');

    $servername = "localhost";
    $username = "root";
    $password= "";
    $dbasename= "projekt";

    $dbc = mysqli_connect($servername, $username, $password, $dbasename) or die('Error connecting to MySQL server'.mysqli_connect_error());
    mysqli_set_charset($dbc, "utf-8");
?>