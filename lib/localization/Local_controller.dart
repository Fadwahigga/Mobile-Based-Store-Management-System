// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../main.dart';

class MyLocaleController extends GetxController {
// Locale initialLang = prefs.getString("lang") == "ar"
//         ? const Locale("ar")
//         : const Locale("ar");
  void ChangeLang(String codelang) {
    Locale locale = Locale(codelang);
    shaedpref.setString("curruntLang", codelang);
    Get.updateLocale(locale);
  }
}
