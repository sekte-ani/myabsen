import 'package:MyAbsen/services/auth_service.dart';
import 'package:MyAbsen/theme.dart';
import 'package:MyAbsen/ui/pages/dashboard_page.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final box = GetStorage();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? email;
  String? password;

  onLogin() async {
    Get.focusScope!.unfocus();
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    bool isSuccess = await AuthService().login(
      email: email!,
      password: password!,
    );

    if (!isSuccess) {
      Get.snackbar(
        'Error',
        'Wrong email or password',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: redColor,
      );
      return;
    } else {
      Get.snackbar(
        'Success',
        'Login Successful',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: greenColor,
      );
      print("login berhasil");
      Get.offAll(() => DashboardPage());
    }
  }
}
