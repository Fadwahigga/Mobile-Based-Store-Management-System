// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLocaleController extends GetxController {
  late SharedPreferences prefs;
// Locale initialLang = prefs.getString("lang") == "ar"
//         ? const Locale("ar")
//         : const Locale("ar");
  void ChangeLang(String codelang) {
    Locale locale = Locale(codelang);
    // prefs.setString("lang", codelang);
    Get.updateLocale(locale);
  }
}
