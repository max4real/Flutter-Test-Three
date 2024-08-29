import 'package:flutter/material.dart';

class ServeryHomeController {
  ValueNotifier<int?> q1 = ValueNotifier(1);
  ValueNotifier<List<bool?>> q2 = ValueNotifier([false, false, false]);
  String q3 = "";

  String getGender() {
    print(q1.value);
    switch (q1.value) {
      case 1:
        return "Male";
      case 2:
        return "Female";
      case 3:
        return "I'd rather not say";
      default:
        return "maledf";
    }
  }

  String getInterest() {
    String interest = "";
    if (q2.value[0] == true) {
      interest = interest + "Java:";
    }
    if (q2.value[1] == true) {
      interest = interest + "C#:";
    }
    if (q2.value[2] == true) {
      interest = interest + "Dart:";
    }
    return interest;
  }
}
