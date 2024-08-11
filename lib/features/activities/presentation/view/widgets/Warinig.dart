import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Warning extends StatelessWidget {
  String path;
  String text;
  Warning(this.path, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 10),
      child: Row(
        children: [
          Image.asset(path, width: 94, height: 120),
          const Padding(padding: EdgeInsets.only(right: 20)),
          SizedBox(width: 250, child: Text("$text")),
        ],
      ),
    );
  }
}
