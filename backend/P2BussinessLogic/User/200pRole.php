<?php                                                                            
// learn php basic: https://www.w3schools.com/php/default.asp                    
                                                                                 
switch ($param->what) {                                                          
        //******************pRole************************             
        // pRole(Name)
                                                                                 
        // Get all data from pRole                                      
        case 200: {                                                              
                $Role = new RoleDA();
                $sql = $Role->RoleDataAccess("200", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Insert data to pRole                                         
        case 201: {                                                              
                $Role = new RoleDA();
                $sql = $Role->RoleDataAccess("201", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Update data pRole                                            
        case 202: {                                                              
                $Role = new RoleDA();
                $sql = $Role->RoleDataAccess("202", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Delete data of pRole                                         
        case 203: {                                                              
                $Role = new RoleDA();
                $sql = $Role->RoleDataAccess("203", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Find data with id pRole                                      
        case 204: {                                                              
                $Role = new RoleDA();
                $sql = $Role->RoleDataAccess("204", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Select with pagination(offset, number-item-in-page) pRole    
        case 205: {                                                              
                $Role = new RoleDA();
                $sql = $Role->RoleDataAccess("205", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Count number item of pRole                                   
        case 206: {                                                              
                $Role = new RoleDA();
                $sql = $Role->RoleDataAccess("206", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Get all data from pRole                                      
        case 207: {                                                              
                $Role = new RoleDA();
                $sql = $Role->RoleDataAccess("207", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
}                                                                                
