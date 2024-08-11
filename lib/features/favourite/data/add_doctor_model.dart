class AddDoctorModel {
	int? id;
	int? doctorId;
	String? userId;
	dynamic doctor;

	AddDoctorModel({this.id, this.doctorId, this.userId, this.doctor});

	factory AddDoctorModel.fromJson(Map<String, dynamic> json) {
		return AddDoctorModel(
			id: json['id'] as int?,
			doctorId: json['doctorId'] as int?,
			userId: json['userId'] as String?,
			doctor: json['doctor'] as dynamic,
		);
	}



	Map<String, dynamic> toJson() => {
				'id': id,
				'doctorId': doctorId,
				'userId': userId,
				'doctor': doctor,
			};
}
