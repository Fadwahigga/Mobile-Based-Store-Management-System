// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gp/screens/login/login.dart';
import 'package:gp/shared/my_binding/my_binding.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/Home/home.dart';

//New Commit
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print(prefs.getString('token'));
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.prefs});
  final SharedPreferences prefs;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBinding(),
      locale: Get.deviceLocale,
      home: prefs.getString('token') != null ? const Home() : const Login(),
    );
  }
}
