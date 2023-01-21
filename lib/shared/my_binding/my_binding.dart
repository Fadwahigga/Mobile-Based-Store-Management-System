import 'package:get/get.dart';
import 'package:gp/controller/account_controller.dart';
import 'package:gp/controller/inventory_controller.dart';
import 'package:gp/controller/login_controller.dart';
import 'package:gp/controller/performance_controller.dart';
import 'package:gp/controller/sales_controller.dart';
import 'package:gp/controller/supplier_controller.dart';

import '../../controller/purchase_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(),fenix: true );
    Get.lazyPut(() => InventoryController(),fenix: true );
    Get.lazyPut(() => SupplierController(),fenix: true );
    Get.lazyPut(() => AccountController(),fenix: true );
    Get.lazyPut(() => PerformanceController(),fenix: true );
    Get.lazyPut(() => PurchaseController(),fenix: true );
    Get.lazyPut(() => SalesController(),fenix: true );
  }

}