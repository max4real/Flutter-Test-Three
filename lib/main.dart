import 'package:flutter/material.dart';
import 'package:flutter_test_three/home_page/v_home_page.dart';
import 'package:flutter_test_three/survery_app/v_survery_home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: false,
    ),
    // home:  HomePageView(),
    home: VServeryHomePage(),
  ));
}
