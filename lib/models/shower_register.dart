class ShowerRegister {
  int id;
  DateTime beginDate;
  DateTime endDate;
  int difference;

  ShowerRegister({this.beginDate, this.endDate});

  Map toJson() => {
    'beginDate': beginDate.toIso8601String(),
    'endDate': endDate.toIso8601String()
  };


  ShowerRegister.fromJson(Map json) {
    this.id = json['ID'];
    this.beginDate = DateTime.parse(json['beginDate']);
    this.endDate = DateTime.parse(json['endDate']);
    this.difference = this.endDate.difference(this.beginDate).inMinutes;
  }

}
