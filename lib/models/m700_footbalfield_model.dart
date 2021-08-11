import 'package:date_format/date_format.dart';

class M700FootbalFieldModel {
  String? idField;
  String? Owner_Id;
  String? Name;
  String? Price_Per_Hour;
  String? OpenAt;
  String? CloseAt;
  String? Address;
  String? Description;
  String? Avatar_Url;

  M700FootbalFieldModel(
      {this.idField,
      this.Owner_Id,
      this.Name,
      this.Price_Per_Hour,
      this.OpenAt,
      this.CloseAt,
      this.Address,
      this.Description,
      this.Avatar_Url});

  M700FootbalFieldModel.fromJson(Map<String, dynamic> json) {
    idField = json['idField'];
    Owner_Id = json['Owner_Id'];
    Name = json['Name'];
    Price_Per_Hour = json['Price_Per_Hour'];
    OpenAt = json['OpenAt'];
    CloseAt = json['CloseAt'];
    Address = json['Address'];
    Description = json['Description'];
    Avatar_Url = json['Avatar_Url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idField'] = this.idField;
    data['Owner_Id'] = this.Owner_Id;
    data['Name'] = this.Name;
    data['Price_Per_Hour'] = this.Price_Per_Hour;
    data['OpenAt'] = this.OpenAt;
    data['CloseAt'] = this.CloseAt;
    data['Address'] = this.Address;
    data['Description'] = this.Description;
    data['Avatar_Url'] = this.Avatar_Url;
    return data;
  }
}
