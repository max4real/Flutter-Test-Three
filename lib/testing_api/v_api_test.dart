import 'package:flutter/material.dart';
import 'package:flutter_test_three/testing_api/m_product_model.dart';
import 'package:get/get.dart';

class ApiTest extends StatefulWidget {
  const ApiTest({super.key});

  @override
  State<ApiTest> createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {
  ValueNotifier<List<Products>> allProducts = ValueNotifier([]);

  final String productUrl =
      "https://fakestoreapi.com/products/category/jewelery";

  Future<void> fetchData() async {
    GetConnect client = GetConnect();
    final Response response = await client.get(productUrl);

    if (response != null) {
      Iterable iterable = response.body;
      List<Products> temp = [];

      for (var element in iterable) {
        Products productModel = Products.fromApi(data: element);
        temp.add(productModel);
      }
      allProducts.value = temp;
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          actions: [
            TextButton(
                onPressed: () {
                  fetchData();
                },
                child: const Text(
                  "Fatch Data",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: allProducts,
          builder: (context, value, child) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemCount: value.length,
              itemBuilder: (context, index) {
                Products eachProduct = value[index];
                return ExpansionTile(
                  leading: Image.network(
                    eachProduct.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.fill,
                  ),
                  title: Text("\$ ${eachProduct.price}"),
                  );
              },
            );
          },
        ));
  }
}
