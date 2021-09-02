<?php 
	switch ($param->what) { 
        //******************p000account************************
        // p000account(id,name,email,phone,address,role,created_date)

	// Login and create token auth
        case 0: {
                $account = new AccountDA();
                $sql = $account->AccountDataAccess("0", $param);
                $result = $baseQuery->execSQL($sql);
                $data = $result['data'];  
                $result['token'] = createToken(array(
                    "email" => $data['0']['email'],
                    "password" => $data['0']['password'], 
                ));
                echo json_encode($result);
                break;
        }

	// Select all data a1crud_project
        case 1: {
                $account = new AccountDA();
                $sql = $account->AccountDataAccess("1", $param);
                $result = $baseQuery->execSQL($sql);

                echo json_encode($result);
                break;
        }
            

        // Update data a1crud_project
        case 2: {
                $account = new AccountDA();
                $sql = $account->AccountDataAccess("2", $param);
                $result = $baseQuery->execSQL($sql);

                echo json_encode($result);
                break;
        }

        // Delete data of a1crud_project
        case 3: {
                $account = new AccountDA();
                $sql = $account->AccountDataAccess("3", $param);

                $result = $baseQuery->execSQL($sql);

                echo json_encode($result);
                break;
        }

        // Find data with id a1crud_project
        case 4: {
                $account = new AccountDA();
                $sql = $account->AccountDataAccess("4", $param);

                $result = $baseQuery->execSQL($sql);

                echo json_encode($result);
                break;
        }

        // Select with pagination(offset, number-item-in-page) a1crud_project
        case 5: {
                $account = new AccountDA();
                $sql = $account->AccountDataAccess("5", $param);

                $result = $baseQuery->execSQL($sql);

                echo json_encode($result);
                break;
        }

        // Count number item of a1crud_project
        case 6: {
                $account = new AccountDA();
                $sql = $account->AccountDataAccess("6", $param);

                $result = $baseQuery->execSQL($sql);

                echo json_encode($result);
                break;
        }
        
        // Count number item of a1crud_project
        case 7: {
                $account = new AccountDA();
                $sql = $account->AccountDataAccess("7", $param);

                $result = $baseQuery->execSQL($sql);

                echo json_encode($result);
                break;
        }

        // Get all data from a1crud_project
        case 8: {
                $account = new AccountDA();
                $sql = $account->AccountDataAccess("8", $param);

                $result = $baseQuery->execSQL($sql);

                echo json_encode($result);
                break;
        }

        // Get all data from a1crud_project
        case 9: {
                $account = new AccountDA();
                $sql = $account->AccountDataAccess("9", $param);

                $result = $baseQuery->execSQL($sql);

                echo json_encode($result);
                break;
        }

        // Get all data from a1crud_project
        case 10: {
                $account = new AccountDA();
                $sql = $account->AccountDataAccess("10", $param);

                $result = $baseQuery->execSQL($sql);

                echo json_encode($result);
                break;
        }

        // Get all data from a1crud_project
        case 11: {
                $account = new AccountDA();
                $sql = $account->AccountDataAccess("11", $param);

                $result = $baseQuery->execSQL($sql);

                echo json_encode($result);
                break;
        }
	}
?> 
