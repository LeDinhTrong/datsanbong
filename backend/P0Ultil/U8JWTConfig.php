<?php
    require_once 'libs/jwt/BeforeValidException.php';
    require_once 'libs/jwt/ExpiredException.php';
    require_once 'libs/jwt/SignatureInvalidException.php';
    require_once 'libs/jwt/JWT.php';

    // show error reporting
    error_reporting(E_ALL);
    
    // set your default time-zone
    date_default_timezone_set('Asia/Manila');
    
    // variables used for jwt
    $key = "phuong@123.";
    $issued_at = time();
    $expiration_time = $issued_at + (60 * 60 * 24); // valid for 1 hour
    // $expiration_time = $issued_at + (20); // valid for 1 hour
    $issuer = "http://localhost"; 
?>