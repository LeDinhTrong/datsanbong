class BookingModel {
  String? id;
  String? User_Id;
  String? Field_Id;
  String? Start;
  String? End;
  String? Status;
  String? Total;
  String? Message;

  BookingModel(
      {this.id,
      this.User_Id,
      this.Field_Id,
      this.Start,
      this.End,
      this.Status,
      this.Total,
      this.Message});

  BookingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    User_Id = json['User_Id'];
    Field_Id = json['Field_Id'];
    Start = json['Start'];
    End = json['End'];
    Status = json['Status'];
    Total = json['Total'];
    Message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['User_Id'] = this.User_Id;
    data['Field_Id'] = this.Field_Id;
    data['Start'] = this.Start;
    data['End'] = this.End;
    data['Status'] = this.Status;
    data['Total'] = this.Total;
    data['Message'] = this.Message;
    return data;
  }
}
