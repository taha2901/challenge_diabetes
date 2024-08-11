import 'date.profile.dart';

class Update {
	String? message;
	Date? date;

	Update({this.message, this.date});

	factory Update.fromJson(Map<String, dynamic> json) => Update(
				message: json['message'] as String?,
				date: json['date'] == null
						? null
						: Date.fromJson(json['date'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'date': date?.toJson(),
			};
}
