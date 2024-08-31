import 'package:flutter/material.dart';
import 'package:flutter_test_three/testing_api/m_product_model.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';

class ApiTestController extends GetxController {
  ValueNotifier<List<ProductsClass>> allProducts = ValueNotifier([]);
  ValueNotifier<bool> xFetching = ValueNotifier(false);

  final String url = "https://fakestoreapi.com/products?limit=5";
  // final String url = "https://fakestoreapi.com/products/category/jewelery";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startFetch();// this onInit 
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> startFetch() async {
    xFetching.value = true;
    GetConnect client = GetConnect();
    Response response = await client.get(url);

    xFetching.value = false;

    if (response.body != null) {
      Iterable iterable = response.body ?? []; //always take care of null
      List<ProductsClass> temp = [];
      for (var element in iterable) {
        ProductsClass data = ProductsClass.fromAPI(data: element);
        temp.add(data);
      }
      allProducts.value = temp;
    } else {}
  }
}
