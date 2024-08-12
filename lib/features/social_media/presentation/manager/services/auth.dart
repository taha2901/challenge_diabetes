// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:gluco/features/social_media/data/user.dart';

// class AuthMethods {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   CollectionReference users = FirebaseFirestore.instance.collection("users");

//   getUserDetails() async {
//     User currentUser = _auth.currentUser!; // الحصول على المستخدم الحالي
//     DocumentSnapshot documentSnapshot = await users
//         .doc(currentUser.uid)
//         .get(); // الحصول على وثيقة المستخدم من Firestore
//     return UserModel.fromSnap(documentSnapshot);

//   }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:gluco/core/helper/cach.dart';
// import 'package:gluco/features/auth/data/auth.dart';
// import 'package:gluco/features/social_media/data/user.dart';

// signUp({
//   required String email,
//   required String password,
//   required String username,
//   required String display,
// }) async {
//   String res = "Some Error";
//   try {
//     if (email.isNotEmpty ||
//         password.isNotEmpty ||
//         username.isNotEmpty ||
//         display.isNotEmpty) {
//       UserCredential userCredential = await _auth
//           .createUserWithEmailAndPassword(email: email, password: password);
//       UserModel userModel = UserModel(
//         uid: userCredential.user!.uid,
//         email: email,
//         displayName: display,
//         username: username,
//         bio: "",
//         profilePic: "",
//         followers: [],
//         following: [],
//       );
//       users.doc(userCredential.user!.uid).set(userModel.toJson());
//       res = "success";
//     } else {
//       res = "Enter all fields";
//     }
//   } on Exception catch (e) {
//     return e.toString();
//   }
//   return res;
// }

//   signIn({
//     required String email,
//     required String password,
//   }) async {
//     String res = "Some Error";
//     try {
//       if (email.isNotEmpty || password.isNotEmpty) {
//         await _auth.signInWithEmailAndPassword(
//             email: email, password: password);
//         res = "success";
//       } else {
//         res = "Enter all fields";
//       }
//     } on Exception catch (e) {
//       print(e);
//     }
//     return res;
//   }
// }



import 'package:challenge_diabetes/core/helper/cach.dart';
import 'package:challenge_diabetes/features/auth/data/auth.dart';
import 'package:challenge_diabetes/features/social_media/data/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireAuthSocial {
  getUserDetails() async {
    final userID = ChachHelper.getData(key: 'id');

    DocumentSnapshot documentSnapshot = await users.doc(userID).get();
    return UserModel.fromSnap(documentSnapshot);
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users =
      FirebaseFirestore.instance.collection("userSocial");

  Future<void> createUserSocial(Auth auth) async {
    final userID = ChachHelper.getData(key: 'id');
     var myPic = ChachHelper.getData(key: 'photoUrl');
    UserModel userModel = UserModel(
      uid: userID,
      email: auth.email ?? "",
      displayName: auth.username ?? "",
      username: auth.username ?? "",
      bio: "",
      profilePic: myPic.toString(),
      followers: [],
      following: [],
    );
    users.doc(userID).set(userModel.toJson());
  }
}



