import 'package:challenge_diabetes/core/helper/cach.dart';
import 'package:challenge_diabetes/features/chat/data/msg_model.dart';
import 'package:challenge_diabetes/features/chat/presentation/manager/fire_database.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';

class ChatMessageCard extends StatefulWidget {
  final int index;
  final MessageModel messageModel;
  final String roomId;
  const ChatMessageCard({
    super.key,
    required this.index,
    required this.messageModel,
    required this.roomId,
  });

  @override
  State<ChatMessageCard> createState() => _ChatMessageCardState();
}

class _ChatMessageCardState extends State<ChatMessageCard> {
  @override
  final userID = ChachHelper.getData(key: 'id');
  void initState() {
    if (widget.messageModel.toId == userID) {
      FireData().readMessage(widget.roomId, widget.messageModel.id!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isMe = widget.messageModel.fromId == userID;
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        isMe
            ? IconButton(
                onPressed: () {}, icon: const Icon(Iconsax.message_edit))
            : const SizedBox(),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(isMe ? 16 : 0),
            bottomRight: Radius.circular(isMe ? 0 : 16),
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
          )),
          color: isMe
              ? Theme.of(context).colorScheme.background
              : Theme.of(context).colorScheme.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.messageModel.type == 'image'
                      ? Image.network(widget.messageModel.msg.toString())
                      : Text(widget.messageModel.msg.toString()),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      isMe
                          ? Icon(
                              Iconsax.tick_circle,
                              color: widget.messageModel.read == ""
                                  ? Colors.grey
                                  : Colors.blueAccent,
                              size: 18,
                            )
                          : const SizedBox(),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        DateFormat.yMMMEd() // intl
                            .format(DateTime.fromMicrosecondsSinceEpoch(
                                int.parse(widget.messageModel.createdAt!)))
                            .toString(),
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
