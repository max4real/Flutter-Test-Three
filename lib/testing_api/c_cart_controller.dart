import 'package:flutter/material.dart';
import 'package:flutter_test_three/testing_api/m_product_model.dart';

class CartController {
  ValueNotifier<List<ProductsClass>> inCart = ValueNotifier([]);
}