import 'package:MyAbsen/theme.dart';
import 'package:MyAbsen/ui/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(height: 20), // Memberi jarak 10 di bagian atas
                  Text(
                    "Riwayat Absensi",
                    style: font_bold.copyWith(
                      fontSize: 20,
                    ),
                  ),

                  // Container(
                  //   margin: EdgeInsets.symmetric(
                  //     horizontal: 16,
                  //   ), // Memberi margin horizontal
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: green2Color, width: 2.0),
                  //     borderRadius: BorderRadius.circular(115.0),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Center(
                  //       child: Text(
                  //         'Riwayat Absensi',
                  //         style: font_bold.copyWith(
                  //           fontSize: 24,
                  //           fontWeight: FontWeight.bold,
                  //           color: greenColor,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  HistoryCard(
                    tanggal: "6 Desember 2023",
                  ),
                  HistoryCard(
                    tanggal: "5 Desember 2023",
                  ),
                  HistoryCard(
                    tanggal: "4 Desember 2023",
                    status: "Cuti",
                  ),
                  HistoryCard(
                    tanggal: "3 Desember 2023",
                    status: "Cuti",
                  ),
                  HistoryCard(
                    tanggal: "2 Desember 2023",
                    status: "Cuti",
                  ),
                  HistoryCard(
                    tanggal: "1 Desember 2023",
                  ),
                  HistoryCard(
                    tanggal: "30 November 2023",
                  ),
                  HistoryCard(
                    tanggal: "29 November 2023",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
