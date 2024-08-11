class UserDetails {
	String? username;
	String? email;
	String? phone;
	String? photoUrl;
	dynamic address;

	UserDetails({this.username, this.email, this.phone, this.photoUrl, this.address});

	factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
				username: json['username'] as String?,
				email: json['email'] as String?,
				phone: json['phone'] as String?,
				photoUrl: json['photoUrl'] as String?,
				address: json['address'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'username': username,
				'email': email,
				'phone': phone,
				'photoUrl': photoUrl,
				'address': address,
			};
}
