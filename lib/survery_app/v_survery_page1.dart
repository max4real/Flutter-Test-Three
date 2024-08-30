import 'package:flutter/material.dart';
import 'package:flutter_test_three/survery_app/c_servery_home.dart';
import 'package:flutter_test_three/survery_app/v_survery_page2.dart';
import 'package:get/get.dart';

class VServeryPage1 extends StatelessWidget {
  VServeryPage1({super.key});

  @override
  Widget build(BuildContext context) {
    ServeryHomeController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text("Question One"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              "Select Gender",
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: makeRadio(),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VSurveryPage2()));
            },
            label: const Text(
              "Next",
              style: TextStyle(color: Colors.green, fontSize: 18),
            ),
            icon: const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.green,
            ),
            iconAlignment: IconAlignment.end,
          ),
        ],
      ),
    );
  }

  int? selectedRadio = 1;

  Widget makeRadio() {
    ServeryHomeController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 20),
      child: ValueListenableBuilder(
        valueListenable: controller.q1,
        builder: (context, value, child) {
          return Column(
            children: [
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: value,
                    activeColor: Colors.greenAccent,
                    onChanged: (value) {
                      controller.q1.value = value;
                    },
                  ),
                  const Text("Male")
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: value,
                    activeColor: Colors.greenAccent,
                    onChanged: (value) {
                      controller.q1.value = value;
                    },
                  ),
                  const Text("Female")
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 3,
                    groupValue: value,
                    activeColor: Colors.greenAccent,
                    onChanged: (value) {
                      controller.q1.value = value;
                    },
                  ),
                  const Text("I'd rather not say")
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
