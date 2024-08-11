import 'package:flutter/material.dart';

class Textfieldnumber extends StatelessWidget {
  final String text2;
  final String text3;
  final TextEditingController controller;
  Textfieldnumber({required this.text2,required this.text3,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: controller,
        validator: (data) {
          if (data!.isEmpty) {
            return "required";
          }
          return null;
        },
        decoration: InputDecoration(
          isDense: true,
          hintText: text3,
          suffix: Text("$text2", style: const TextStyle(color: Colors.black87)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xff000),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xff000),
            ),
          ),
        ),
      ),
    );
  }
}
