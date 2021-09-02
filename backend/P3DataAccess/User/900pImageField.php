<?php                                                                                      
	class ImageFieldDA{				
		public function ImageFieldDataAccess($what, $param){ 			
            switch ($what) {                                                                 
                //******************p900ImageField************************             
                // p900ImageField(id,Field_Id,Img_Url)
                // Get all data from p900ImageField
                case 900: {                                                                        
                    return "SELECT * FROM p900ImageField";
                }                                                                                  
                                                                                                   
                // Insert data to p900ImageField
                case 901: {                                                                        
                    return "INSERT INTO p900ImageField(Field_Id,Img_Url)
                            VALUES('$param->Field_Id','$param->Img_Url')";                               
                }                                                                                  
                                                                                                   
                // Update data p900ImageField
                case 902: {
                    return "UPDATE p900ImageField SET Field_Id='$param->Field_Id',Img_Url='$param->Img_Url'
                            WHERE id='$param->id'";                                                 
                }                                                                                  
                                                                                                   
                // Delete data of p900ImageField
                case 903: {                                                                        
                    return "DELETE FROM p900ImageField
                            WHERE id IN($param->listid)";                                           
                }                                                                                  
                                                                                                   
                // Find data with id p900ImageField
                case 904: {                                                                        
                    return "SELECT * FROM p900ImageField
                            WHERE id='$param->id'";                                                 
                }                                                                                  
                                                                                                   
                // Select with pagination(offset, number-item-in-page) p900ImageField
                case 905: {                                                                        
                    return "SELECT *                                                                              
                            FROM (SELECT id FROM p900ImageField $param->condition ORDER BY id LIMIT $param->offset, $param->limit) T1     
                            INNER JOIN p900ImageField T2 ON T1.id = T2.id";                                     
                }                                                                                                 
                                                                                                   
                // Count number item of p900ImageField
                case 906: {                                                                        
                    return "SELECT COUNT(1) FROM p900ImageField $param->condition";
                }                                                                                  
            }                                                                                      
		}                                                                                      
	}                                                                                      
?>                                                                                         
