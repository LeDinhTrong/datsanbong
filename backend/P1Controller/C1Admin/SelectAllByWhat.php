<?php
// import header 
include_once '../../P0Ultil/U0HeaderAccess.php';

// import base connection to database
include_once "../../P0Ultil/U0BaseConnectionMySQL.php";
include_once "../../P0Ultil/U1BaseQuery.php";
require_once "../../P8Security/S1SecurityJWT.php";

// Admin type TRUE for security
$IS_ADMIN = TRUE;
$ACCESS_FLAG = FALSE;

// create base query
$baseQuery = new BaseQuery($conn);

// get input 
$param = json_decode(file_get_contents("php://input"));

// Check what param is not null
if (isset($param->what)) {
    // check security with jwt exceipt case what for login is '0'
    if ($param->what == '0' || $param->what == '5' || $param->what == '700' || !$IS_ADMIN) {
        // open with what is '0' is login
        $ACCESS_FLAG = TRUE;
    } else { 
        // Check token param is not null 
		$headers = apache_request_headers(); 
		$token = $headers['Authorization'];
  
		// get token form param request
		if (!isset($token)){
			$token = $param->token;
		}

		// check token
        if (isset($token)) {
            $response = validateToken($token);

            // auth jwt false
            if (!$response['status_auth']) {
                echo json_encode(array(
                    "status_auth" => false,
                    "message" => "Access denied."
                ));

                // Close connections
                $conn->close();
                exit;
            }

            // auth jwt success
            $ACCESS_FLAG = TRUE;
        } else {
            echo json_encode(array(
                "status_auth" => false,
                "message" => "Access denied."
            ));
        }
    }

    // Access for call api
    if ($ACCESS_FLAG) {
        require "../../P3DataAccess/Admin/_init.php";
        require "../../P2BussinessLogic/Admin/_init.php";
    }
}

// Close connections
$conn->close();
