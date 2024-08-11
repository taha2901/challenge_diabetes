class Sugarcheck {
  String? userId;
  DateTime? time;
  String? measurement_date;
  int? sugar_reading;
  String? status;

  Sugarcheck(this.userId, this.time, this.measurement_date, this.sugar_reading, this.status);

  Sugarcheck.fromJson(Map<String, dynamic> json):
    userId=json['user_Id'] as String?,
    time=json['dateTime'] != null ? DateTime.parse(json['dateTime']) : null,
    measurement_date=json['measurement_date'] as String?,
    sugar_reading=json['sugar_reading'] as int? ,
    status=json['status'] as String?;

  
}
