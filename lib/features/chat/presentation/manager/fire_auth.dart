import 'package:challenge_diabetes/core/helper/cach.dart';
import 'package:challenge_diabetes/features/auth/data/auth.dart';
import 'package:challenge_diabetes/features/chat/data/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireAuth {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(Auth auth) async {
    final userID = ChachHelper.getData(key: 'id');
    ChatUser chatUser = ChatUser(
        id: userID,
        name: auth.username ,
        about: 'hello , iam using taha',
        createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
        email: auth.email ?? '',
        image: '',
        lastActivated: DateTime.now().millisecondsSinceEpoch.toString(),
        online: false,
        pushToken: auth.token ?? '');
    await _firestore.collection('users').doc(userID).set(chatUser.toJson());
  }
}

