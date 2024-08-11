class Date {
	String? userName;
	String? email;
	String? phone;

	Date({this.userName, this.email, this.phone});

	factory Date.fromJson(Map<String, dynamic> json) => Date(
				userName: json['userName'] as String?,
				email: json['email'] as String?,
				phone: json['phone'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'userName': userName,
				'email': email,
				'phone': phone,
			};
}
