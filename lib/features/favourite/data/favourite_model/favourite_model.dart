import 'doctor.dart';

class FavouriteModel {
	Doctor? doctor;

	FavouriteModel({this.doctor});

	factory FavouriteModel.fromJson(Map<String, dynamic> json) {
		return FavouriteModel(
			doctor: json['doctor'] == null
						? null
						: Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'doctor': doctor?.toJson(),
			};
}
