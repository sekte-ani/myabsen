import 'package:MyAbsen/controller/history_controller.dart';
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

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

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
            final List<dynamic> history = Get.find<HistoryController>().history;
            return ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                final historyData = history[index];
                return HistoryCard(
                  tanggal: historyData[
                      'tanggal_masuk'], // Ubah ini sesuai dengan atribut data yang ingin Anda tampilkan
                  status: historyData['status'],
                  jamMasuk: historyData['jam_masuk'],
                  // jamKeluar: historyData[
                  //     'lat_out'], // Ubah ini sesuai dengan atribut data yang ingin Anda tampilkan
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
