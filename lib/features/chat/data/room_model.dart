class ChatRoom {
  String? id;
  List? member;
  String? lastMessage;
  String? lastMessageTime;
  String? createdAt;

  ChatRoom({
    required this.id,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.member,
    required this.createdAt,
  });

  factory ChatRoom.fromJson(Map<String, dynamic> json) {
    return ChatRoom(
      id: json['id'] ?? '',
      lastMessage: json['last_message'] ?? "",
      lastMessageTime: json['last_message_time'] ?? "",
      member: json['member'] ?? [],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'last_message':lastMessage,
      'last_message_time': lastMessageTime,
      'member' : member,
      'created_at': createdAt,
    };
  }
}
