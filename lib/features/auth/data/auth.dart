class Auth {
	String? message;
	bool? isAuthenticated;
	String? username;
	String? email;
	List<dynamic>? roles;
	String? token;
	String? expiresOn;
	String? photoUrl;
	dynamic phone;

	Auth({
		this.message, 
		this.isAuthenticated, 
		this.username, 
		this.email, 
		this.roles, 
		this.token, 
		this.expiresOn, 
		this.photoUrl, 
		this.phone, 
	});

	factory Auth.fromJson(Map<String, dynamic> json) => Auth(
				message: json['message'] as String?,
				isAuthenticated: json['isAuthenticated'] as bool?,
				username: json['username'] as String?,
				email: json['email'] as String?,
				roles: json['roles'] as List<dynamic>?,
				token: json['token'] as String?,
				expiresOn: json['expiresOn'] as String?,
				photoUrl: json['photoUrl'] as String?,
				phone: json['phone'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'isAuthenticated': isAuthenticated,
				'username': username,
				'email': email,
				'roles': roles,
				'token': token,
				'expiresOn': expiresOn,
				'photoUrl': photoUrl,
				'phone': phone,
			};
}
