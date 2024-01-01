import 'package:MyAbsen/controller/absensi_controller.dart';
import 'package:MyAbsen/controller/dashboard_controller.dart';
import 'package:MyAbsen/controller/profile_controller.dart';
import 'package:MyAbsen/controller/shared/dateformat_controller.dart';
import 'package:MyAbsen/controller/shared/latlong_controller.dart';
import 'package:MyAbsen/theme.dart';
import 'package:MyAbsen/ui/widgets/buttons.dart';
import 'package:MyAbsen/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MyAbsen/controller/absensi_controller.dart';

class AbsensiMasukPage extends GetView<AbsensiController> {
  // final AbsensiController controller = Get.put(AbsensiController());
  ProfileController profileController = Get.put(ProfileController());
  final RxBool submitted = false.obs;

  void submitQuestion() {
    // Add logic to send the question or message
    submitted.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: whiteColor,
        ),
        title: Text(
          'Absensi Masuk',
          style: font_semiBold.copyWith(
            color: whiteColor,
          ),
        ),
        backgroundColor: green2Color,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: green2Color,
            ),
          ),
          ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(27),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 22,
                    ),
                    buildHeader(),
                    const SizedBox(
                      height: 20,
                    ),
                    buildDataAbsen(),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
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
            Text(
              dateFormatController.greet.value,
              style: font_regular.copyWith(
                fontSize: 14,
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

Widget buildDataAbsen() {
  LatLongController _latLongController = Get.put(LatLongController());
  final AbsensiController controller = Get.put(AbsensiController());
  final RxBool submitted = false.obs;

  void submitQuestion() {
    // Add logic to send the question or message
    submitted.value = true;
  }

  final DateFormatController dateFormatController =
      Get.put(DateFormatController());
  DateTime currentDate = DateTime.now();
  DateTime currentTime = DateTime.now();
  dateFormatController.formatDate(currentDate);
  dateFormatController.formatHari(currentDate);
  dateFormatController.formatJam(currentTime);
  return Column(
    children: [
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${dateFormatController.hariIni.value},",
              style: font_bold.copyWith(
                fontSize: 16,
              ),
            ),
            Text(
              dateFormatController.formattedDate.value,
              style: font_bold.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Waktu Masuk",
                  style: font_semiBold.copyWith(
                    fontSize: 14,
                  ),
                ),
                Text(
                  dateFormatController.jamSekarang.value,
                  style: font_regular.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lokasi Anda",
                      style: font_semiBold.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "${_latLongController.address.value}",
                      style: font_regular.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "${_latLongController.latitude.value}, ${_latLongController.longitude.value}",
                      style: font_regular.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 40,
      ),
      PrimaryButton(
        title: "Absen Masuk",
        onPressed: () {
          controller.doKirim();
          // Get.back();
        },
      ),
      SizedBox(height: 20),
      Obx(
        () => submitted.value
            ? Text(
                'Selamat, anda telah absen!',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Container(),
      ),
      SizedBox(height: 200),
    ],
  );
}
