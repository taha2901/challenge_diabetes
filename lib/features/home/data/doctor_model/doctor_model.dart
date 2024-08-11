class DoctorModel {
	int? id;
	String? userName;
	String? phone;
	String? email;
	String? password;
	String? address;
	String? appointment;
	int? detectionPrice;
	String? doctorspecialization;
	String? photo;
	String? about;
	String? waitingTime;
	List<dynamic>? users;

	DoctorModel({
		this.id, 
		this.userName, 
		this.phone, 
		this.email, 
		this.password, 
		this.address, 
		this.appointment, 
		this.detectionPrice, 
		this.doctorspecialization, 
		this.photo, 
		this.about, 
		this.waitingTime, 
		this.users, 
	});

	factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
				id: json['id'] as int?,
				userName: json['userName'] as String?,
				phone: json['phone'] as String?,
				email: json['email'] as String?,
				password: json['password'] as String?,
				address: json['address'] as String?,
				appointment: json['appointment'] as String?,
				detectionPrice: json['detectionPrice'] as int?,
				doctorspecialization: json['doctorspecialization'] as String?,
				photo: json['photo'] as String?,
				about: json['about'] as String?,
				waitingTime: json['waitingTime'] as String?,
				users: json['users'] as List<dynamic>?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'userName': userName,
				'phone': phone,
				'email': email,
				'password': password,
				'address': address,
				'appointment': appointment,
				'detectionPrice': detectionPrice,
				'doctorspecialization': doctorspecialization,
				'photo': photo,
				'about': about,
				'waitingTime': waitingTime,
				'users': users,
			};
}
