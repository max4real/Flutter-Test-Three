import 'package:flutter/material.dart';
import 'package:flutter_test_three/survery_app/c_servery_home.dart';
import 'package:flutter_test_three/survery_app/v_survery_page3.dart';
import 'package:get/get.dart';

class VSurveryPage2 extends StatelessWidget {
  VSurveryPage2({super.key});

  @override
  Widget build(BuildContext context) {
    ServeryHomeController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Question Two"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              "Select Interest",
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: makeCheckBox(),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VServeryPage3()));
            },
            label: Text(
              "Next",
              style: TextStyle(color: Colors.green, fontSize: 18),
            ),
            icon: Icon(
              Icons.arrow_forward_rounded,
              color: Colors.green,
            ),
            iconAlignment: IconAlignment.end,
          ),
        ],
      ),
    );
  }

  Widget makeCheckBox() {
    ServeryHomeController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ValueListenableBuilder(
        valueListenable: controller.q2,
        builder: (context, valuelist, child) {
          return Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: valuelist[0],
                    onChanged: (bool? value) {
                      List<bool?> temp = [...valuelist];
                      temp[0] = value;
                      controller.q2.value = temp;
                    },
                  ),
                  const Text("Java")
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: valuelist[1],
                    onChanged: (bool? value) {
                      List<bool?> temp = [...valuelist];
                      temp[1] = value;
                      controller.q2.value = temp;
                    },
                  ),
                  const Text("C#")
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: valuelist[2],
                    onChanged: (bool? value) {
                      List<bool?> temp = [...valuelist];
                      temp[2] = value;
                      controller.q2.value = temp;
                    },
                  ),
                  const Text("Dart")
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
