import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomWidget extends StatelessWidget {
  CustomWidget({super.key, this.icon, this.onPressed, this.text});
  void Function()? onPressed;
  IconData? icon;
  String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: const Color.fromARGB(255, 190, 190, 190)),
      child: Row(
        children: [
          IconButton(onPressed: onPressed, icon: const Icon(Icons.arrow_back_ios_new_outlined)),
          const Spacer(),
          Text(text!),
          const SizedBox(width: 12,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon),
          )
        ],
      ),
    );
  }
}
