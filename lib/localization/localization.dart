import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "1": "الصفحة الرئيسية",
          "2": "التحويل الى الانجليزي",
          "3": "التحويل الى العربية"
        },
        "en": {
          "1": "Home Page",
          "2": "Change To English",
          "3": "Change To Arbic"
        },
      };
}
