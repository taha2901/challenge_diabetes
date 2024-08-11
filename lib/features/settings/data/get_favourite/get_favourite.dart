import 'doctor.dart';

class GetFavourite {
	Doctor? doctor;

	GetFavourite({this.doctor});

	factory GetFavourite.fromJson(Map<String, dynamic> json) => GetFavourite(
				doctor: json['doctor'] == null
						? null
						: Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'doctor': doctor?.toJson(),
			};
}
