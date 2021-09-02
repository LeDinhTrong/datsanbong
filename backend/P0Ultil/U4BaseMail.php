<?php
    include_once "libs/mail/class.phpmailer.php";
    include_once "libs/mail/class.smtp.php";
    
    $mail = new PHPMailer();  
    $mail->IsSMTP();
    $mail->CharSet = 'utf-8';
    $mail->Host = "mail.youngpinejobs.com";
    $mail->SMTPKeepAlive = true;
    $mail->Port = 465; 
    $mail->SMTPAuth = true;
    $mail->SMTPSecure = 'ssl'; 
    $mail->Username = "support@youngpinejobs.com"; 
    $mail->Password = "Phuong@123";  
?>
