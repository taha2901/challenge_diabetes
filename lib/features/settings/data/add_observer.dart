class AddObserver {
	int? id;
	String? email;
	String? phone;
	String? relvantRelation;
	String? userId;
	List<dynamic>? users;

	AddObserver({
		this.id, 
		this.email, 
		this.phone, 
		this.relvantRelation, 
		this.userId, 
		this.users, 
	});

	factory AddObserver.fromJson(Map<String, dynamic> json) => AddObserver(
				id: json['id'] as int?,
				email: json['email'] as String?,
				phone: json['phone'] as String?,
				relvantRelation: json['relvant_relation'] as String?,
				userId: json['user_Id'] as String?,
				users: json['users'] as List<dynamic>?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'email': email,
				'phone': phone,
				'relvant_relation': relvantRelation,
				'user_Id': userId,
				'users': users,
			};
}
