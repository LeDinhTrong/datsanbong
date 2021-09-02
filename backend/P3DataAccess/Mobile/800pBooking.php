<?php                                                                                      
	class BookingDA{				
		public function BookingDataAccess($what, $param){ 			
            switch ($what) {                                                                 
                //******************p800Booking************************             
                // p800Booking(id,User_Id,Field_Id,Start,End,Status,Total,Message)
                // Get all data from p800Booking
                case 800: {                                                                        
                    return "SELECT * FROM p800Booking";
                }                                                                                  
                                                                                                   
                // Insert data to p800Booking
                case 801: {                                                                        
                    return "INSERT INTO p800Booking(User_Id,Field_Id,Start,End,Status,Total,Message)
                            VALUES('$param->User_Id','$param->Field_Id','$param->Start','$param->End','$param->Status','$param->Total','$param->Message')";                               
                }                                                                                  
                                                                                                   
                // Update data p800Booking
                case 802: {
                    return "UPDATE p800Booking SET User_Id='$param->User_Id',Field_Id='$param->Field_Id',Start='$param->Start',End='$param->End',Status='$param->Status',Total='$param->Total',Message='$param->Message'
                            WHERE id='$param->id'";                                                 
                }                                                                                  
                                                                                                   
                // Delete data of p800Booking
                case 803: {                                                                        
                    return "DELETE FROM p800Booking
                            WHERE id IN($param->listid)";                                           
                }                                                                                  
                                                                                                   
                // Find data with id p800Booking
                case 804: {                                                                        
                    return "SELECT * FROM p800Booking
                            WHERE id='$param->id'";                                                 
                }                                                                                  
                                                                                                   
                // Select with pagination(offset, number-item-in-page) p800Booking
                case 805: {                                                                        
                    return "SELECT *                                                                              
                            FROM (SELECT id FROM p800Booking $param->condition ORDER BY id LIMIT $param->offset, $param->limit) T1     
                            INNER JOIN p800Booking T2 ON T1.id = T2.id";                                     
                }                                                                                                 
                                                                                                   
                // Count number item of p800Booking
                case 806: {                                                                        
                    return "SELECT COUNT(1) FROM p800Booking $param->condition";
                } 
                
                // Find data with Field_Id   
                case 807: {                                                                        
                    return "SELECT * FROM p800Booking
                            WHERE Field_Id='$param->Field_Id'";                                                 
                } 

                // Find data with User_Id   
                case 808: {                                                                        
                    return "SELECT * FROM p800Booking
                            WHERE User_Id='$param->User_Id'";                                                 
                } 

                // Find data with User_Id and Field_Name with Field_Id   
                case 809: {                                                                        
                    return "SELECT id, Name, Start, End, Total, Status
                            FROM p800Booking
                            LEFT JOIN p700FootbalField
                            ON p800Booking.Field_Id = p700FootbalField.idField
                            WHERE User_Id='$param->User_Id'";                                                 
                } 
            }                                                                                      
		}                                                                                      
	}                                                                                      
?>                                                                                         
