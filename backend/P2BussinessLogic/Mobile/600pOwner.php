<?php                                                                            
// learn php basic: https://www.w3schools.com/php/default.asp                    
                                                                                 
switch ($param->what) {                                                          
        //******************p600Owner************************             
        // p600Owner(Name,Phone,Email,Password,Avatar_Url)
                                                                                 
        // Get all data from p600Owner                                      
        case 600: {                                                              
                $Owner = new OwnerDA();
                $sql = $Owner->OwnerDataAccess("600", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Insert data to p600Owner                                         
        case 601: {                                                              
                $Owner = new OwnerDA();
                $sql = $Owner->OwnerDataAccess("601", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Update data p600Owner                                            
        case 602: {                                                              
                $Owner = new OwnerDA();
                $sql = $Owner->OwnerDataAccess("602", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Delete data of p600Owner                                         
        case 603: {                                                              
                $Owner = new OwnerDA();
                $sql = $Owner->OwnerDataAccess("603", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Find data with id p600Owner                                      
        case 604: {                                                              
                $Owner = new OwnerDA();
                $sql = $Owner->OwnerDataAccess("604", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Select with pagination(offset, number-item-in-page) p600Owner    
        case 605: {                                                              
                $Owner = new OwnerDA();
                $sql = $Owner->OwnerDataAccess("605", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Count number item of p600Owner                                   
        case 606: {                                                              
                $Owner = new OwnerDA();
                $sql = $Owner->OwnerDataAccess("606", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
}                                                                                
