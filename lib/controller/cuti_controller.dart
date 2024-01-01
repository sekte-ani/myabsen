import 'package:MyAbsen/services/cuti_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';

class CutiController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController alasanController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getCuti();
  }

  RxMap cuti = {}.obs;
  Future<void> getCuti() async {
    try {
      cuti.value = await CutiService().get();
      update();
    } on Exception catch (err) {
      print(err);
    }
  }

  String? tanggal_mulai;
  String? tanggal_berakhir;
  String? alasan;

  onSubmit() async {
    Get.focusScope!.unfocus();
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    bool isSuccess = await CutiService().create(
      tanggal_mulai: tanggal_mulai!,
      tanggal_berakhir: tanggal_berakhir!,
      alasan: alasan!,
    );

    if (!isSuccess) {
      Get.snackbar(
        'Error',
        'Pengajuan cuti belum berhasil terkirim',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: redColor,
      );
      return;
    } else {
      Get.snackbar(
        'Success',
        'Pengajuan cuti berhasil terkirim',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: green2Color,
      );

      alasanController.clear();
      return;
    }
  }

  // Future<void> onSubmit(String? alasan) async {
  //   Get.focusScope!.unfocus();
  //   if (formKey.currentState!.validate()) {
  //     Get.snackbar(
  //       'Success',
  //       'Cuti berhasil diajukan',
  //       snackPosition: SnackPosition.TOP,
  //       colorText: whiteColor,
  //       backgroundColor: greenColor,
  //     );
  //     // The form is valid, you can proceed with saving the value
  //     // For example, you can update the alasanCuti
  //     // You can replace the logic below with your actual implementation

  //     alasanController.clear();
  //     return;
  //   }
  //   Get.snackbar(
  //     'Error',
  //     'Cuti tidak berhasil diajukan',
  //     snackPosition: SnackPosition.TOP,
  //     colorText: whiteColor,
  //     backgroundColor: redColor,
  //   );
  // }
}
