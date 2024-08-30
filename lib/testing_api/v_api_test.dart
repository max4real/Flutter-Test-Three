import 'package:flutter/material.dart';
import 'package:flutter_test_three/testing_api/c_api_test.dart';
import 'package:flutter_test_three/testing_api/m_product_model.dart';
import 'package:flutter_test_three/testing_api/v_cart.dart';
import 'package:flutter_test_three/testing_api/v_each_item_page.dart';
import 'package:get/get.dart';

class ApiTest extends StatefulWidget {
  const ApiTest({super.key});

  @override
  State<ApiTest> createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {
  @override
  Widget build(BuildContext context) {
    ApiTestController controller = Get.put(ApiTestController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (contex) => ShoppingCart()));
              },
              icon: const Icon(
                Icons.shopping_cart,
                size: 25,
                color: Colors.white,
              ))
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.xFetching,
        builder: (context, dFetching, child) {
          if (dFetching) {
            return const Center(
              child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 118, 118, 247)),
            );
          } else {
            return ValueListenableBuilder(
              valueListenable: controller.allProducts,
              builder: (context, value, child) {
                return RefreshIndicator(
                  onRefresh: () async {
                    controller.startFetch();
                  },
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5),
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
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (contex) =>
                                                      EachItems(
                                                        eachproduct:
                                                            eachproduct,
                                                      )));
                                        },
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    const Color.fromARGB(
                                                        255, 118, 118, 247))),
                                        child: const Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: const Text('Visit'),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 70,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          controller.inCart.value
                                              .add(eachproduct);

                                          ///
                                        },
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    const Color.fromARGB(
                                                        255, 118, 118, 247))),
                                        child: const Padding(
                                            padding: EdgeInsets.all(4),
                                            child: Icon(Icons
                                                .add_shopping_cart_rounded)),
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
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
