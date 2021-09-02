<?php 
// https://redbeanphp.com/index.php?p=/quick_tour
// import red bean for mysql 
include_once 'libs/ORMRedBean/rb-mysql.php';

$servername = "localhost";  
$username = "root";
$password = "";
$dbname = "tool";  
R::setup( 'mysql:host='.$servername.';dbname='.$dbname, $username, $password );

// freeze data when deploy production
R::freeze( FALSE );

// use query cache
R::useWriterCache(true);