<?php                                                                            
// learn php basic: https://www.w3schools.com/php/default.asp                    
                                                                                 
switch ($param->what) {                                                          
        //******************p400Admin************************             
        // p400Admin(Name,Email,Password)
                                                                                 
        // Get all data from p400Admin                                      
        case 400: {                                                              
                $Admin = new AdminDA();
                $sql = $Admin->AdminDataAccess("400", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Insert data to p400Admin                                         
        case 401: {                                                              
                $Admin = new AdminDA();
                $sql = $Admin->AdminDataAccess("401", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Update data p400Admin                                            
        case 402: {                                                              
                $Admin = new AdminDA();
                $sql = $Admin->AdminDataAccess("402", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Delete data of p400Admin                                         
        case 403: {                                                              
                $Admin = new AdminDA();
                $sql = $Admin->AdminDataAccess("403", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Find data with id p400Admin                                      
        case 404: {                                                              
                $Admin = new AdminDA();
                $sql = $Admin->AdminDataAccess("404", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Select with pagination(offset, number-item-in-page) p400Admin    
        case 405: {                                                              
                $Admin = new AdminDA();
                $sql = $Admin->AdminDataAccess("405", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Count number item of p400Admin                                   
        case 406: {                                                              
                $Admin = new AdminDA();
                $sql = $Admin->AdminDataAccess("406", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
}                                                                                
