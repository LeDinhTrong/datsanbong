<?php                                                                            
// learn php basic: https://www.w3schools.com/php/default.asp                    
                                                                                 
switch ($param->what) {                                                          
        //******************p900ImageField************************             
        // p900ImageField(Field_Id,Img_Url)
                                                                                 
        // Get all data from p900ImageField                                      
        case 900: {                                                              
                $ImageField = new ImageFieldDA();
                $sql = $ImageField->ImageFieldDataAccess("900", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Insert data to p900ImageField                                         
        case 901: {                                                              
                $ImageField = new ImageFieldDA();
                $sql = $ImageField->ImageFieldDataAccess("901", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Update data p900ImageField                                            
        case 902: {                                                              
                $ImageField = new ImageFieldDA();
                $sql = $ImageField->ImageFieldDataAccess("902", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Delete data of p900ImageField                                         
        case 903: {                                                              
                $ImageField = new ImageFieldDA();
                $sql = $ImageField->ImageFieldDataAccess("903", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Find data with id p900ImageField                                      
        case 904: {                                                              
                $ImageField = new ImageFieldDA();
                $sql = $ImageField->ImageFieldDataAccess("904", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Select with pagination(offset, number-item-in-page) p900ImageField    
        case 905: {                                                              
                $ImageField = new ImageFieldDA();
                $sql = $ImageField->ImageFieldDataAccess("905", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Count number item of p900ImageField                                   
        case 906: {                                                              
                $ImageField = new ImageFieldDA();
                $sql = $ImageField->ImageFieldDataAccess("906", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }   
        
        // Find data with Field_Id                                     
        case 907: {                                                              
                $ImageField = new ImageFieldDA();
                $sql = $ImageField->ImageFieldDataAccess("907", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }  
                                                                                 
}                                                                                
