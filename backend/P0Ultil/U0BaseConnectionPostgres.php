<?php
    include_once 'U0HeaderAccess.php';
    
    // postgres
    $servername = "ec2-18-211-86-133.compute-1.amazonaws.com";  
    $username = "rhqgodplucnlwz";
    $password = "d836ce9406c34f5daf08d39e004c2b198eb997a79d0940b5495c7b8394efad6f";
    $dbname = "ddq87nqpej3h78";  

    $conn = pg_connect("host=ec2-18-211-86-133.compute-1.amazonaws.com port=5432 dbname=ddq87nqpej3h78 user=rhqgodplucnlwz password=d836ce9406c34f5daf08d39e004c2b198eb997a79d0940b5495c7b8394efad6f"); 
	
	if (!$conn) {
		echo "An error occurred.\n";
		exit;
	}
	
    // Check connection
    // if ($conn->connect_error) {
    //     die("Connection failed: " . $conn->connect_error);
    // } 
    mysqli_set_charset($conn,"utf8"); 

?> 