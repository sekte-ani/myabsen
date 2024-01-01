import 'package:MyAbsen/controller/history_controller.dart';
import 'package:MyAbsen/controller/shared/dateformat_controller.dart';
import 'package:MyAbsen/theme.dart';
import 'package:MyAbsen/ui/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart' as path;
import 'package:google_fonts/google_fonts.dart';

import 'package:MyAbsen/ui/pages/history/history_card.dart'; // Import the HistoryCard widget

class HistoryPage extends GetView<HistoryController> {
  // const HistoryPage({super.key});

  HistoryController controller = Get.put(HistoryController());
  DateFormatController dateFormatController = Get.put(DateFormatController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Obx(() {
            // final List<dynamic> history = Get.find<HistoryController>().history;
            return ListView.builder(
              itemCount: controller.history.length,
              itemBuilder: (context, index) {
                final historyData = controller.history[index];
                final tanggalMasuk = historyData['tanggal_masuk'] != null
                    ? dateFormatController.formatDate(
                        DateTime.parse(historyData['tanggal_masuk']),
                      )
                    : ''; // Provide a default value or handle the case where tanggal_masuk is null

                final tanggalKeluar = historyData['tanggal_keluar'] != null
                    ? dateFormatController.formatDate(
                        DateTime.parse(historyData['tanggal_keluar']),
                      )
                    : ''; // Provide a default value or handle the case where tanggal_keluar is null

                return HistoryCard(
                  tanggal: historyData['status'] == "0"
                      ? tanggalMasuk
                      : tanggalKeluar,
                  status: historyData['status'] == "1"
                      ? "Absen Selesai"
                      : "Belum selesai",
                  jamMasuk: historyData['jam_masuk'],
                  jamKeluar: historyData['jam_keluar'] == null
                      ? "Belum absen"
                      : historyData[
                          'jam_masuk'], // Ubah ini sesuai dengan atribut data yang ingin Anda tampilkan
                );
              },
            );
          }),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: GetBuilder<HistoryController>(
          init: HistoryController(), // Inisialisasi HistoryController
          builder: (_) => HistoryPage(), // Gunakan HistoryPage di sini
        ),
      ),
    );
  }
}
