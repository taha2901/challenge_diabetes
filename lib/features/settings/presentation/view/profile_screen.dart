import 'dart:io';
import 'package:challenge_diabetes/features/settings/data/get.user.details.dart';
import 'package:challenge_diabetes/features/settings/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:challenge_diabetes/features/settings/presentation/view/widget/form_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge_diabetes/core/helper/cach.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, this.imagePath});
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getUserData(), 
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>( // استخدام BlocBuilder للاستماع إلى التغيرات في ProfileCubit
          builder: (context, state) {
            var profileModel;
            var myPic = ChachHelper.getData(key: 'photoUrl'); // الحصول على صورة المستخدم المحفوظة

            // تحديث البيانات بناءً على الحالة
            if (state is ProfileSuccess) {
              profileModel = state.profileModel;
            } else {
              // تعيين قيم افتراضية في حالة عدم وجود بيانات
              profileModel = UserDetails(
                phone: 'Loading...', // قيمة افتراضية أو فارغة
                username: 'Loading...', // قيمة افتراضية أو فارغة
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: imagePath != null
                              ? FileImage(File(imagePath!)) // عرض الصورة من المسار إذا كانت موجودة
                              : (myPic != null && myPic is String
                                  ? NetworkImage(myPic) // عرض الصورة المحفوظة من الشبكة إذا كانت موجودة
                                  : null),
                          child: (imagePath == null && myPic == null)
                              ? const Icon(Icons.person) // عرض أيقونة افتراضية إذا لم توجد صورة
                              : null,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profileModel.phone ?? 'Loading...', // عرض رقم الهاتف أو النص الافتراضي
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              profileModel.username ?? 'Loading...', // عرض اسم المستخدم أو النص الافتراضي
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const FormProfile(),
                    if (state is ProfileLoaded)
                      const CircularProgressIndicator(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
