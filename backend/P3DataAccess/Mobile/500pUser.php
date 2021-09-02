<?php                                                                                      
	class UserDA{				
		public function UserDataAccess($what, $param){ 			
            switch ($what) {                                                                 
                //******************p500User************************             
                // p500User(id,Name,Phone,Email,Password,A
                // Get all data from p500User
                case 500: {                                                                        
                    return "SELECT * FROM p500User";
                }                                                                                  
                                                                                                   
                // Insert data to p500User
                case 501: {                                                                        
                    return "INSERT INTO p500User(Name,Phone,Email,Password,Avatar_Url)
                            VALUES('$param->Name','$param->Phone','$param->Email','$param->Password','$param->Avatar_Url')";                               
                }                                                                                  
                                                                                                   
                // Update data p500User
                case 502: {
                    return "UPDATE p500User SET Name='$param->Name',Phone='$param->Phone',Email='$param->Email',Password='$param->Password',Avatar_Url='$param->Avatar_Url'
                            WHERE id='$param->id'";                                                 
                }                                                                                  
                                                                                                   
                // Delete data of p500User
                case 503: {                                                                        
                    return "DELETE FROM p500User
                            WHERE id IN($param->listid)";                                           
                }                                                                                  
                                                                                                   
                // Find data with id p500User
                case 504: {                                                                        
                    return "SELECT * FROM p500User
                            WHERE id='$param->id'";                                                 
                }                                                                                  
                                                                                                   
                // Select with pagination(offset, number-item-in-page) p500User
                case 505: {                                                                        
                    return "SELECT *                                                                              
                            FROM (SELECT id FROM p500User $param->condition ORDER BY id LIMIT $param->offset, $param->limit) T1     
                            INNER JOIN p500User T2 ON T1.id = T2.id";                                     
                }                                                                                                 
                                                                                                   
                // Count number item of p500User
                case 506: {                                                                        
                    return "SELECT COUNT(1) FROM p500User $param->condition";
                }    
                
                // Update infomation p500User
                case 507: {
                    return "UPDATE p500User SET Name='$param->Name',Phone='$param->Phone'
                            WHERE id='$param->id'";                                                 
                }

                // Login
                case 508: {
                    return "SELECT * FROM p500User
                            WHERE Email = '$param->Email'
                                AND Password = '$param->Password'";
                }
            }                                                                                      
		}                                                                                      
	}                                                                                      
?>                                                                                         
