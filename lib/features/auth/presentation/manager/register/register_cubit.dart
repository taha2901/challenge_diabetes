import 'dart:io';
import 'package:challenge_diabetes/core/helper/api.dart';
import 'package:challenge_diabetes/core/helper/cach.dart';
import 'package:challenge_diabetes/core/widgets/network.dart';
import 'package:challenge_diabetes/features/auth/data/auth.dart';
import 'package:challenge_diabetes/features/auth/presentation/manager/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:dio/dio.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  Future<void> userRegister({
    required String username,
    required String email,
    required String password,
    required String phone,
    required File image,
    required String address,
  }) async {
    emit(RegisterLoaded());
    try {
      FormData formData = FormData.fromMap({
        'Username': username,
        'Email': email,
        'Phone': phone,
        'Photo': await MultipartFile.fromFile(image.path,
            filename: image.path.split('/').last),
        'Password': password,
        'Address': address,
      });
      var response = await DioHelper().postData(
        url: REGISTER,
        isMultipart: true,
        data: formData,
      );
      debugPrint("Response received: ${response.data}");
      final registerModel = Auth.fromJson(response.data);
      final token = registerModel.token;
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);

      final userId = decodedToken['uid'];
      await ChachHelper.saveData(key: 'id', value: userId);
      var myPic = await ChachHelper.saveData(key: 'photoUrl', value: registerModel.photoUrl);
      debugPrint('Registration successful: ${registerModel.message}');
      emit(RegisterSuccess(registerModel: registerModel));
    } catch (onError) {
      debugPrint('Error during registration: ${onError.toString()}');
      emit(RegisterFailure(onError.toString()));
    }
  }

  bool isObsecure = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isObsecure = !isObsecure;
    suffix =
        isObsecure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterchangePasswordVisibility());
  }
}
