<?php
use \Firebase\JWT\JWT;

function createToken($data)
{
    require_once '../../P0Ultil/U8JWTConfig.php';

    // generate jwt will be here   
    $token = array(
        "iat" => $issued_at,
        "exp" => $expiration_time,
        "iss" => $issuer,
        "data" => $data
    );

    // generate jwt
    return JWT::encode($token, $key);
}

// echo createToken(array("username"=>"helloitpdu@gmail.com","password"=>"123","role"=>"admin"));

function validateToken($jwt)
{
    require_once '../../P0Ultil/U8JWTConfig.php';

    // if jwt is not empty
    if ($jwt) {

        // if decode succeed, show user details
        try {
            // decode jwt
            $decoded = JWT::decode($jwt, $key, array('HS256'));

            // set response code
            http_response_code(200);

            // show user details
            return (array(
                "status_auth" => true,
                "message" => "Access granted.",
                "data" => $decoded->data
            ));
        }

        // catch will be here
        // if decode fails, it means jwt is invalid
        catch (Exception $e) {

            // set response code
            http_response_code(401);

            // tell the user access denied  & show error message
            return (array(
                "status_auth" => false,
                "message" => "Access denied.",
                "error" => $e->getMessage()
            ));
        }
    }

    // error if jwt is empty will be here
    // show error message if jwt is empty
    else {
        // set response code
        http_response_code(401);

        // tell the user access denied
        return (array(
            "status_auth" => false,
            "message" => "Access denied.",
            "error" => 'Token invalid'
        ));
    }
}

// $response = validateToken("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2MTAzNTU4MTMsImV4cCI6MTYxMDM1OTQxMywiaXNzIjoiaHR0cDpcL1wvbG9jYWxob3N0XC9Db2RlT2ZhTmluamFcL1Jlc3RBcGlBdXRoTGV2ZWwxXC8iLCJkYXRhIjp7InBodW9uZyI6InNkZiJ9fQ.rBkgwmss0oOLCAhSxoq8Zze4d-jV0GaLmCkSpVBG4sA");