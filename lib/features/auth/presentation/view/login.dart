import 'package:challenge_diabetes/core/helper/cach.dart';
import 'package:challenge_diabetes/core/widgets/custom_button.dart';
import 'package:challenge_diabetes/core/widgets/custom_show_toast.dart';
import 'package:challenge_diabetes/core/widgets/network.dart';
import 'package:challenge_diabetes/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:challenge_diabetes/features/auth/presentation/manager/login/login_state.dart';
import 'package:challenge_diabetes/features/auth/presentation/view/register.dart';
import 'package:challenge_diabetes/features/auth/presentation/view/widget/text_field.dart';
import 'package:challenge_diabetes/features/layout/presentation/view/glocu_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:iconsax_flutter/iconsax_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passWordController = TextEditingController();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            if (state.login.isAuthenticated!) {
              ChachHelper.saveData(key: 'token', value: state.login.token).then(
                (value) async {
                  userToken = state.login.token;
                  // await FireAuth().createUser(state.login);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GlucoLayout(
                        auth: state.login,
                        // imagePath: _file?.path,
                      ),
                    ),
                    (route) => false,
                  );
                },
              );
              showToast(
                msg: state.login.message ?? 'Login Successful',
                state: ToastStates.SUCCESS,
              );
            }
          }

          if (state is LoginFailure) {
            showToast(
              msg: 'الرقم السري او الايميل غير صحيح',
              state: ToastStates.ERROR,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'تسجيل الدخول',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      CustomField(
                        icon: Iconsax.direct,
                        lable: 'أدخل الايميل',
                        controller: emailController,
                        showBorder: false,
                      ),
                      const SizedBox(height: 15.0),
                      CustomField(
                        showBorder: false,
                        obscure: LoginCubit.get(context).isObsecure,
                        controller: passWordController,
                        lable: "ادخل الرقم السري",
                        icon: Iconsax.password_check,
                        isPass: true,
                        suffixIcon: LoginCubit.get(context).suffix,
                        suffixPressed: () {
                          LoginCubit.get(context).changePasswordVisibility();
                        },
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                            child: const Text("هل نسيت كلمة السر؟"),
                            onTap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      state is LoginLoaded
                          ? const Center(child: CircularProgressIndicator())
                          : CustomButton(
                              text: 'تسجيل دخول',
                              color: Colors.blue,
                              textcolor: Colors.white,
                              circular: 30.0,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passWordController.text,
                                  );
                                }
                              },
                            ),
                      const SizedBox(height: 15.0),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.all(16),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            "أنشئ حساب",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
