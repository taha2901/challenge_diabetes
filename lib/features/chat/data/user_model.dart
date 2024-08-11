class ChatUser {
  String? id;
  String? name;
  String? email;
  String? about;
  String? image;
  String? createdAt;
  String? lastActivated;
  String? pushToken;
  bool? online;

  ChatUser({
    required this.id,
    required this.name,
    required this.about,
    required this.createdAt,
    required this.email,
    required this.image,
    required this.lastActivated,
    required this.online,
    required this.pushToken,
  });

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(
        id: json['id'] ?? '',
        name: json['name'],
        about: json['about'],
        createdAt: json['created_at'],
        email: json['email'],
        image: json['image'],
        lastActivated: json['last_activated'],
        online: json['online'],
        pushToken: json['push_token']);
  }

  Map<String,dynamic> toJson() {
    return {
      'id':id,
      'name':name,
      'about':about,
      'created_at': createdAt,
      'email':email,
      'image':image,
      'last_activated':lastActivated,
      'online':online,
      'push_token':pushToken,
    };
  }
}
