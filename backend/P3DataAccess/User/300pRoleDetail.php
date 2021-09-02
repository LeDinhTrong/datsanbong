<?php                                                                                      
	class RoledetailDA{				
		public function RoledetailDataAccess($what, $param){ 			
            switch ($what) {                                                                 
                //******************p300RoleDetail************************             
                // p300RoleDetail(id,IdRole,IdMenu,Status)
                // Get all data from p300RoleDetail
                case 300: {                                                                        
                    return "SELECT * FROM p300RoleDetail";
                }                                                                                  
                                                                                                   
                // Insert data to p300RoleDetail
                case 301: {                                                                        
                    return "INSERT INTO p300RoleDetail(IdRole,IdMenu,Status)
                            VALUES('$param->IdRole','$param->IdMenu','$param->Status')";                               
                }                                                                                  
                                                                                                   
                // Update data p300RoleDetail
                case 302: {
                    return "UPDATE p300RoleDetail SET IdRole='$param->IdRole',IdMenu='$param->IdMenu',Status='$param->Status'
                            WHERE id='$param->id'";                                         
                }                                                                                  
                                                                                                   
                // Delete data of p300RoleDetail
                case 303: {                                                                        
                    return "DELETE FROM p300RoleDetail
                            WHERE id IN($param->listid)";                                           
                }                                                                                  
                                                                                                   
                // Find data with id p300RoleDetail
                case 304: {                                                                        
                    return "SELECT * FROM p300RoleDetail
                            WHERE id='$param->id'";                                                 
                }                                                                                  
                                                                                                   
                // Select with pagination(offset, number-item-in-page) p300RoleDetail
                case 305: {                                                                        
                    return "SELECT *                                                                              
                            FROM (SELECT id FROM p300RoleDetail ORDER BY id LIMIT $param->offset, $param->limit) T1     
                            INNER JOIN p300RoleDetail T2 ON T1.id = T2.id                                               
                                $param->condition";                                                               
                }                                                                                                 
                                                                                                   
                // Count number item of p300RoleDetail
                case 306: {                                                                        
                    return "SELECT COUNT(1) FROM p300RoleDetail $param->condition";
                }                                                                                  
            }                                                                                      
		}                                                                                      
	}                                                                                      
?>                                                                                         
