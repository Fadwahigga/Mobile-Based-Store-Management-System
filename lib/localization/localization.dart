import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "HOME": "الصفحة الرئيسية",
           "Purchases": "الشراء",
          "Make Sale": "البيع",
          "Suppliers": "الموردين",
          "Inventory": "المخزون",
          "Accounts": "المصروفات",
          "Performance": "الاداء",
          "Generate Offers": "التخفيضات المقترحة"
        },
        "en": {
          "HOME": "HOME",
          "Purchases": "Purchases",
          "Make Sale": "Make Sale",
          "Suppliers": "Suppliers",
          "Inventory": "Inventory",
          "Accounts": "Accounts",
          "Performance": "Performance",
          "Generate Offers": "Generate Offers",
          
        },
      };
}
