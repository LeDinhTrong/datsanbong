class M900ImageFieldModel {
  String? id;
  String? Field_Id;
  String? Img_Url;

  M900ImageFieldModel({this.id, this.Field_Id, this.Img_Url});

  M900ImageFieldModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    Field_Id = json['Field_Id'];
    Img_Url = json['Img_Url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Field_Id'] = this.Field_Id;
    data['Img_Url'] = this.Img_Url;
    return data;
  }
}
