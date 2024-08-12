import 'package:challenge_diabetes/features/social_media/data/user.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';

class UserProvider with ChangeNotifier {
  UserModel? userModel;

  bool isLoad = true;
  getDetails() async {
    userModel = await FireAuthSocial().getUserDetails();
    isLoad = false;
    notifyListeners();
  }
}
