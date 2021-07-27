class M400AdminModel {                                           
  String? id;
  String? Name;
  String? Email;
  String? Password;
                                                                 
																	
  M400AdminModel({this.id,this.Name,this.Email,this.Password});                                         
																	
  M400AdminModel.fromJson(Map<String, dynamic> json) {           
    id = json['id'];
    Name = json['Name'];
    Email = json['Email'];
    Password = json['Password'];                                                                 
  }                                                                 
																	
  Map<String, dynamic> toJson() {                                   
    final Map<String, dynamic> data = new Map<String, dynamic>();   
    data['id'] = this.id;
    data['Name'] = this.Name;
    data['Email'] = this.Email;
    data['Password'] = this.Password;                                                                 
    return data;                                                    
  }                                                                 
}                                                                   
