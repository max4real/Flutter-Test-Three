import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_test_three/testing_api/resource/r_m_product_model.dart';

import 'package:get/get.dart';

class ApiTestPage extends StatefulWidget {
  const ApiTestPage({super.key});

  @override
  State<ApiTestPage> createState() => _ApiTestPageState();
}

class _ApiTestPageState extends State<ApiTestPage> {
  ValueNotifier<bool> xFetching = ValueNotifier(false);
  ValueNotifier<List<ProductModel>> allProducts = ValueNotifier([]);

  Future<void> fetchData() async {
    allProducts.value = [];

    xFetching.value = true;

    const String url = "https://fakestoreapi.com/products";

    GetConnect client = GetConnect();
    final Response response = await client.get(
      url,
    );

    xFetching.value = false;
    if (response.body != null) {
      Iterable iterable = response.body ?? [];

      List<ProductModel> temp = [];

      for (final each in iterable) {
        ProductModel productModel = ProductModel.fromApi(data: each);
        print(productModel.title);
        temp.add(productModel);
      }
      allProducts.value = temp;
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                fetchData();
              },
              child: const Text(
                "Fetch API",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: xFetching,
          builder: (context, dFetching, child) {
            if (dFetching) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ValueListenableBuilder(
                valueListenable: allProducts,
                builder: (context, dAllProducts, child) {
                  if (dAllProducts.isEmpty) {
                    return const Center(
                      child: Text("No Data Yet!"),
                    );
                  } else {
                    return ListView.builder(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      itemCount: dAllProducts.length,
                      itemBuilder: (context, index) {
                        ProductModel eachProduct = dAllProducts[index];
                        return ExpansionTile(
                          leading: Image.network(
                            eachProduct.image,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            eachProduct.title,
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${eachProduct.price}\$"),
                              Text(eachProduct.category),
                              Text(eachProduct.rating.toString())
                            ],
                          ),
                          children: [Text(eachProduct.description)],
                        );
                      },
                    );
                  }
                },
              );
            }
          },
        ));
  }
}
