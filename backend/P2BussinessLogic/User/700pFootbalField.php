<?php                                                                            
// learn php basic: https://www.w3schools.com/php/default.asp                    
                                                                                 
switch ($param->what) {                                                          
        //******************p700FootbalField************************             
        // p700FootbalField(Owner_Id,Name,Price_Per_Hour,OpenAt,CloseAt,Address,Description,Avatar_Url)
                                                                                 
        // Get all data from p700FootbalField                                      
        case 700: {                                                              
                $FootbalField = new FootbalFieldDA();
                $sql = $FootbalField->FootbalFieldDataAccess("700", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Insert data to p700FootbalField                                         
        case 701: {                                                              
                $FootbalField = new FootbalFieldDA();
                $sql = $FootbalField->FootbalFieldDataAccess("701", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Update data p700FootbalField                                            
        case 702: {                                                              
                $FootbalField = new FootbalFieldDA();
                $sql = $FootbalField->FootbalFieldDataAccess("702", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Delete data of p700FootbalField                                         
        case 703: {                                                              
                $FootbalField = new FootbalFieldDA();
                $sql = $FootbalField->FootbalFieldDataAccess("703", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Find data with id p700FootbalField                                      
        case 704: {                                                              
                $FootbalField = new FootbalFieldDA();
                $sql = $FootbalField->FootbalFieldDataAccess("704", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Select with pagination(offset, number-item-in-page) p700FootbalField    
        case 705: {                                                              
                $FootbalField = new FootbalFieldDA();
                $sql = $FootbalField->FootbalFieldDataAccess("705", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Count number item of p700FootbalField                                   
        case 706: {                                                              
                $FootbalField = new FootbalFieldDA();
                $sql = $FootbalField->FootbalFieldDataAccess("706", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
}                                                                                
