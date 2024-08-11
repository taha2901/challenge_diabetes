class SugerData {
	int? id;
	int? sugarReading;
	String? measurementDate;
	DateTime? dateTime;
	dynamic user;
	String? userId;

	SugerData({
		this.id, 
		this.sugarReading, 
		this.measurementDate, 
		this.dateTime, 
		this.user, 
		this.userId, 
	});

	factory SugerData.fromJson(Map<String, dynamic> json) => SugerData(
				id: json['id'] as int?,
				sugarReading: json['sugar_reading'] as int?,
				measurementDate: json['measurement_date'] as String?,
				dateTime: json['dateTime'] == null
						? null
						: DateTime.parse(json['dateTime'] as String),
				user: json['user'] as dynamic,
				userId: json['user_Id'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'sugar_reading': sugarReading,
				'measurement_date': measurementDate,
				'dateTime': dateTime?.toIso8601String(),
				'user': user,
				'user_Id': userId,
			};
}
