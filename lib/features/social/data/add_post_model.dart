class AddPostModel {
	String? content;
	DateTime? createdAt;

	AddPostModel({this.content, this.createdAt});

	factory AddPostModel.fromJson(Map<String, dynamic> json) => AddPostModel(
				content: json['content'] as String?,
				createdAt: json['createdAt'] == null
						? null
						: DateTime.parse(json['createdAt'] as String),
			);

	Map<String, dynamic> toJson() => {
				'content': content,
				'createdAt': createdAt?.toIso8601String(),
			};
}
