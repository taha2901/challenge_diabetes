class Doctor {
	String? userName;
	String? doctorspecialization;
	String? about;
	String? address;
	String? photo;

	Doctor({
		this.userName, 
		this.doctorspecialization, 
		this.about, 
		this.address, 
		this.photo, 
	});

	factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
				userName: json['userName'] as String?,
				doctorspecialization: json['doctorspecialization'] as String?,
				about: json['about'] as String?,
				address: json['address'] as String?,
				photo: json['photo'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'userName': userName,
				'doctorspecialization': doctorspecialization,
				'about': about,
				'address': address,
				'photo': photo,
			};
}
