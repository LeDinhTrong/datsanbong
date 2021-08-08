class M500UserModel {
  String? id;
  String? Name;
  String? Phone;
  String? Email;
  String? Password;
  String? Avatar_Url;

  M500UserModel({
    this.id,
    this.Name,
    this.Phone,
    this.Email,
    this.Password,
    this.Avatar_Url,
  });

  M500UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    Name = json['Name'];
    Phone = json['Phone'];
    Email = json['Email'];
    Password = json['Password'];
    Avatar_Url = json['Avatar_Url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.Name;
    data['Phone'] = this.Phone;
    data['Email'] = this.Email;
    data['Password'] = this.Password;
    data['Avatar_Url'] = this.Avatar_Url;
    return data;
  }
}
