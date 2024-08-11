class DeletePost {
	int? id;
	String? content;
	DateTime? createdAt;
	dynamic comments;
	String? userId;

	DeletePost({
		this.id, 
		this.content, 
		this.createdAt, 
		this.comments, 
		this.userId, 
	});

	factory DeletePost.fromJson(Map<String, dynamic> json) => DeletePost(
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
