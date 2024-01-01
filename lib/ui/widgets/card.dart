import 'package:MyAbsen/controller/absensi_controller.dart';
import 'package:MyAbsen/controller/history_controller.dart';
import 'package:MyAbsen/theme.dart';
import 'package:MyAbsen/ui/pages/absensi/absensi_keluar_page.dart';
import 'package:MyAbsen/ui/pages/absensi/absensi_masuk_page.dart';
import 'package:MyAbsen/ui/pages/absensi/cuti_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AbsensiCard extends StatelessWidget {
  const AbsensiCard({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => AbsensiMasukPage());
                  },
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
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => AbsensiKeluarPage());
                  },
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
                          "Absen Pulang",
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
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => CutiPage());
            },
            child: Container(
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
          ),
        ],
      ),
    );
  }
}

class TotalAbsensiCard extends StatelessWidget {
  // const TotalAbsensiCard({super.key});

  AbsensiController totalController = Get.put(AbsensiController());

  @override
  Widget build(BuildContext context) {
    var dataHadir = totalController.totalHadir;
    var dataCuti = totalController.totalCuti;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                        Obx(() => Text(
                              "${dataHadir.value} Hari",
                              style: font_regular.copyWith(
                                fontSize: 14,
                                color: darkGreyColor,
                              ),
                            )),
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
                        Obx(() => Text(
                              "${dataCuti.value} Hari",
                              style: font_regular.copyWith(
                                fontSize: 14,
                                color: darkGreyColor,
                              ),
                            )),
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
}

class HistoryCard extends StatelessWidget {
  HistoryController controller = Get.put(HistoryController());

  final String tanggal;
  final String status;
  final String jamMasuk;
  final String? jamKeluar;

  HistoryCard({
    Key? key,
    required this.tanggal,
    this.status = "Absen belum selesai",
    this.jamMasuk = "09:00",
    this.jamKeluar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final historyData = controller.history;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 3,
          margin: const EdgeInsets.only(
            bottom: 10,
          ),
          color: status == "Belum selesai" ? redColor : green2Color,
          shape: RoundedRectangleBorder(
            // side: BorderSide(color: green2Color, width: 2.0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 7,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tanggal,
                      style: font_bold.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      status,
                      style: font_bold.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      status == "0" ? 'Tanggal Awal' : 'Jam Masuk',
                      style: font_medium.copyWith(
                        color: Colors.white,
                        fontSize: 16, // Atur ukuran font di sini (misalnya, 18)
                      ),
                    ),
                    Text(
                      jamMasuk,
                      style: font_medium.copyWith(
                        color: Colors.white,
                        fontSize: 16, // Atur ukuran font di sini (misalnya, 18)
                      ),
                    ),
                  ],
                ),
                // Divider(
                //   color: Colors.white,
                //   thickness: 1.0,
                // ),
                Container(
                  width: double.infinity,
                  height: 1,
                  decoration: BoxDecoration(
                    color: whiteColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      status == "0" ? 'Tanggal Akhir' : 'Jam Pulang',
                      style: font_medium.copyWith(
                        color: Colors.white,
                        fontSize: 16, // Atur ukuran font di sini (misalnya, 18)
                      ),
                    ),
                    Text(
                      jamKeluar ?? 'Data tidak ada',
                      style: font_medium.copyWith(
                        color: Colors.white,
                        fontSize: 16, // Atur ukuran font di sini (misalnya, 18)
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
