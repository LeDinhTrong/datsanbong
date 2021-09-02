<?php   
    // include orm red bean
    include_once '../P0Ultil/U2BaseORMRedBean.php';

	switch ($param->what) {
        //******************Bussiness Logic Mail************************
        // sent mail create account success
        // input(id user)
        case 100: { 
            // begin get data and process bussiness logic
            $test = R::load('test', 1);

            $mail->Subject = "PHPMailer Simple database mailing list test";
            $mail->setFrom('support@youngpinejobs.com', 'Tên Người Người Mail');
            $mail->addReplyTo('email.when.reply@youngpinejobs.com', 'Tên Người Nhận khi reply lại mail');

            // Recipient's name
            $mail->AddAddress("helloitpdu@gmail.com","Lê Hồng Phương"); 

            // load file html
            $body = file_get_contents('template/contents.html');

            // update content mail html
            $body = str_replace('{{ name }}', $test->name, $body);
            $body = str_replace('{{ age }}', '27', $body);

            // set it inside the loop
            $mail->msgHTML($body);
    
            // send mail
            if(!$mail->Send()){
                echo '{"status": false, "error":"'.$mail->ErrorInfo.'"}';
            } else {
                echo '{"status": true}';
            }
            break;
        }

        // Mail for forgot password
        // input(id user)
        case 101: {
            // begin get data and process bussiness logic
            $test = R::load('test', 1);

            $mail->Subject = "PHPMailer Simple database mailing list test";
            $mail->setFrom('support@youngpinejobs.com', 'Tên Người Người Mail');
            $mail->addReplyTo('email.when.reply@youngpinejobs.com', 'Tên Người Nhận khi reply lại mail');

            // Recipient's name
            $mail->AddAddress("helloitpdu@gmail.com","Lê Hồng Phương"); 

            // load file html
            $body = file_get_contents('template/test.html');

            // update content mail html
            $body = str_replace('{{ name }}', $test->name, $body);
            $body = str_replace('{{ age }}', '27', $body);

            // set it inside the loop
            $mail->msgHTML($body);
    
            // send mail
            if(!$mail->Send()){
                echo '{"status": false, "error":"'.$mail->ErrorInfo.'"}';
            } else {
                echo '{"status": true}';
            }
            break;
        } 

        // Mail for forgot password
        // input(id user)
        case 102: {
            // begin get data and process bussiness logic
            $test = R::load('test', $param->id);
            

            $mail->Subject = "PHPMailer Simple database mailing list test";
            $mail->setFrom('support@youngpinejobs.com', 'Tên Người gửi Mail');
            $mail->addReplyTo('email.when.reply@youngpinejobs.com', 'Tên Người Nhận khi reply lại mail');

            // Recipient's name
            $mail->AddAddress("helloitpdu@gmail.com","Lê Hồng Phương"); 

            // load file html
            $body = file_get_contents('template/general.html');

            // update content mail html
            $body = str_replace('{{ name }}', $test->name, $body);
            $body = str_replace('{{ age }}', '50', $body);

            // set it inside the loop
            $mail->msgHTML($body);
    
            // send mail
            if(!$mail->Send()){
                echo '{"status": false, "error":"'.$mail->ErrorInfo.'"}';
            } else {
                echo '{"status": true, "error":"'.$mail->ErrorInfo.'"}';
            }
            break;
        } 

    }
