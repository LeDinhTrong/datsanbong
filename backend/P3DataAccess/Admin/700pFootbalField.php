<?php                                                                                      
	class FootbalFieldDA{				
		public function FootbalFieldDataAccess($what, $param){ 			
            switch ($what) {                                                                 
                //******************p700FootbalField************************             
                // p700FootbalField(id,Owner_Id,Name,Price_Per_Hour,OpenAt,CloseAt,Address,Description,Avatar_Url)
                // Get all data from p700FootbalField
                case 700: {                                                                        
                    return "SELECT * FROM p700FootbalField";
                }                                                                                  
                                                                                                   
                // Insert data to p700FootbalField
                case 701: {                                                                        
                    return "INSERT INTO p700FootbalField(Owner_Id,Name,Price_Per_Hour,OpenAt,CloseAt,Address,Description,Avatar_Url)
                            VALUES('$param->Owner_Id','$param->Name','$param->Price_Per_Hour','$param->OpenAt','$param->CloseAt','$param->Address','$param->Description','$param->Avatar_Url')";                               
                }                                                                                  
                                                                                                   
                // Update data p700FootbalField
                case 702: {
                    return "UPDATE p700FootbalField SET Owner_Id='$param->Owner_Id',Name='$param->Name',Price_Per_Hour='$param->Price_Per_Hour',OpenAt='$param->OpenAt',CloseAt='$param->CloseAt',Address='$param->Address',Description='$param->Description',Avatar_Url='$param->Avatar_Url'
                            WHERE id='$param->id'";                                                 
                }                                                                                  
                                                                                                   
                // Delete data of p700FootbalField
                case 703: {                                                                        
                    return "DELETE FROM p700FootbalField
                            WHERE id IN($param->listid)";                                           
                }                                                                                  
                                                                                                   
                // Find data with id p700FootbalField
                case 704: {                                                                        
                    return "SELECT * FROM p700FootbalField
                            WHERE id='$param->id'";                                                 
                }                                                                                  
                                                                                                   
                // Select with pagination(offset, number-item-in-page) p700FootbalField
                case 705: {                                                                        
                    return "SELECT *                                                                              
                            FROM (SELECT id FROM p700FootbalField $param->condition ORDER BY id LIMIT $param->offset, $param->limit) T1     
                            INNER JOIN p700FootbalField T2 ON T1.id = T2.id";                                     
                }                                                                                                 
                                                                                                   
                // Count number item of p700FootbalField
                case 706: {                                                                        
                    return "SELECT COUNT(1) FROM p700FootbalField $param->condition";
                }                                                                                  
            }                                                                                      
		}                                                                                      
	}                                                                                      
?>                                                                                         
