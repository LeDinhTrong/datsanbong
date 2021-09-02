<?php
//Visist http://http://esms.vn/SMSApi/ApiSendSMSNormal for more information about API
//� 2013 esms.vn
//Website: http://esms.vn/
//Hotline: 0901.888.484      

function sentSMS($phone, $content)
{
    //Huong dan chi tiet cach su dung API: http://esms.vn/blog/3-buoc-de-co-the-gui-tin-nhan-tu-website-ung-dung-cua-ban-bang-sms-api-cua-esmsvn
    //De lay Key cac ban dang nhap eSMS.vn v� vao quan Quan li API 
    $APIKey = "5A9D608729311203A3253461853AB7";
    $SecretKey = "86889C3BA20B926E42F91D4BCCFC57"; 

    $YourPhone = $phone;
    $Content = $content;
    $SendContent = urlencode($Content);
    $data = "http://rest.esms.vn/MainService.svc/json/SendMultipleMessage_V4_get?Phone=$YourPhone&ApiKey=$APIKey&SecretKey=$SecretKey&Content=$SendContent&Brandname=AKHAIR.VN&SmsType=2";
    // De dang ky brandname rieng vui long lien he hotline 0901.888.484 hoac nhan vien kinh Doanh cua ban
    $curl = curl_init($data);
    curl_setopt($curl, CURLOPT_FAILONERROR, true);
    curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    $result = curl_exec($curl);

    $obj = json_decode($result, true);
    if ($obj['CodeResult'] == 100) {
        return array(
            "status" => true, 
            "data" => $obj,
            "error" => "",
            "content" => $content
        ); 
    } else {
        return array(
            "status" => false, 
            "data" => $obj,
            "error" => $obj['ErrorMessage'],
            "content" => $content
        );
    }
}
