class Weightcheck {
  String? userId;
  DateTime? time;
  int? weight;
  bool? sport;

  

  Weightcheck(this.userId, this.time,this.weight,this.sport);

   Weightcheck.fromJson(Map<String, dynamic> json):
    userId=json['user_Id'] as String?,
    time=json['dateTime'] != null ? DateTime.parse(json['dateTime']) : null,
    weight=json['weight'] as int?,
    sport=json['sugar_reading'] as bool? ;
    

  
}
