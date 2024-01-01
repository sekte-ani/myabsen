import 'package:MyAbsen/services/absensi_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:MyAbsen/controller/models/Absensi.dart';
import 'history_controller.dart';
import 'shared/dateformat_controller.dart';
import 'package:MyAbsen/services/absensi_service.dart';
import 'package:MyAbsen/controller/models/Absensi.dart';
import 'package:MyAbsen/controller/models/History.dart';
import 'package:flutter/material.dart';
import 'package:MyAbsen/services/absensiMasuk_service.dart';
import 'package:MyAbsen/theme.dart';

class AbsensiController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController messageController = TextEditingController();
  // final getStorage = GetStorage();
  HistoryController historyController = Get.put(HistoryController());

  @override
  void onInit() {
    super.onInit();
    // Load the profile data when the widget is initialized
    historyController.getHistory();
    update();
  }

  String? tanggal_masuk;
  String? jam_masuk;
  String? lat_in;
  String? long_in;

  RxString selected = ''.obs;
  final DateFormatController dateFormatController =
      Get.put(DateFormatController());

  doKirim() async {
    Get.focusScope!.unfocus();
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    bool isSuccess = await AbsenMasukService().create(
      tanggalMasuk: tanggal_masuk!,
      jamMasuk: jam_masuk!,
      latIn: lat_in!,
      longIn: long_in!,
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
        'Forum berhasil terkirim',
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
