import 'dart:math';

import 'package:MyAbsen/controller/absensi_controller.dart';
import 'package:MyAbsen/controller/dashboard_controller.dart';
import 'package:MyAbsen/controller/history_controller.dart';
import 'package:MyAbsen/controller/profile_controller.dart';
import 'package:MyAbsen/controller/shared/dateformat_controller.dart';
import 'package:MyAbsen/theme.dart';
import 'package:MyAbsen/ui/pages/absensi/absensi_keluar_page.dart';
import 'package:MyAbsen/ui/pages/absensi/absensi_masuk_page.dart';
import 'package:MyAbsen/ui/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart' as path;
import 'package:MyAbsen/ui/pages/history/history_card.dart';

class AbsensiPage extends GetView<AbsensiController> {
  AbsensiController absensiController = Get.put(AbsensiController());
  ProfileController profileController = Get.put(ProfileController());
  DateFormatController dateFormatController = Get.put(DateFormatController());

  // Future<void> _onRefresh() async {
  //   await absensiController.getAttendenceIn();
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    HistoryController historyController = Get.put(HistoryController());

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(),
                const SizedBox(
                  height: 40,
                ),
                AbsensiCard(),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Total Absensi",
                  style: font_semiBold.copyWith(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TotalAbsensiCard(),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Absensi Terakhir",
                  style: font_semiBold.copyWith(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // Display only 5 HistoryCard
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: min(5, historyController.history.length),
                    itemBuilder: (context, index) {
                      var historyData = historyController.history[index];
                      final tanggalMasuk = historyData['tanggal_masuk'] != null
                          ? dateFormatController.formatDate(
                              DateTime.parse(historyData['tanggal_masuk']),
                            )
                          : 'Data tidak tersedia';

                      final tanggalKeluar =
                          historyData['tanggal_keluar'] != null
                              ? dateFormatController.formatDate(
                                  DateTime.parse(historyData['tanggal_keluar']),
                                )
                              : 'Data tidak tersedia';

                      final jamMasuk = historyData['jam_masuk'] != null
                          ? dateFormatController.formatJam(DateTime.parse(
                              "2023-01-01 ${historyData['jam_masuk']}"))
                          : 'Data tidak tersedia';

                      final jamKeluar = historyData['jam_keluar'] != null
                          ? dateFormatController.formatJam(DateTime.parse(
                              "2023-01-01 ${historyData['jam_keluar']}"))
                          : 'Data tidak tersedia';

                      return HistoryCard(
                        tanggal: historyData['status'] == "0"
                            ? tanggalMasuk
                            : tanggalKeluar,
                        status: historyData['status'] == "1"
                            ? "Absen Selesai"
                            : "Belum selesai",
                        jamMasuk: jamMasuk,
                        jamKeluar: historyData['jam_keluar'] == null
                            ? "Belum absen"
                            : jamKeluar,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildHeader() {
  ProfileController profileController = Get.put(ProfileController());

  var profile = profileController.profile;

  final DateFormatController dateFormatController =
      Get.put(DateFormatController());
  DateTime currentTime = DateTime.now();
  dateFormatController.greetings(currentTime);

  return Container(
    margin: const EdgeInsets.only(
      top: 10,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Text(
                dateFormatController.greet.value,
                style: font_regular.copyWith(
                  fontSize: 14,
                ),
              ),
            ),
            Obx(
              () => Text(
                '${profile["name"]}',
                style: font_bold.copyWith(
                  fontSize: 18,
                  color: darkGreenColor,
                ),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Get.find<DashboardController>().changeTabIndex(2);
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.account_circle,
              color: blackColor,
              size: 50,
            ),
          ),
        ),
      ],
    ),
  );
}
