import 'package:flutter/material.dart';
import 'package:flutter_test_three/survery_app/c_servery_home.dart';
import 'package:get/get.dart';

class VSurveryResult extends StatelessWidget {
  VSurveryResult({super.key});

  @override
  Widget build(BuildContext context) {
    ServeryHomeController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text("Result"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text("Q one: Your gender : ${controller.getGender()}"),
            Text("Q two: Your choosen interest(s) : ${controller.getInterest()}"),
            Text("Q three: Your message : ${controller.q3}"),
          ],
        ),
      ),
    );
  }
}
