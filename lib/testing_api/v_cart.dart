import 'package:flutter/material.dart';
import 'package:flutter_test_three/testing_api/c_cart_controller.dart';
import 'package:flutter_test_three/testing_api/m_product_model.dart';
import 'package:flutter_test_three/testing_api/v_check_out.dart';
import 'package:get/get.dart';
import 'package:flutter_test_three/testing_api/c_api_test.dart';

class ShoppingCart extends StatelessWidget {
  ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Shopping Cart"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,
                    MaterialPageRoute(builder: (contex) => CheckOut()));
          }, icon: Icon(Icons.shopping_cart_checkout_rounded,size: 25,))
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: cartController.inCart,
        builder: (context, value, child) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, mainAxisSpacing: 5, crossAxisSpacing: 5),
            padding: const EdgeInsets.all(8),
            itemCount: value.length,
            itemBuilder: (context, index) {
              ProductsClass eachproduct = value[index];
              return Card(
                elevation: 50,
                shadowColor: Colors.black,
                // color: const Color.fromARGB(255, 146, 153, 237),
                color: Colors.white,
                child: SizedBox(
                  width: 300,
                  height: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Image.network(
                          eachproduct.image,
                          width: 150,
                          height: 150,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 10,
                        ), //SizedBox
                        Text(
                          "\$ " + eachproduct.price.toString(),
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ), //Textstyle
                        ), //Text
                        const SizedBox(
                          height: 10,
                        ), //SizedBox
                        Text(
                          eachproduct.title,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ), //Textstyle
                        ), //Text
                        const SizedBox(
                          height: 10,
                        ), //SizedBox
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 70,
                              child: ElevatedButton(
                                onPressed: () {
                                  List<ProductsClass> temp = [...value];
                                  if (eachproduct.cartQty == 1) {
                                    List<ProductsClass> temp = [...value];

                                    temp.removeWhere((element) =>
                                        element.id == eachproduct.id);
                                    cartController.inCart.value = temp;
                                  }
                                  if (eachproduct.cartQty > 1) {
                                    temp
                                        .firstWhere((element) =>
                                            element.id == eachproduct.id)
                                        .cartQty -= 1;
                                    cartController.inCart.value = temp;
                                  }
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color.fromARGB(
                                            255, 118, 118, 247))),
                                child: const Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Icon(Icons.remove)),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(eachproduct.cartQty.toString()),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 70,
                              child: ElevatedButton(
                                onPressed: () {
                                  List<ProductsClass> temp = [...value];

                                  temp
                                      .firstWhere((element) =>
                                          element.id == eachproduct.id)
                                      .cartQty += 1;

                                  cartController.inCart.value = temp;
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color.fromARGB(
                                            255, 118, 118, 247))),
                                child: const Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Icon(Icons.add)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
