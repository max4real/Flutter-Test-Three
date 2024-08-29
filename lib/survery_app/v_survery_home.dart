import 'package:flutter/material.dart';
import 'package:flutter_test_three/survery_app/c_servery_home.dart';
import 'package:flutter_test_three/survery_app/v_survery_page1.dart';
import 'package:get/get.dart';

class VServeryHomePage extends StatelessWidget {
  VServeryHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    ServeryHomeController controller = Get.put(ServeryHomeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text("Start Servery"),
      ),
      body: Center(
        child: TextButton.icon(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => VServeryPage1()));
          },
          label: Text("Start Servery"),
          icon: Icon(Icons.arrow_forward_rounded),
          iconAlignment: IconAlignment.end,
        ),
      ),
    );
  }
}
