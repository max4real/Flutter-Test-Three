import 'package:flutter_test_three/testing_api/m_product_model.dart';

class CheckOutController {
  String getEachTotal(double price, int quantity) {
    double result = price * quantity;
    return result.toString();
  }

  String getAllTotal(List<ProductsClass> temp) {
    double all_total = 0;
    for (var element in temp) {
      double temp_ = 0;
      temp_ = element.price * element.cartQty;
      all_total = all_total + temp_;
    }
    return all_total.toStringAsFixed(2);
  }
}
