<?php                                                                                      
	class OwnerDA{				
		public function OwnerDataAccess($what, $param){ 			
            switch ($what) {                                                                 
                //******************p600Owner************************             
                // p600Owner(id,Name,Phone,Email,Password,Avatar_Url,Token)
                // Get all data from p600Owner
                case 600: {                                                                        
                    return "SELECT * FROM p600Owner";
                }                                                                                  
                                                                                                   
                // Insert data to p600Owner
                case 601: {                                                                        
                    return "INSERT INTO p600Owner(Name,Phone,Email,Password,Avatar_Url,Token)
                            VALUES('$param->Name','$param->Phone','$param->Email','$param->Password','$param->Avatar_Url','$param->Token')";                               
                }                                                                                  
                                                                                                   
                // Update data p600Owner
                case 602: {
                    return "UPDATE p600Owner SET Name='$param->Name',Phone='$param->Phone',Email='$param->Email',Password='$param->Password',Avatar_Url='$param->Avatar_Url',Token='$param->Token'
                            WHERE id='$param->id'";                                                 
                }                                                                                  
                                                                                                   
                // Delete data of p600Owner
                case 603: {                                                                        
                    return "DELETE FROM p600Owner
                            WHERE id IN($param->listid)";                                           
                }                                                                                  
                                                                                                   
                // Find data with id p600Owner
                case 604: {                                                                        
                    return "SELECT * FROM p600Owner
                            WHERE id='$param->id'";                                                 
                }                                                                                  
                                                                                                   
                // Select with pagination(offset, number-item-in-page) p600Owner
                case 605: {                                                                        
                    return "SELECT *                                                                              
                            FROM (SELECT id FROM p600Owner $param->condition ORDER BY id LIMIT $param->offset, $param->limit) T1     
                            INNER JOIN p600Owner T2 ON T1.id = T2.id";                                     
                }                                                                                                 
                                                                                                   
                // Count number item of p600Owner
                case 606: {                                                                        
                    return "SELECT COUNT(1) FROM p600Owner $param->condition";
                }                                                                                  
            }                                                                                      
		}                                                                                      
	}                                                                                      
?>                                                                                         
