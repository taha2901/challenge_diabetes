import 'package:challenge_diabetes/core/helper/cach.dart';
import 'package:challenge_diabetes/features/chat/data/msg_model.dart';
import 'package:challenge_diabetes/features/chat/data/room_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FireData {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String myUid = ChachHelper.getData(key: 'id');
  Future createRoom(String email) async {
    QuerySnapshot userEmail = await firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    if (userEmail.docs.isNotEmpty) {
      String userId = userEmail.docs.first.id;
      List<String> members = [myUid, userId]..sort(
          (a, b) => a.compareTo(b),
        );

      QuerySnapshot roomExist = await firestore
          .collection('rooms')
          .where('member', isEqualTo: members)
          .get();

      if (roomExist.docs.isEmpty) {
        ChatRoom chatRoom = ChatRoom(
          id: members.toString(),
          lastMessage: "",
          lastMessageTime: DateTime.now().millisecondsSinceEpoch.toString(),
          member: members,
          createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
        );
        await firestore
            .collection('rooms')
            .doc(members.toString())
            .set(chatRoom.toJson());
      }
    }
  }

  Future sendMessage(String uid, String message, String roomId,
      {String? type}) async {
    String msgId = const Uuid().v1();
    MessageModel msg = MessageModel(
        id: msgId,
        fromId: myUid,
        msg: message,
        createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
        read: "",
        toId: uid,
        type: type ?? 'text');
    await firestore
        .collection('rooms')
        .doc(roomId)
        .collection('messages')
        .doc(msgId)
        .set(msg.toJson());

    firestore.collection('rooms').doc(roomId).update({
      'last_message': type ?? message,
      'last_message_time': DateTime.now().millisecondsSinceEpoch.toString()
    });

    
  }


  Future readMessage(String roomId, String msgId) async {
      await firestore
          .collection('rooms')
          .doc(roomId)
          .collection('messages')
          .doc(msgId)
          .update({'read': DateTime.now().millisecondsSinceEpoch.toString()});
    }
  // sendNotification(ChatUser chatUser, String msg) async {
  //   final header = {
  //     'Content-Type': 'application/json',
  //     'Authorization':
  //         'key=AAAA6Xk6G3c:APA91bGyGwK4sHhYpR4w0n9YX4h5nT9Oq6a2mFyqO3nLp8dH4XVfLlqVQrGn6pYxXKo9'
  //   };

  //   final body = {
  //     'notification': {'title': chatUser.name, 'body': msg},
  //     'to': userToken,
  //   };

  //   final req = await http.post(
  //     Uri.parse('https://fcm.googleapis.com/fcm/send'),
  //     headers: header,
  //     body: jsonEncode(body),
  //   );
  //   print(req.statusCode);
  // }
}




/*
class FireData {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String myUid = FirebaseAuth.instance.currentUser!.uid;
  Future createRoom(String email) async {
    QuerySnapshot userEmail = await firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    if (userEmail.docs.isNotEmpty) {
      String userId = userEmail.docs.first.id;
      List<String> members = [userId, myUid]..sort(
          (a, b) => a.compareTo(b),
        );

      QuerySnapshot roomExist = await firestore
          .collection('rooms')
          .where('member', isEqualTo: members)
          .get();

      if (roomExist.docs.isEmpty) {
        ChatRoom chatRoom = ChatRoom(
          id: members.toString(),
          lastMessage: "",
          lastMessageTime: DateTime.now().millisecondsSinceEpoch.toString(),
          member: members,
          createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
        );
        await firestore
            .collection('rooms')
            .doc(members.toString())
            .set(chatRoom.toJson());
      }
    }
  }

  Future sendMessage(String uid, String message, String roomId,
      {String? type}) async {
    String msgId = const Uuid().v1();
    MessageModel msg = MessageModel(
        id: msgId,
        fromId: myUid,
        msg: message,
        createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
        read: "",
        toId: uid,
        type: type ?? 'text');
    await firestore
        .collection('rooms')
        .doc(roomId)
        .collection('messages')
        .doc(msgId)
        .set(msg.toJson());

  firestore
        .collection('rooms').doc(roomId).update({'last_message':type?? message, 'last_message_time': DateTime.now().millisecondsSinceEpoch.toString()});
  }

  Future readMessage(String roomId, String msgId) async {
    await firestore
        .collection('rooms')
        .doc(roomId)
        .collection('messages')
        .doc(msgId)
        .update({'read': DateTime.now().millisecondsSinceEpoch.toString()});
  }
}

*/