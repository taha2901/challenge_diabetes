import 'package:challenge_diabetes/core/helper/api.dart';
import 'package:challenge_diabetes/core/widgets/network.dart';
import 'package:challenge_diabetes/features/auth/data/auth.dart';
import 'package:challenge_diabetes/features/auth/presentation/manager/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoaded());
    DioHelper().postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      final loginModel = Auth.fromJson(value.data);
      // final token = loginModel.token;
      // Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);

      // final userId = decodedToken['uid'];
      // ChachHelper.saveData(key: 'id', value: userId);
      // print('UserId Is $userId');

      
      emit(LoginSuccess(loginModel));
    }).catchError((onError) {
      debugPrint('Error in login cubit: ${onError.toString()}');
      emit(LoginFailure(onError.toString()));
    });
  }

  bool isObsecure = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isObsecure = !isObsecure;
    suffix =
        isObsecure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginchangePasswordVisibility());
  }
}
