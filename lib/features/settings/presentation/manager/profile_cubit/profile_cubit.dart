import 'package:challenge_diabetes/core/helper/api.dart';
import 'package:challenge_diabetes/core/widgets/network.dart';
import 'package:challenge_diabetes/features/auth/data/auth.dart';
import 'package:challenge_diabetes/features/settings/data/get.user.details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  UserDetails? profileModel;

  Future<void> getUserData() async {
    emit(ProfileLoaded());
    try {
      final response = await DioHelper().getData(
        url: 'Auth/Get User Details',
        token: 'Bearer $userToken',
      );
      profileModel = UserDetails.fromJson(response.data);
      debugPrint('token in profile is $userToken');
      emit(ProfileSuccess(profileModel!));
    } catch (onError) {
      emit(ProfileFailure('Server error: ${onError.toString()}'));
    }
  }
}


  // ChangePassword? changePassword;

  // void changePasswordMethod({
  //   required String userCurrentPassword,
  //   required String newPassword,
  // }) {
  //   emit(ChangePassLoaded());
  //   DioHelper().postData(
  //     url: change_password,
  //     token: userToken,
  //     data: {
  //       'current_password': currentPassword,
  //       'new_password': newPassword,
  //     },
  //   ).then((value) {
  //     print('Change password success: ${value.data}');

  //     changePassword = ChangePassword.fromJson(value.data);
  //     ChachHelper.saveData(key: 'password', value: newPassword);
  //     currentPassword = ChachHelper.getData(key: 'password');
  //     emit(ChangePassSuccess(changePassword!));
  //   }).catchError((onError) {
  //     if (onError is DioError) {
  //       print(
  //           'Dio error: ${onError.response?.statusCode} - ${onError.message}');
  //       emit(ChangePassFailure(
  //         'Server error: ${onError.response?.statusCode} - ${onError.message}',
  //       ));
  //     } else {
  //       print(onError.toString());
  //       emit(ChangePassFailure('An unknown error occurred.'));
  //     }
  //   });
  // }

  // Auth? updateUser;

  // void updateUserData(
  //     {required String name, required String email, required String phone}) {
  //   emit(UpdateUserLoaded());
  //   DioHelper().putData(url: UPDATE_PROFILE, token: userToken, data: {
  //     'name': name,
  //     'email': email,
  //     'phone': phone,
  //   }).then((value) async {
  //     updateUser = Auth.fromJson(value.data);
  //     print(' update status is ${updateUser!.status}');
  //     print(updateUser!.message);
  //     print(updateUser!.data!.name);
  //     await getUserData();
  //     emit(UpdateUserSuccess(updateUser!));
  //   }).catchError((onError) {
  //     if (onError is DioError) {
  //       print(
  //           'Dio error: ${onError.response?.statusCode} - ${onError.message}');
  //       emit(
  //           UpdateUserFailure('Server error: ${onError.response?.statusCode}'));
  //     } else {
  //       print(onError.toString());
  //       emit(UpdateUserFailure('An unknown error occurred.'));
  //     }
  //   });
  
