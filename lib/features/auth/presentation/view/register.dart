import 'dart:io';
import 'package:challenge_diabetes/core/helper/cach.dart';
import 'package:challenge_diabetes/core/widgets/custom_button.dart';
import 'package:challenge_diabetes/core/widgets/custom_show_toast.dart';
import 'package:challenge_diabetes/core/widgets/network.dart';
import 'package:challenge_diabetes/features/auth/presentation/manager/register/register_cubit.dart';
import 'package:challenge_diabetes/features/auth/presentation/manager/register/register_state.dart';
import 'package:challenge_diabetes/features/auth/presentation/view/widget/text_field.dart';
import 'package:challenge_diabetes/features/chat/presentation/manager/fire_auth.dart';
import 'package:challenge_diabetes/features/layout/presentation/view/glocu_layout.dart';
import 'package:challenge_diabetes/features/social_media/presentation/manager/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  File? _file;

  Future pickerGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? myfile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _file = File(myfile!.path);
    });
  }

  var imageController = TextEditingController();
  var emailController = TextEditingController();
  var passWordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) async {
          if (state is RegisterSuccess) {
            if (state.registerModel.isAuthenticated == true) {
              await ChachHelper.saveData(
                      key: 'token', value: state.registerModel.token)
                  .then(
                (value) async {
                  userToken = '${state.registerModel.token}';
                  await FireAuth().createUser(state.registerModel);
                  await FireAuthSocial().createUserSocial(state.registerModel);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GlucoLayout(
                        auth: state.registerModel,
                        imagePath: _file?.path,
                      ),
                    ),
                    (route) => false,
                  );
                  debugPrint('Image Path: ${_file?.path}');
                },
              );
              showToast(
                  msg: state.registerModel.message.toString(),
                  state: ToastStates.SUCCESS);
            }
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
                          child: Text('إنشاء حساب',
                              style: Theme.of(context).textTheme.bodyLarge)),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.grey[300],
                              backgroundImage:
                                  _file != null ? FileImage(_file!) : null,
                              child: _file == null
                                  ? const Icon(
                                      Icons.person,
                                      size: 80,
                                      color: Colors.blue,
                                    )
                                  : null,
                            ),
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: InkWell(
                                onTap: () {
                                  pickerGallery();
                                },
                                child: const CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: 15,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomField(
                        icon: Icons.person,
                        lable: 'أدخل اسمك',
                        controller: nameController,
                        showBorder: false,
                        onSubmitted: (value) {
                          nameController.text = value;
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      CustomField(
                        icon: Iconsax.direct,
                        lable: 'أدخل الايميل',
                        controller: emailController,
                        showBorder: false,
                        onSubmitted: (value) {
                          emailController.text = value;
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      CustomField(
                        icon: Iconsax.direct,
                        lable: 'أدخل رقم الهاتف',
                        controller: phoneController,
                        showBorder: false,
                        onSubmitted: (value) {
                          phoneController.text = value;
                        },
                      ),
                      CustomField(
                        icon: Iconsax.direct,
                        lable: 'أدخل عنوانك',
                        controller: addressController,
                        showBorder: false,
                        onSubmitted: (value) {
                          addressController.text = value;
                        },
                      ),
                      CustomField(
                        showBorder: false,
                        obscure: RegisterCubit.get(context).isObsecure,
                        controller: passWordController,
                        lable: "ادخل الرقم السري",
                        icon: Iconsax.password_check,
                        isPass: true,
                        onSubmitted: (value) {
                          passWordController.text = value;
                        },
                        suffixIcon: RegisterCubit.get(context).suffix,
                        suffixPressed: () {
                          RegisterCubit.get(context).changePasswordVisibility();
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      if (state is! RegisterLoaded)
                        CustomButton(
                          color: Colors.blue,
                          text: 'تسجيل',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              RegisterCubit.get(context).userRegister(
                                username: nameController.text,
                                email: emailController.text,
                                address: addressController.text,
                                password: passWordController.text,
                                phone: phoneController.text,
                                image: _file!,
                              );
                            }
                          },
                        ),
                      if (state is RegisterLoaded)
                        const Center(
                          child: CircularProgressIndicator(),
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
