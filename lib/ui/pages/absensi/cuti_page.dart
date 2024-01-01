import 'package:MyAbsen/controller/cuti_controller.dart';
import 'package:MyAbsen/controller/shared/dateformat_controller.dart';
import 'package:MyAbsen/controller/shared/datepicker_controller.dart';
import 'package:MyAbsen/theme.dart';
import 'package:MyAbsen/ui/widgets/buttons.dart';
import 'package:MyAbsen/ui/widgets/forms.dart';
import 'package:MyAbsen/ui/widgets/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class CutiPage extends GetView<CutiController> {
  DatePickerController datePickerController = Get.put(DatePickerController());
  TextEditingController alasanController = Get.put(TextEditingController());
  CutiController controller = Get.put(CutiController());
  DateFormatController dateFormatController = Get.put(DateFormatController());

  Future<void> _onRefresh() async {
    await controller.getCuti();
  }

  @override
  Widget build(BuildContext context) {
    var dataCuti = controller.cuti;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: whiteColor,
        ),
        title: Text(
          'Status Cuti Anda',
          style: font_semiBold.copyWith(
            color: whiteColor,
          ),
        ),
        backgroundColor: green2Color,
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 350,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              decoration: BoxDecoration(
                color: green2Color,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tanggal Awal",
                            style: font_semiBold.copyWith(
                              color: whiteColor,
                              fontSize: 16,
                            ),
                          ),
                          Obx(
                            () => Text(
                              (dataCuti["tanggal_mulai"] != null)
                                  ? DateFormat('dd MMMM yyyy', 'id_ID')
                                      .format(DateTime.parse(
                                          dataCuti["tanggal_mulai"]))
                                      .toString()
                                  : "null",
                              style: font_regular.copyWith(
                                color: whiteColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Tanggal Akhir",
                            style: font_semiBold.copyWith(
                              color: whiteColor,
                              fontSize: 16,
                            ),
                          ),
                          Obx(
                            () => Text(
                              (dataCuti["tanggal_mulai"] != null)
                                  ? DateFormat('dd MMMM yyyy', 'id_ID')
                                      .format(DateTime.parse(
                                          dataCuti["tanggal_berakhir"]))
                                      .toString()
                                  : "null",
                              style: font_regular.copyWith(
                                color: whiteColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 5,
                          bottom: 40,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(
                            20,
                          ),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Status",
                                style: font_semiBold.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              Obx(
                                () {
                                  String statusText;
                                  Color statusColor;

                                  switch (dataCuti["status"]) {
                                    case "tunggu":
                                      statusText = "Diproses";
                                      statusColor = yellowColor;
                                      break;
                                    case "diterima":
                                      statusText = "Diterima";
                                      statusColor = greenColor;
                                      break;
                                    case "ditolak":
                                      statusText = "Ditolak";
                                      statusColor = redColor;
                                      break;

                                    default:
                                      statusText =
                                          "No Data"; // Change to your default text
                                      statusColor = Colors
                                          .black; // Choose the color you want
                                  }

                                  return Text(
                                    statusText,
                                    style: font_regular.copyWith(
                                      color: statusColor,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Alasan Cuti",
                    style: font_semiBold.copyWith(
                      color: whiteColor,
                      fontSize: 16,
                    ),
                  ),
                  Obx(
                    () => Text(
                      "${dataCuti["alasan"]}",
                      style: font_regular.copyWith(
                        color: whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: ListView(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 300,
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
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 32,
                              ),
                              InputFieldBox(
                                title: "Alasan Cuti",
                                hintText: "Deskripsikan alasan anda cuti...",
                                controller: alasanController,
                                validator: Validator.required,
                                onChange: (value) {
                                  controller.alasan = value;
                                },
                              ),
                              const SizedBox(
                                height: 35,
                              ),

                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: greenColor,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.calendar_month,
                                      ),
                                      color: whiteColor,
                                      splashColor: bgColor,
                                      onPressed: () async {
                                        await datePickerController
                                            .chooseDateRange();
                                        // print(
                                        //     "Start Date: ${datePickerController.startDate}");
                                        // print(
                                        //     "End Date: ${datePickerController.endDate}");
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 50,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          if (datePickerController.startDate !=
                                                  null &&
                                              datePickerController.endDate !=
                                                  null) {
                                            controller.tanggal_mulai =
                                                DateFormat('yyyy-MM-dd').format(
                                                    datePickerController
                                                        .startDate!);
                                            controller.tanggal_berakhir =
                                                DateFormat('yyyy-MM-dd').format(
                                                    datePickerController
                                                        .endDate!);

                                            dataCuti["status"] == "tunggu"
                                                ? Get.snackbar(
                                                    'Peringatan!',
                                                    'Status cuti anda sedang diproses',
                                                    snackPosition:
                                                        SnackPosition.TOP,
                                                    colorText: black2Color,
                                                    backgroundColor:
                                                        yellow2Color,
                                                  )
                                                : await controller.onSubmit();

                                            controller.getCuti();
                                            alasanController.clear();
                                          } else {
                                            // Handle case where startDate or endDate is null
                                            Get.snackbar(
                                              'Peringatan!',
                                              'Tanggal tidak boleh kosong',
                                              snackPosition: SnackPosition.TOP,
                                              colorText: black2Color,
                                              backgroundColor: yellow2Color,
                                            );
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: greenColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                        ),
                                        child: Text(
                                          "Ajukan Cuti",
                                          style: font_semiBold.copyWith(
                                            fontSize: 16,
                                            color: whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // buildDataAbsen(),
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Notes : \nPilih range waktu cuti anda pada icon calendar",
                                style: font_regular.copyWith(
                                  color: darkGreyColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
