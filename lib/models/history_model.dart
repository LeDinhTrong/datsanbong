class HistoryModel {
  String? id;
  String? Name;
  String? Start;
  String? End;
  String? Total;
  String? Status;

  HistoryModel({
    this.id,
    this.Name,
    this.Start,
    this.End,
    this.Total,
    this.Status,
  });

  HistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    Name = json['Name'];
    Start = json['Start'];
    End = json['End'];
    Total = json['Total'];
    Status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.Name;
    data['Start'] = this.Start;
    data['End'] = this.End;
    data['Total'] = this.Total;
    data['Status'] = this.Status;
    return data;
  }
}
