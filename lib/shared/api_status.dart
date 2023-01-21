import 'package:get/get.dart';

abstract class ApiStatus {
  static checkStatus(dynamic response) {
    if (response.statusCode == 400) {
      return Get.defaultDialog(title: "400!", middleText: "Bad request");
    } else if (response.statusCode == 401) {
      return Get.defaultDialog(
          title: "401!", middleText: "Unauthorized request");
    } else if (response.statusCode == 403) {
      return Get.defaultDialog(
          title: "403!", middleText: "Unauthorized request");
    } else if (response.statusCode == 404) {
      return Get.defaultDialog(title: "404!", middleText: "Page not found");
    } else if (response.statusCode == 408){
       return Get.defaultDialog(
          title: "408!!", middleText: "Request Time-out");
    } else if (response.statusCode == 415){
       return Get.defaultDialog(
          title: "415!", middleText: "Unsupported Media Type");
    } else if (response.statusCode >= 500 ){
       return Get.defaultDialog(
          title: "Oops!", middleText: "Server Error");
    }
  }
}
