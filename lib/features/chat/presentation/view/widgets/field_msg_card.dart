import 'dart:io';
import 'package:challenge_diabetes/features/chat/data/user_model.dart';
import 'package:challenge_diabetes/features/chat/presentation/manager/fire_database.dart';
import 'package:challenge_diabetes/features/chat/presentation/manager/fire_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:image_picker/image_picker.dart';

class FieldMsgCard extends StatefulWidget {
  final String roomId;
  final ChatUser chatUser;
  const FieldMsgCard({
    super.key,
    required this.roomId,
    required this.chatUser,
  });

  @override
  State<FieldMsgCard> createState() => _FieldMsgCardState();
}

class _FieldMsgCardState extends State<FieldMsgCard> {
  @override
  Widget build(BuildContext context) {
    TextEditingController msgCon = TextEditingController();
    return Row(
      children: [
        Expanded(
          child: Card(
            child: TextField(
              controller: msgCon,
              maxLines: 5,
              minLines: 1,
              decoration: InputDecoration(
                suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Iconsax.emoji_happy),
                    ),
                    IconButton(
                      onPressed: () async {
                        ImagePicker picker = ImagePicker();
                        XFile? image =
                            await picker.pickImage(source: ImageSource.gallery);

                        if (image != null) {
                          FireStorage()
                              .sendImage(file:  File(image.path),roomId:  widget.roomId ,uid: widget.chatUser.id! );
                        }
                      },
                      icon: const Icon(Iconsax.camera),
                    ),
                  ],
                ),
                border: InputBorder.none,
                hintText: "Message",
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
              ),
            ),
          ),
        ),
        IconButton.filled(
          onPressed: () {
            if (msgCon.text.isNotEmpty) {
              FireData()
                  .sendMessage(widget.chatUser.id!, msgCon.text, widget.roomId)
                  .then((value) {
                setState(() {
                  msgCon.text = "";
                });
              });
            }
          },
          icon: const Icon(Iconsax.send_1),
        ),
      ],
    );
  }
}
