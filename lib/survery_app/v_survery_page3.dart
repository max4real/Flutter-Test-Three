import 'package:flutter/material.dart';
import 'package:flutter_test_three/survery_app/c_servery_home.dart';
import 'package:flutter_test_three/survery_app/v_survery_result.dart';
import 'package:get/get.dart';

class VServeryPage3 extends StatelessWidget {
  VServeryPage3({super.key});

  @override
  Widget build(BuildContext context) {
    ServeryHomeController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text("Message"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              "Leave a message",
              style: TextStyle(fontSize: 20),
            ),
          ),
          makeTextField(),
          TextButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VSurveryResult()));
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

  Widget makeTextField() {
    ServeryHomeController controller = Get.find();
    return SizedBox(
      height: 200,
      child: TextField(
        maxLines: null,
        expands: true,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintText: 'Write a message',
          filled: true,
        ),
        onChanged: (value) {
          controller.q3 = value;
        },
      ),
    );
  }
}
