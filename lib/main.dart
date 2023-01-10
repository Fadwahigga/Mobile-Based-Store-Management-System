import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/Authentication/login.dart';
//New Commit
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
