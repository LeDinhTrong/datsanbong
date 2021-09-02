<?php                                                                            
// learn php basic: https://www.w3schools.com/php/default.asp                    
                                                                                 
switch ($param->what) {                                                          
        //******************pMenu************************             
        // pMenu(IdParentMenu,IsGroup,Name,Slug,Icon,Position)
                                                                                 
        // Get all data from pMenu                                      
        case 100: {                                                              
                $Menu = new MenuDA();
                $sql = $Menu->MenuDataAccess("100", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Insert data to pMenu                                         
        case 101: {                                                              
                $Menu = new MenuDA();
                $sql = $Menu->MenuDataAccess("101", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Update data pMenu                                            
        case 102: {                                                              
                $Menu = new MenuDA();
                $sql = $Menu->MenuDataAccess("102", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Delete data of pMenu                                         
        case 103: {                                                              
                $Menu = new MenuDA();
                $sql = $Menu->MenuDataAccess("103", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Find data with id pMenu                                      
        case 104: {                                                              
                $Menu = new MenuDA();
                $sql = $Menu->MenuDataAccess("104", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Select with pagination(offset, number-item-in-page) pMenu    
        case 105: {                                                              
                $Menu = new MenuDA();
                $sql = $Menu->MenuDataAccess("105", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Count number item of pMenu                                   
        case 106: {                                                              
                $Menu = new MenuDA();
                $sql = $Menu->MenuDataAccess("106", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Get all data from pMenu                                      
        case 107: {                                                              
                $Menu = new MenuDA();
                $sql = $Menu->MenuDataAccess("107", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                       
                                                                                 
        // Get all data from pMenu with recusive                                   
        case 108: {                                                              
                $Menu = new MenuDA();
                $sql = $Menu->MenuDataAccess("108", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }   

        // Get all data from pMenu with recusive  left join with role                                  
        case 109: {                                                              
                $Menu = new MenuDA();
                $sql = $Menu->MenuDataAccess("109", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                       

        // Get all data from pMenu with recusive  left join with role for permission
        case 110: {                                                              
                $Menu = new MenuDA();
                $sql = $Menu->MenuDataAccess("110", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }  

        // Check permission of menu
        case 111: {                                                              
                $Menu = new MenuDA();
                $sql = $Menu->MenuDataAccess("111", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                       
}                                                                                
