<?php                                                                                      
	class RoleDA{				
		public function RoleDataAccess($what, $param){ 			
            switch ($what) {                                                                 
                //******************p200Role************************             
                // p200Role(id,Name)
                // Get all data from p200Role
                case 200: {                                                                        
                    return "SELECT * FROM p200Role";
                }                                                                                  
                                                                                                   
                // Insert data to p200Role
                case 201: {                                                                        
                    return "INSERT INTO p200Role(Name)
                            VALUES('$param->Name')";                               
                }                                                                                  
                                                                                                   
                // Update data p200Role
                case 202: {
                    return "UPDATE p200Role SET Name='$param->Name'
                            WHERE id='$param->id'";                                                 
                }                                                                                  
                                                                                                   
                // Delete data of p200Role
                case 203: {                                                                        
                    return "DELETE FROM p200Role
                            WHERE id IN($param->listid)";                                           
                }                                                                                  
                                                                                                   
                // Find data with id p200Role
                case 204: {                                                                        
                    return "SELECT * FROM p200Role
                            WHERE id='$param->id'";                                                 
                }                                                                                  
                                                                                                   
                // Select with pagination(offset, number-item-in-page) p200Role
                case 205: {                                                                        
                    return "SELECT *                                                                              
                            FROM (SELECT id FROM p200Role ORDER BY id LIMIT $param->offset, $param->limit) T1     
                            INNER JOIN p200Role T2 ON T1.id = T2.id                                               
                                $param->condition";                                                               
                }                                                                                                 
                                                                                                   
                // Count number item of p200Role
                case 206: {                                                                        
                    return "SELECT COUNT(1) FROM p200Role $param->condition";
                }                                                                                  
            }                                                                                      
		}                                                                                      
	}                                                                                      
?>                                                                                         
