class M800BookingModel {
  String? id;
  String? User_Id;
  String? Field_Id;
  DateTime? Book_Day;
  String? Start;
  String? End;
  String? Status;
  String? Total;
  String? Message;

  M800BookingModel(
      {this.id,
      this.User_Id,
      this.Field_Id,
      this.Book_Day,
      this.Start,
      this.End,
      this.Status,
      this.Total,
      this.Message});

  M800BookingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    User_Id = json['User_Id'];
    Field_Id = json['Field_Id'];
    Book_Day = DateTime.parse(json['Book_Day']);
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
    data['Book_Day'] = this.Book_Day;
    data['Start'] = this.Start;
    data['End'] = this.End;
    data['Status'] = this.Status;
    data['Total'] = this.Total;
    data['Message'] = this.Message;
    return data;
  }
}
