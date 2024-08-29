import 'package:flutter/material.dart';
import 'package:flutter_test_three/home_page/c_home_page.dart';

class HomePageView extends StatelessWidget {
  HomePageView({super.key});
  HomePageController controller = HomePageController();

  int input1 = 0;
  int input2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  controller.count.value = controller.count.value + 1;
                },
                icon: const Icon(Icons.add)),
            ValueListenableBuilder(
              valueListenable: controller.count,
              builder: (context, value, child) {
                return Text(value.toString());
              },
            ),
            IconButton(
                onPressed: () {
                  controller.count.value = controller.count.value - 1;
                },
                icon: const Icon(Icons.remove)),
            const SizedBox(
              width: double.infinity,
              height: 20,
            ),
            TextField(
              onChanged: (value) {
                input1 = int.parse(value);
                controller.dosometing(input1, input2);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                label: Text("first number"),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 20,
            ),
            TextField(
              onChanged: (value) {
                input2 = int.parse(value);
                controller.dosometing(input1, input2);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                label: Text("second number"),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 20,
            ),
            ValueListenableBuilder(
              valueListenable: controller.result,
              builder: (context, value, child) {
                return  Text('result : $value');
              },
            ),
          ],
        ),
      ),
    );
  }
}
