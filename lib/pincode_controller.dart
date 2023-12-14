import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LockPinController extends GetxController {
  String enterdPin = '';
  bool isPinVisble = false;

  Widget numButton(int number) {
    return TextButton(
        onPressed: () {
          if (enterdPin.length < 4) {
            enterdPin += number.toString();
            update();
          }
        },
        child: Text(
          number.toString(),
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ));
  }

  void changVisblity(bool visible) {
    isPinVisble = !visible;
    update();
    print(isPinVisble);
  }
}
