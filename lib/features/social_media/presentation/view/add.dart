import 'dart:typed_data';
import 'package:challenge_diabetes/core/widgets/constants.dart';
import 'package:challenge_diabetes/core/widgets/picker.dart';
import 'package:challenge_diabetes/features/social_media/data/user.dart';
import 'package:challenge_diabetes/features/social_media/presentation/manager/provider/user_provider.dart';
import 'package:challenge_diabetes/features/social_media/presentation/manager/services/cloud.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  Uint8List? file;

  TextEditingController desCon = TextEditingController();
  uploadPost(
    String uid,
    String displayName,
    String username,
    String pic,
  ) async {
    try {
      String res = await CloudMethods().uploadPost(
          description: desCon.text,
          uid: uid,
          displayName: displayName,
          profilePic: pic,
          file: file!,
          username: username);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserProvider>(context).userModel!;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          title: const Text("إضافة منشور"),
          actions: [
            TextButton(
              onPressed: () {
                uploadPost(
                  userModel.uid,
                  userModel.displayName,
                  userModel.username,
                  userModel.profilePic,
                );
                Navigator.pop(context);
              },
              child: const Text(
                "نشر",
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/man.png'),
                  ),
                  const Gap(20),
                  Expanded(
                      child: TextField(
                    controller: desCon,
                    maxLines: 5,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "إكتب هنا ..."),
                  ))
                ],
              ),
              Expanded(
                child: file == null
                    ? Container()
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: MemoryImage(file!), fit: BoxFit.fill),
                        ),
                      ),
              ),
              const Gap(40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: kSeconderyColor,
                    padding: const EdgeInsets.all(
                      20,
                    )),
                onPressed: () async {
                  Uint8List? _file =
                      await pickImage(); // عملنا كدا عشان مينفعش استخدم await in setstate
                  setState(
                    () {
                      file = _file;
                    },
                  );
                },
                child: Icon(Icons.camera, color: kWhiteColor),
              ),
              const Gap(80),
            ],
          ),
        ));
  }
}
