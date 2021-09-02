<?php                                                                            
// learn php basic: https://www.w3schools.com/php/default.asp                    
                                                                                 
switch ($param->what) {                                                          
        //******************p500User************************             
        // p500User(Name,Phone,Email,Password,Avatar_Url,Token)
                                                                                 
        // Get all data from p500User                                      
        case 500: {                                                              
                $User = new UserDA();
                $sql = $User->UserDataAccess("500", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Insert data to p500User                                         
        case 501: {                                                              
                $User = new UserDA();
                $sql = $User->UserDataAccess("501", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Update data p500User                                            
        case 502: {                                                              
                $User = new UserDA();
                $sql = $User->UserDataAccess("502", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Delete data of p500User                                         
        case 503: {                                                              
                $User = new UserDA();
                $sql = $User->UserDataAccess("503", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Find data with id p500User                                      
        case 504: {                                                              
                $User = new UserDA();
                $sql = $User->UserDataAccess("504", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Select with pagination(offset, number-item-in-page) p500User    
        case 505: {                                                              
                $User = new UserDA();
                $sql = $User->UserDataAccess("505", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Count number item of p500User                                   
        case 506: {                                                              
                $User = new UserDA();
                $sql = $User->UserDataAccess("506", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
}                                                                                
