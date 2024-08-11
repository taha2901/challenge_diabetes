import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? userModel;
  bool isLoad = true;
  getDetails() async {
    userModel = await FireAuthSocial().getUserDetails();
    isLoad = false;
    notifyListeners();
  }
}
