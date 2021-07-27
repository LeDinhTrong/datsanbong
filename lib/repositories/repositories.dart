import 'dart:async';                                                       
																			 
import 'r400_admin_provider.dart';
import 'r500_user_provider.dart';
import 'r600_owner_provider.dart';
import 'r700_footbalfield_provider.dart';
import 'r800_booking_provider.dart';
import 'r900_imagefield_provider.dart';
                                                                          
																			 
class Repository {                                                           
  final r400AdminProvider = R400AdminProvider();
  final r500UserProvider = R500UserProvider();
  final r600OwnerProvider = R600OwnerProvider();
  final r700FootbalFieldProvider = R700FootbalFieldProvider();
  final r800BookingProvider = R800BookingProvider();
  final r900ImageFieldProvider = R900ImageFieldProvider();
                                                                          
																			 
  /**                                                                        
   * execute Service                                                         
   */                                                                        
  Future<dynamic> executeService(int what, Map<String, dynamic> param) async{     
    try {                                                                    
      param['what'] = what;                                                
      if (what >= 400 && what < 500) {                           
        // call provider Admin                               
        return r400AdminProvider.p400Admin(what, param);  
      }                                                         

      if (what >= 500 && what < 600) {                           
        // call provider User                               
        return r500UserProvider.p500User(what, param);  
      }                                                         

      if (what >= 600 && what < 700) {                           
        // call provider Owner                               
        return r600OwnerProvider.p600Owner(what, param);  
      }                                                         

      if (what >= 700 && what < 800) {                           
        // call provider FootbalField                               
        return r700FootbalFieldProvider.p700FootbalField(what, param);  
      }                                                         

      if (what >= 800 && what < 900) {                           
        // call provider Booking                               
        return r800BookingProvider.p800Booking(what, param);  
      }                                                         

      if (what >= 900 && what < 1000) {                           
        // call provider ImageField                               
        return r900ImageFieldProvider.p900ImageField(what, param);  
      }                                                         

                                                                          
																			 
    } catch (e) {                                                            
      throw e;                                                               
    }                                                                        
  }                                                                          
}                                                                            
