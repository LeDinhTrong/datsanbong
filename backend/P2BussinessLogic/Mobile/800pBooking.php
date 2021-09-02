<?php                                                                            
// learn php basic: https://www.w3schools.com/php/default.asp                    
                                                                                 
switch ($param->what) {                                                          
        //******************p800Booking************************             
        // p800Booking(User_Id,Field_Id,Book_Day,Start,End,Status,Total,Message)
                                                                                 
        // Get all data from p800Booking                                      
        case 800: {                                                              
                $Booking = new BookingDA();
                $sql = $Booking->BookingDataAccess("800", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Insert data to p800Booking                                         
        case 801: {                                                              
                $Booking = new BookingDA();
                $sql = $Booking->BookingDataAccess("801", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Update data p800Booking                                            
        case 802: {                                                              
                $Booking = new BookingDA();
                $sql = $Booking->BookingDataAccess("802", $param);               
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Delete data of p800Booking                                         
        case 803: {                                                              
                $Booking = new BookingDA();
                $sql = $Booking->BookingDataAccess("803", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Find data with id p800Booking                                      
        case 804: {                                                              
                $Booking = new BookingDA();
                $sql = $Booking->BookingDataAccess("804", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Select with pagination(offset, number-item-in-page) p800Booking    
        case 805: {                                                              
                $Booking = new BookingDA();
                $sql = $Booking->BookingDataAccess("805", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }                                                                        
                                                                                 
        // Count number item of p800Booking                                   
        case 806: {                                                              
                $Booking = new BookingDA();
                $sql = $Booking->BookingDataAccess("806", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        }   
        
        // Find data with Field_Id                                     
        case 807: {                                                              
                $Booking = new BookingDA();
                $sql = $Booking->BookingDataAccess("807", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        } 

        // Find data with User_Id                                     
        case 808: {                                                              
                $Booking = new BookingDA();
                $sql = $Booking->BookingDataAccess("808", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        } 

        // Find data with User_Id and Field_Name with Field_Id                                   
        case 809: {                                                              
                $Booking = new BookingDA();
                $sql = $Booking->BookingDataAccess("809", $param);               
                                                                                 
                $result = $baseQuery->execSQL($sql);                             
                                                                                 
                echo json_encode($result);                                       
                break;                                                           
        } 
                                                                                 
}                                                                                
