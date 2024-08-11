import 'data.dart';

class ReservationModel {
	String? message;
	Data? data;

	ReservationModel({this.message, this.data});

	factory ReservationModel.fromJson(Map<String, dynamic> json) {
		return ReservationModel(
			message: json['message'] as String?,
			data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'message': message,
				'data': data?.toJson(),
			};
}
