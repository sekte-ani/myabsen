import 'package:MyAbsen/theme.dart';
import 'package:MyAbsen/ui/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  validateEmail(String? email) {
    if (!GetUtils.isEmail(email ?? '')) {
      return 'Email is not valid';
    }
    return null;
  }

  validatePassword(String? password) {
    if (!GetUtils.isLengthGreaterOrEqual(password, 2)) {
      return 'Password is not valid';
    }
    return null;
  }

  Future onLogin() async {
    Get.focusScope!.unfocus();
    if (formKey.currentState!.validate()) {
      Get.snackbar(
        'Success',
        'Login Successful',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: greenColor,
      );

      Get.offAll(() => DashboardPage());
      return;
    }
    Get.snackbar(
      'Error',
      'Login validation failed',
      snackPosition: SnackPosition.TOP,
      colorText: whiteColor,
      backgroundColor: redColor,
    );
  }
}
