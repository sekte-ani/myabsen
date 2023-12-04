import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';

class CutiController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController alasanController = TextEditingController();

  var alasanCuti = "-".obs;

  String? validateAlasan(String? alasan) {
    if (GetUtils.isNull(alasan) || alasan!.isEmpty) {
      return 'Masukkan alasan anda cuti..';
    }
    return null;
  }

  Future<void> onSubmit(String? alasan) async {
    Get.focusScope!.unfocus();
    if (formKey.currentState!.validate()) {
      Get.snackbar(
        'Success',
        'Cuti berhasil diajukan',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: greenColor,
      );
      // The form is valid, you can proceed with saving the value
      // For example, you can update the alasanCuti
      // You can replace the logic below with your actual implementation
      alasanCuti.value = alasan!;

      alasanController.clear();
      return;
    }
    Get.snackbar(
      'Error',
      'Cuti tidak berhasil diajukan',
      snackPosition: SnackPosition.TOP,
      colorText: whiteColor,
      backgroundColor: redColor,
    );
  }
}
