<?php                                                                            
// learn php basic: https://www.w3schools.com/php/default.asp                    
                                                                                 
switch ($param->what) {                                                          
        //******************pRoleDetail************************             
        // pRoleDetail(IdRole,idMenu)
                                                                                 
        // Get all data from pRoleDetail                                      
        case 300: {                                                              
                $RoleDetail = new RoledetailDA();
                $sql = $RoleDetail->RoledetailDataAccess("300", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Insert data to pRoleDetail                                         
        case 301: {                                                              
                $RoleDetail = new RoledetailDA();
                $sql = $RoleDetail->RoledetailDataAccess("301", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Update data pRoleDetail                                            
        case 302: {                                                              
                $RoleDetail = new RoledetailDA();
                $sql = $RoleDetail->RoledetailDataAccess("302", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Delete data of pRoleDetail                                         
        case 303: {                                                              
                $RoleDetail = new RoledetailDA();
                $sql = $RoleDetail->RoledetailDataAccess("303", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Find data with id pRoleDetail                                      
        case 304: {                                                              
                $RoleDetail = new RoledetailDA();
                $sql = $RoleDetail->RoledetailDataAccess("304", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Select with pagination(offset, number-item-in-page) pRoleDetail    
        case 305: {                                                              
                $RoleDetail = new RoledetailDA();
                $sql = $RoleDetail->RoledetailDataAccess("305", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Count number item of pRoleDetail                                   
        case 306: {                                                              
                $RoleDetail = new RoledetailDA();
                $sql = $RoleDetail->RoledetailDataAccess("306", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Get all data from pRoleDetail                                      
        case 307: {                                                              
                $RoleDetail = new RoledetailDA();
                $sql = $RoleDetail->RoledetailDataAccess("307", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
}                                                                                
