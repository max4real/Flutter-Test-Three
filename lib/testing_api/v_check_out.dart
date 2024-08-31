import 'package:flutter/material.dart';
import 'package:flutter_test_three/testing_api/c_cart_controller.dart';
import 'package:flutter_test_three/testing_api/c_check_out.dart';
import 'package:get/get.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  CartController cartController = Get.find();
  CheckOutController checkOutController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Check Out"),
      ),
      body: ValueListenableBuilder(
        valueListenable: cartController.inCart,
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                      leading: Image.network(
                        value[index].image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.fill,
                      ),
                      title: Text(value[index].title),
                      subtitle:
                          Text("Price \$ " + value[index].price.toString()),
                      trailing: Text("X " + value[index].cartQty.toString()),
                      showTrailingIcon: true,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text("Sub Total : \$" +
                                value[index].price.toString() +
                                " X " +
                                value[index].cartQty.toString() +
                                " = "),
                            Text("\$ " +
                                checkOutController.getEachTotal(
                                    value[index].price, value[index].cartQty)),
                          ],
                        )
                      ],
                    );
                  },
                ),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Amount : \$" +
                            checkOutController.getAllTotal(value),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 118, 118, 247))),
                        child: const Padding(
                            padding: EdgeInsets.all(4),
                            child: Text("Proceed To Payment")
                            ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
