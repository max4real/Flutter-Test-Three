import 'package:flutter/material.dart';

class HomePageController {
  ValueNotifier<int> count = ValueNotifier(0);
  ValueNotifier<int> result = ValueNotifier(0);

  void dosometing(int num1,int num2) {
    result.value = num1 + num2;
  }
}
