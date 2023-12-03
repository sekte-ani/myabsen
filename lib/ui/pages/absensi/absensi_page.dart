import 'package:MyAbsen/controller/absensi_controller.dart';
import 'package:MyAbsen/controller/dashboard_controller.dart';
import 'package:MyAbsen/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class AbsensiPage extends GetView<AbsensiController> {
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
        child: ListView(
          children: [
            Container(
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
                  buildAbsensi(),
                  const SizedBox(
                    height: 40,
                  ),
                  buildTotalAbsen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildHeader() {
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
            Text(
              'Selamat Siang,',
              style: font_regular.copyWith(
                fontSize: 14,
              ),
            ),
            Text(
              'Aldi Taher',
              style: font_semiBold.copyWith(
                fontSize: 18,
                color: darkGreenColor,
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

Widget buildAbsensi() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(22),
    decoration: BoxDecoration(
      color: whiteColor,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [themeShadow],
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: green2Color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Absen Masuk",
                      style: font_regular.copyWith(
                        color: whiteColor,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Sudah Absen",
                      style: font_semiBold.copyWith(
                        color: whiteColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: yellow2Color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Absen Keluar",
                      style: font_regular.copyWith(
                        color: black2Color,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Belum Absen",
                      style: font_semiBold.copyWith(
                        color: black2Color,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: blackColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.directions_car,
                  color: whiteColor,
                  size: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Ambil Cuti",
                  style: font_semiBold.copyWith(
                    color: whiteColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildTotalAbsen() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Total Absensi",
        style: font_semiBold.copyWith(
          fontSize: 18,
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [themeShadow],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.login,
                    size: 24,
                    color: green2Color,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hadir",
                        style: font_semiBold.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "0 Hari",
                        style: font_regular.copyWith(
                          fontSize: 14,
                          color: darkGreyColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [themeShadow],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.directions_car,
                    size: 24,
                    color: redColor,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cuti",
                        style: font_semiBold.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "0 Hari",
                        style: font_regular.copyWith(
                          fontSize: 14,
                          color: darkGreyColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )
    ],
  );
}
