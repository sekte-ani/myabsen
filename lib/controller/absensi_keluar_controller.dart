import 'package:MyAbsen/services/absensi_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:MyAbsen/controller/models/Absensi.dart';
import 'shared/dateformat_controller.dart';
import 'package:MyAbsen/services/absensi_service.dart';
import 'package:MyAbsen/controller/models/Absensi.dart';
import 'package:MyAbsen/controller/models/History.dart';
import 'package:flutter/material.dart';
import 'package:MyAbsen/services/absensiKeluar_service.dart';
import 'package:MyAbsen/theme.dart';

class AbsensiKeluarController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController messageController = TextEditingController();
  // final getStorage = GetStorage();

  String? tanggal_keluar;
  String? jam_keluar;
  String? lat_out;
  String? long_out;

  RxString selected = ''.obs;
  final DateFormatController dateFormatController =
      Get.put(DateFormatController());

  doKirim() async {
    Get.focusScope!.unfocus();
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    bool isSuccess = await AbsenKeluarService().create(
      tanggalKeluar: tanggal_keluar!,
      jamKeluar: jam_keluar!,
      latOut: lat_out!,
      longOut: long_out!,
    );

    if (!isSuccess) {
      Get.snackbar(
        'Error',
        'Form validation failed',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: redColor,
      );
      return;
    } else {
      Get.snackbar(
        'Success',
        'Anda Telah Absen Pulang',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: green2Color,
      );

      selected.value = '';
      messageController.clear();
      return;
    }
  }
}
