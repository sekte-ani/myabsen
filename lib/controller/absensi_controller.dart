import 'package:MyAbsen/services/absensiKeluar_service.dart';
import 'package:MyAbsen/services/absensi_service.dart';
import 'package:MyAbsen/services/count_service.dart';
import 'package:MyAbsen/ui/pages/dashboard_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
  final DateFormatController dateFormatController =
      Get.put(DateFormatController());

  @override
  void onInit() async {
    super.onInit();
    await historyController.getHistory();
    await doTotalAbsensi();
    update();
    print('onInit called');
  }

  @override
  void onResume() {
    historyController.getHistory();
    update(); // Update the widget tree
    print('onResume called');
  }

  var totalHadir = 0.obs;
  var totalCuti = 0.obs;

  Future<void> doTotalAbsensi() async {
    try {
      totalHadir.value = await CountTotalAbsen().getTotalHadir();
      totalCuti.value = await CountTotalAbsen().getTotalCuti();
      update();
      print("dari controller = ${totalHadir.value}");
    } on Exception catch (err) {
      print(err);
    }
  }

  String? tanggal_masuk;
  String? jam_masuk;
  String? lat_in;
  String? long_in;

  doAbsenMasuk() async {
    bool isSuccess = await AbsenMasukService().create(
      tanggalMasuk: tanggal_masuk!,
      jamMasuk: jam_masuk!,
      latIn: lat_in!,
      longIn: long_in!,
    );

    if (!isSuccess) {
      Get.snackbar(
        'Error',
        'Data tidak terkirim',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: redColor,
      );
      return;
    } else {
      Get.snackbar(
        'Success',
        'Berhasil Absen Masuk',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: green2Color,
      );

      historyController.getHistory();
      doTotalAbsensi();

      update();

      Get.off(() => DashboardPage());
    }
  }

  // absen keluar
  String? tanggal_keluar;
  String? jam_keluar;
  String? lat_out;
  String? long_out;

  doAbsenKeluar() async {
    bool isSuccess = await AbsenKeluarService().create(
      tanggal_keluar: tanggal_keluar!,
      jam_keluar: jam_keluar!,
      lat_out: lat_out!,
      long_out: long_out!,
    );

    if (!isSuccess) {
      Get.snackbar(
        'Error',
        'Data tidak terkirim',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: redColor,
      );
      return;
    } else {
      Get.snackbar(
        'Success',
        'Berhasil Absen Keluar',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: green2Color,
      );
      historyController.getHistory();
      doTotalAbsensi();

      update();

      Get.off(() => DashboardPage());
    }
  }
}
