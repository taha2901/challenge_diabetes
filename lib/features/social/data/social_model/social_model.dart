class SocialModel {
	int? id;
	String? content;
	DateTime? createdAt;
	dynamic comments;
	String? userId;

	SocialModel({
		this.id, 
		this.content, 
		this.createdAt, 
		this.comments, 
		this.userId, 
	});

	factory SocialModel.fromJson(Map<String, dynamic> json) => SocialModel(
				id: json['id'] as int?,
				content: json['content'] as String?,
				createdAt: json['createdAt'] == null
						? null
						: DateTime.parse(json['createdAt'] as String),
				comments: json['comments'] as dynamic,
				userId: json['userId'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'content': content,
				'createdAt': createdAt?.toIso8601String(),
				'comments': comments,
				'userId': userId,
			};
}
