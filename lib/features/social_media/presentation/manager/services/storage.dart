import 'dart:typed_data';
import 'package:challenge_diabetes/core/helper/cach.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  FirebaseStorage _storage = FirebaseStorage.instance;
  final userID = ChachHelper.getData(key: 'id');
  uploadImageToStorage(Uint8List file, String childName, bool isPost) async {
    String id = Uuid().v1();
    Reference ref =
        _storage.ref().child(childName).child(userID);
    if (isPost) {
      ref = ref.child(id);
    }

    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snapshot = await uploadTask;
    String url = await snapshot.ref.getDownloadURL();
    return url;
  }
}
