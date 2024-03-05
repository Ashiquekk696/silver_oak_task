import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silver_oak_test/constants/colors.dart';

import 'views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true, scaffoldBackgroundColor: AppColors.black),
      home: HomeView(),
    );
  }
}
