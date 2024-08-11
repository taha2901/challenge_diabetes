import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String msg, required ToastStates state}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastStates {SUCCESS, ERROR , WARNING}

Color chooseToastColor(ToastStates state){
  Color color;
  switch(state) 
  {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MzdmYjU1ZGUyMjIwNmExNGY3OTYwMCIsImlhdCI6MTcxNTEyNDk0MiwiZXhwIjoxNzE3NzE2OTQyfQ.01CWOLMvB_e-iC3yk2LXR9a4RIY40B9HHxdw_jR32oY';

