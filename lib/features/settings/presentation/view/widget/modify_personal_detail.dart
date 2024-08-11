import 'package:challenge_diabetes/core/helper/cach.dart';
import 'package:challenge_diabetes/core/widgets/custom_button.dart';
import 'package:challenge_diabetes/core/widgets/custom_show_toast.dart';
import 'package:challenge_diabetes/core/widgets/custom_text_field.dart';
import 'package:challenge_diabetes/features/settings/presentation/manager/update_cubit/update_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});
  @override
  Widget build(BuildContext context) {
    var myPic = ChachHelper.getData(key: 'photoUrl');
    TextEditingController nameCon = TextEditingController();
    TextEditingController emailCon = TextEditingController();
    TextEditingController phoneCon = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateUserSuccess) {
          showToast(msg: 'Update Succesfully', state: ToastStates.SUCCESS);
        } else if (state is UpdateUserFailure) {
          showToast(msg: 'Update Failed', state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("تفاصيل الشخصيه"),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 24)),
                  CircleAvatar(
                    radius: 70,
                    backgroundColor:
                        Colors.grey.shade200, 
                    child: ClipOval(
                      child: Image.network(
                        myPic.toString(),
                        fit: BoxFit
                            .cover, 
                        width: 140,
                        height: 140,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.person,
                            size: 70,
                          );
                        },
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 60)),
                  CustomTextField(
                    hint: 'أدخل إسمك',
                    controller: nameCon,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    hint: 'أدخل ايميلك',
                    controller: emailCon,
                    fillColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    hint: 'أدخل رقم تلفونك',
                    controller: phoneCon,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: state is UpdateUserLoaded
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CustomButton(
                            text: 'حفظ',
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                UpdateProfileCubit.get(context).updateUserData(
                                  name: nameCon.text,
                                  phone: phoneCon.text,
                                  email: emailCon.text,
                                );
                              }
                            },
                            color: Colors.blue,
                            textcolor: Colors.white,
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
