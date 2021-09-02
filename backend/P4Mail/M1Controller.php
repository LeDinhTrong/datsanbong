<?php
    include_once '../P0Ultil/U0HeaderAccess.php';
    include_once "../P0Ultil/U4BaseMail.php"; 

    // get input 
    $param = json_decode(file_get_contents("php://input")); 

    if (isset($param->what)) { 
        // add admin process layer
        include_once "M2BussinessLogic.php"; 
    }
?>
