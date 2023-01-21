import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gp/screens/home.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/manegerOrEmployee.dart';
import '../shared/api_status.dart';
import '../shared/constants.dart';

class LoginController extends GetxController {
  // ******* Variables ***********

  // Here is controllers for signup
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mangerPasswordController = TextEditingController();

  // Here is controller for login
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();

  // Here is controller for reset manager controller
  TextEditingController currentManagerPasswodController =
      TextEditingController();
  TextEditingController newManagerPasswordController = TextEditingController();

  // Here is controller for reset controller
  TextEditingController currentPasswodController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  // When user login and going to manager or employees page
  TextEditingController managerPassController = TextEditingController();

  // Keys
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();
  GlobalKey<FormState> resetManagerPasswordKey = GlobalKey<FormState>();

  // ******* Methods ***********

  /// ========= SignUp Method =========
  signUp({
    required GlobalKey<FormState> key,
    required String name,
    required String password,
    required String email,
    required String mangerPassword,
  }) async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (BuildContext context) => Center(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: const [
                    CircularProgressIndicator(
                      color: kprimaryColor,
                      backgroundColor: kprimaryColor,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Login...',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        http.Response response =
            await http.post(Uri.http(baseUrl, apiRegister), headers: {
          'Accept': 'application/json',
        }, body: {
          'name': name,
          'email': email,
          'password': password,
          'manager_password': mangerPassword,
        });
        var body = json.decode(response.body);
        if (response.statusCode == 201) {
          Get.back();
          prefs.setString('token', body['token'].toString());
          nameController.clear();
          passwordController.clear();
          emailController.clear();
          mangerPasswordController.clear();
          return Get.off(() => const Home());
        }
        Get.back();
        ApiStatus.checkStatus(response);
      } catch (e) {
        nameController.clear();
        passwordController.clear();
        emailController.clear();
        mangerPasswordController.clear();
        Get.back();
        return Get.defaultDialog(title: 'Oops!', middleText: e.toString());
      }
    }
  }

  /// ========== SignIn Method ==========

  signIn({
    required GlobalKey<FormState> key,
    required String password,
    required String email,
  }) async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (BuildContext context) => Center(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: const [
                    CircularProgressIndicator(
                      color: kprimaryColor,
                      backgroundColor: kprimaryColor,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Login...',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        http.Response response =
            await http.post(Uri.http(baseUrl, apiLogin), headers: {
          'Accept': 'application/json',
        }, body: {
          'email': email,
          'password': password,
        });
        var body = json.decode(response.body);
        print(body);
        if (response.statusCode == 201) {
          Get.back();
          prefs.setString('token', body['token'].toString());
          passwordLoginController.clear();
          emailLoginController.clear();
          return Get.off(() => const ManegerOrEmployeePage());
        }
        Get.back();
        ApiStatus.checkStatus(response);
      } catch (e) {
        passwordLoginController.clear();
        emailLoginController.clear();
        Get.back();
        return Get.defaultDialog(title: 'Oops!', middleText: e.toString());
      }
    }
  }

  /// ========== Reset Password ==========
  resetPassword({
    required GlobalKey<FormState> key,
    required String currentPasswod,
    required String newPassword,
    required bool isManager,
  }) async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (BuildContext context) => Center(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: const [
                    CircularProgressIndicator(
                      color: kprimaryColor,
                      backgroundColor: kprimaryColor,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Changing...',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        http.Response response = await http
            .post(Uri.http(baseUrl, isManager ? apiChangePasswordManager : apiChangePassword), headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${prefs.getString('token')}'
        }, body: {
          'password': currentPasswod,
          'new_password': newPassword,
        });
        var body = json.decode(response.body);
        print("Change Passworddddddddddddddd");
        print(body);
        if (response.statusCode == 201 || response.statusCode == 200) {
          Get.back();
          passwordLoginController.clear();
          emailLoginController.clear();
          Get.off(() => const Home(),
              transition: Transition.zoom);
          return Get.defaultDialog(
              title: "Change Passwod",
              middleText: "Changed password successfully ;)");
        }
        Get.back();
        ApiStatus.checkStatus(response);
      } catch (e) {
        passwordLoginController.clear();
        emailLoginController.clear();
        Get.back();
        return Get.defaultDialog(title: 'Oops!', middleText: e.toString());
      }
    }
  }

  /// ========== Sign in manager with just password ==========
   signInManager({
    required String password
  }) async {
    if (password.trim().length > 7) {
      showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (BuildContext context) => Center(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: const [
                    CircularProgressIndicator(
                      color: kprimaryColor,
                      backgroundColor: kprimaryColor,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'login...',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        http.Response response = await http
            .post(Uri.http(baseUrl, apiLoginManager), headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${prefs.getString('token')}'
        }, body: {
          'manager_password': password.toString(),
        });
        if (response.statusCode == 201 || response.statusCode == 200) {
          Get.back();
          managerPassController.clear();
          return Get.to(() => const Home(),
              transition: Transition.zoom);
        }
        Get.back();
        ApiStatus.checkStatus(response);
      } catch (e) {
        managerPassController.clear();
        Get.back();
        return Get.defaultDialog(title: 'Oops!', middleText: e.toString());
      }
    }
  }
}
