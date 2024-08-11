class Pressurecheck {
  String? userId;
  DateTime? time;
  int? systolicpressure;
  int? diastolicpressure;
  int? heartrate;
  String? status;

  Pressurecheck({this.userId, this.time,this.systolicpressure,this.diastolicpressure,this.heartrate,this.status});

  Pressurecheck.fromJson(Map<String, dynamic> json):
    userId=json['user_Id'] as String?,
    time=json['dateTime'] != null ? DateTime.parse(json['dateTime']) : null,
    systolicpressure=json['systolic_pressure'] as int?,
    diastolicpressure=json['diastolic_pressure'] as int? ,
    heartrate=json['heart_rate'] as int?,
    status=json['status'] as String?;

  
}
