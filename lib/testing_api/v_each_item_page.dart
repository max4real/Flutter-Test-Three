import 'package:flutter/material.dart';
import 'package:flutter_test_three/testing_api/m_product_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EachItems extends StatelessWidget {
  ProductsClass eachproduct;
  EachItems({super.key, required this.eachproduct});
  @override
  Widget build(BuildContext context) {
    // ProductsClass controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              eachproduct.image,
              width: 150,
              height: 150,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 10,
            ),
            Text("Total Price \$ : ${eachproduct.price}",
                style: const TextStyle(color: Colors.black, fontSize: 18)),
            const SizedBox(
              height: 10,
            ),
            Text("Category : ${eachproduct.category}",
                style: const TextStyle(color: Colors.black, fontSize: 16)),
            const SizedBox(
              height: 10,
            ),
            Text("Description : ${eachproduct.description}",
                style: const TextStyle(color: Colors.black, fontSize: 10)),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("Rating : ${eachproduct.rate}",
                    style: const TextStyle(color: Colors.black, fontSize: 16)),
                const SizedBox(
                  width: 20,
                ),
                Text("Count : ${eachproduct.count}",
                    style: const TextStyle(color: Colors.black, fontSize: 16)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
