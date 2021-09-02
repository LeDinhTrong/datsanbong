<?php                                                                                      
	class AdminDA{				
		public function AdminDataAccess($what, $param){ 			
            switch ($what) {                                                                 
                //******************p400Admin************************             
                // p400Admin(id,Name,Email,Password)
                // Get all data from p400Admin
                case 400: {                                                                        
                    return "SELECT * FROM p400Admin";
                }                                                                                  
                                                                                                   
                // Insert data to p400Admin
                case 401: {                                                                        
                    return "INSERT INTO p400Admin(Name,Email,Password)
                            VALUES('$param->Name','$param->Email','$param->Password')";                               
                }                                                                                  
                                                                                                   
                // Update data p400Admin
                case 402: {
                    return "UPDATE p400Admin SET Name='$param->Name',Email='$param->Email',Password='$param->Password'
                            WHERE id='$param->id'";                                                 
                }                                                                                  
                                                                                                   
                // Delete data of p400Admin
                case 403: {                                                                        
                    return "DELETE FROM p400Admin
                            WHERE id IN($param->listid)";                                           
                }                                                                                  
                                                                                                   
                // Find data with id p400Admin
                case 404: {                                                                        
                    return "SELECT * FROM p400Admin
                            WHERE id='$param->id'";                                                 
                }                                                                                  
                                                                                                   
                // Select with pagination(offset, number-item-in-page) p400Admin
                case 405: {                                                                        
                    return "SELECT *                                                                              
                            FROM (SELECT id FROM p400Admin $param->condition ORDER BY id LIMIT $param->offset, $param->limit) T1     
                            INNER JOIN p400Admin T2 ON T1.id = T2.id";                                     
                }                                                                                                 
                                                                                                   
                // Count number item of p400Admin
                case 406: {                                                                        
                    return "SELECT COUNT(1) FROM p400Admin $param->condition";
                }  
                
                
            }                                                                                      
		}                                                                                      
	}                                                                                      
?>                                                                                         
