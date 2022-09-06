import 'package:flutter/material.dart';
import 'package:get/get.dart';

void flutterToast(String msg) async {
  ScaffoldMessenger.of(Get.context as BuildContext).hideCurrentSnackBar();
  ScaffoldMessenger.of(Get.context as BuildContext).showSnackBar(SnackBar(
    content: Text(
      msg,
      style: const TextStyle(color: Colors.black),
    ),
    width: Get.width - 40,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    backgroundColor: Colors.white,
  ));

  // return Fluttertoast.showToast(
  //     msg: message,
  //     textColor: Colors.black,
  //     toastLength: message.length > 20 ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
  //     backgroundColor: Colors.white,
  //     fontSize: 14);
}

void disposeKeyboard() {
  return FocusManager.instance.primaryFocus?.unfocus();
}
