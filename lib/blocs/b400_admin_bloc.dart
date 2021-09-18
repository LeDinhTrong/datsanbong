import '../models/models.dart';                                                                                                                                                    
import '../repositories/repositories.dart';                                                                                                                                        
import 'package:rxdart/rxdart.dart';                                                                                                                                                          
																																																
class AdminBloc {                                                                                                                                                            
  final _repository = Repository();                                                                                                                                                             
																																																
  // for what 400                                                                                                                                                                  
  List<M400AdminModel> listAdmin400 = [];                                                                                      
  final _adminSubject400 = PublishSubject<List<M400AdminModel>>();                                                        
  Stream<List<M400AdminModel>> get adminStream400 => _adminSubject400.stream;       
																																																
  // for what 405                                                                                                                                                                
  List<M400AdminModel> listAdmin405 = [];                                                                                    
  final _adminSubject405 = PublishSubject<List<M400AdminModel>>();                                                      
  Stream<List<M400AdminModel>> get adminStream405 => _adminSubject405.stream;   
																																																
  ///                                                                                                                                                                                           
  ///dispose subject                                                                                                                                                                            
  ///                                                                                                                                                                                           
  void dispose() {                                                                                                                                                                              
    _adminSubject400.close();                                                                                                                             
    _adminSubject405.close();                                                                                                                           
  }                                                                                                                                                                                             
																																																
  ///                                                                                                                                                                                           
  ///callWhat400 get all data Admin                                                                                                                             
  ///                                                                                                                                                                                           
  callWhat400() async {                                                                                                                                                            
    try {                                                                                                                                                                                       
      var what = 400;                                                                                                                                                              
																																																
      await _repository.executeService(what, {}).then((value) {                                                                                                                                 
        if (value.length != 0) {                                                                                                                                                                
          listAdmin400.addAll(value);                                                                                                                          
        }else{                                                                                                                                                                                  
          listAdmin400 = [];                                                                                                                                   
        }                                                                                                                                                                                       
      }).whenComplete(() {                                                                                                                                                                      
        _adminSubject400.sink.add(listAdmin400);                                                                         
      });                                                                                                                                                                                       
    } catch (e) {                                                                                                                                                                               
      print(e);                                                                                                                                                                                 
      throw e;                                                                                                                                                                                  
    }                                                                                                                                                                                           
  }                                                                                                                                                                                             
																																																
  ///                                                                                                                                                                                           
  ///callWhat405 get data limit                                                                                                                                                  
  ///@page : number pagination                                                                                                                                                                  
  ///@limit : limit of pagination                                                                                                                                                               
  ///@isPullRefresh: default is false                                                                                                                                                           
  ///                                                                                                                                                                                           
  callWhat405(int page, int limit, {bool isPullRefresh : false}) async {                                                                                                         
    try {                                                                                                                                                                                       
      var what = 405;                                                                                                                                                            
      var param = {"offset": page * limit, "limit": limit};                                                                                                                                     
																																																
      await _repository.executeService(what, param).then((value) {                                                                                                                              
        if (value.length != 0) {                                                                                                                                                                
          // clear data when pull refresh                                                                                                                                                       
          if (isPullRefresh == true) {                                                                                                                                                          
            listAdmin405 = [];                                                                                                                               
            listAdmin405.addAll(value);                                                                                                                      
          } else {                                                                                                                                                                              
            // add more data                                                                                                                                                                    
            listAdmin405.addAll(value);                                                                                                                      
          }                                                                                                                                                                                     
        }                                                                                                                                                                                       
      }).whenComplete(() {                                                                                                                                                                      
        _adminSubject405.sink.add(listAdmin405);                                                                     
      });                                                                                                                                                                                       
    } catch (e) {                                                                                                                                                                               
      print(e);                                                                                                                                                                                 
      throw e;                                                                                                                                                                                  
    }                                                                                                                                                                                           
  }                                                                                                                                                                                             
}                                                                                                                                                                                               
