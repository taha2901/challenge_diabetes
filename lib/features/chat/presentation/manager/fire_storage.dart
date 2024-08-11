import 'dart:io';
import 'package:challenge_diabetes/features/chat/presentation/manager/fire_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FireStorage {
  final FirebaseStorage fireStorage = FirebaseStorage.instance;

  Future<String?> sendImage({required File file,required String roomId,required String uid}) async {
    try {
      String ext = file.path.split('.').last;
      final ref = fireStorage
          .ref()
          .child('images/$roomId/${DateTime.now().microsecondsSinceEpoch}.$ext');
      
      // Upload the file
      await ref.putFile(file);

      // Get the download URL
      String imageUrl = await ref.getDownloadURL();
      FireData().sendMessage(uid, imageUrl , roomId , type: 'image');
      debugPrint('Image URL: $imageUrl');
      return imageUrl;
    } catch (e) {
      debugPrint('Error uploading image: $e');
      return null;
    }
  }
}
