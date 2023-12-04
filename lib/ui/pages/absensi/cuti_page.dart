import 'package:MyAbsen/controller/cuti_controller.dart';
import 'package:MyAbsen/controller/shared/datepicker_controller.dart';
import 'package:MyAbsen/theme.dart';
import 'package:MyAbsen/ui/widgets/buttons.dart';
import 'package:MyAbsen/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class CutiPage extends GetView<CutiController> {
  DatePickerController datePickerController = Get.put(DatePickerController());
  TextEditingController alasanController = Get.put(TextEditingController());
  CutiController controller = Get.put(CutiController());
  @override
  Widget build(BuildContext context) {
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
      body: Stack(
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
                            DateFormat('dd MMMM yyyy', 'id_ID')
                                .format(
                                  datePickerController.dateRange.value.start,
                                )
                                .toString(),
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
                            DateFormat('dd MMMM yyyy', 'id_ID')
                                .format(
                                  datePickerController.dateRange.value.end,
                                )
                                .toString(),
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
                            Text(
                              "Ditolak",
                              style: font_regular.copyWith(
                                color: redColor,
                              ),
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
                    controller.alasanCuti.value,
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
                              validator: (alasan) =>
                                  controller.validateAlasan(alasan),
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
                                    onPressed: () {
                                      datePickerController.chooseDateRange();
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
                                      onPressed: () {
                                        // Handle button press
                                        print(
                                            "Alasannye : ${alasanController}");
                                        controller
                                            .onSubmit(alasanController.text);
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
    );
  }
}
