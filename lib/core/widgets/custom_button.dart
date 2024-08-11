import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.text,
      this.color,
      this.textcolor,
      this.onTap,
      this.icon,
      this.width = double.infinity,
      this.height = 60.0,
      this.circular = 30.0,  this.controller})
      : super(key: key);
  String? text;
  final TextEditingController? controller;
  Color? color;
  Color? textcolor;
  VoidCallback? onTap;
  IconData? icon;
  final double? width;
  final double? height;
  final double? circular;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(circular!),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text!,
                style: TextStyle(color: textcolor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
