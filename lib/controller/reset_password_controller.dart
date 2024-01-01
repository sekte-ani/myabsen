import 'package:MyAbsen/services/auth_service.dart';
import 'package:MyAbsen/services/reset_service.dart';
import 'package:MyAbsen/controller/models/Profile.dart';
import 'package:MyAbsen/ui/pages/dashboard_page.dart';
import 'package:flutter/material.dart'; // Pastikan impor kelas Profile ada di sini
import 'package:MyAbsen/theme.dart';
import 'package:MyAbsen/ui/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:MyAbsen/theme.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ResetController extends GetxController {
  final box = GetStorage();
  final AuthService authService = AuthService();

  @override
  void onInit() {
    super.onInit();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isUpdatingPassword = false.obs;

  String? password;
  String? password_confirmation;
  String? current_password;

  RxMap reset = {}.obs;

  updatePassword() async {
    Get.focusScope!.unfocus();
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    // isUpdatingPassword.value = true;
    String? isSuccess = await ResetService().update(
      password: password!,
      password_confirmation: password_confirmation!,
      current_password: current_password!,
    );

    // Notify listeners (if necessary)
    update();

    if (isSuccess != "Reset Password Success") {
      Get.snackbar(
        'Error',
        'Check kembali password anda',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: redColor,
      );
      return;
    } else {
      Get.snackbar(
        'Success',
        'Password berhasil diganti',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: green2Color,
      );
      Get.off(() => DashboardPage());
    }

    // Set isUpdatingProfile to false when the update is completed
    // isUpdatingPassword.value = false;
  }
}
