import 'package:MyAbsen/services/auth_service.dart';
import 'package:MyAbsen/services/reset_service.dart';
import 'package:MyAbsen/controller/models/Profile.dart';
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
    getPassword();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isUpdatingPassword = false.obs;

  String? password;

  RxMap reset = {}.obs;
  Future<void> getPassword() async {
    try {
      reset.value = await ResetService().get();

      reset = reset['password'];
      ;

      update();
    } catch (e) {
      print('Error fetching profiles: $e');
      // Handle error as needed
    }
  }

  Future<void> updatePassword({
    required String password,
  }) async {
    try {
      isUpdatingPassword.value = true;
      await ResetService().update(
        password: password,
      );

      reset['password'] = password;

      // Notify listeners (if necessary)
      update();

      // Show success message or handle success as needed
      Get.snackbar(
        'Success',
        'Password Update Successful',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: green2Color,
      );
      await getPassword();
    } catch (e) {
      print('Error updating profile: $e');
      // Handle error as needed
      Get.snackbar(
        'Error',
        'Password Update Failed',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: redColor,
      );
    } finally {
      // Set isUpdatingProfile to false when the update is completed
      isUpdatingPassword.value = false;
    }
  }
}
