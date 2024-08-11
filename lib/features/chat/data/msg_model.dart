class MessageModel {
  String? id;
  String? toId;
  String? fromId;
  String? msg;
  String? type;
  String? createdAt;
  String? read;

  MessageModel({
    required this.id,
    required this.fromId,
    required this.msg,
    required this.createdAt,
    required this.read,
    required this.toId,
    required this.type,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'] ?? '',
      toId: json['to_id'],
      fromId: json['from_id'],
      createdAt: json['created_at'],
      msg: json['msg'],
      read: json['read'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'read': read,
      'created_at': createdAt,
      'from_id': fromId,
      'to_id': toId,
      'msg': msg,
    };
  }
}
