import 'package:challenge_diabetes/core/helper/api.dart';
import 'package:challenge_diabetes/core/widgets/network.dart';
import 'package:challenge_diabetes/features/settings/data/update/update.profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());
  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  void updateUserData(
      {required String name,
      required String email,
      required String phone}) {
    emit(UpdateUserLoaded());
    DioHelper().putData(url: UPDATE_PROFILE, token: 'Bearer $userToken', data: {
      'userName': name,
      'email': email,
      'phone': phone,
    }).then((value) async {
      final updateUser = Update.fromJson(value.data);
      debugPrint(' update status is ${updateUser.message}');
      debugPrint(updateUser.message);
      emit(UpdateUserSuccess());
    }).catchError((onError) {
      emit(UpdateUserFailure('Server error: ${onError.response?.statusCode}'));
    });
  }
}
