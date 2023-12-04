import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DatePickerController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initializeDateFormatting();
  }

  var selectedDate = DateTime.now().obs;
  // var selectedTime = TimeOfDay.now().obs;
  //date range
  var dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 6),
  ).obs;

  chooseDate(_dateController) async {
    initializeDateFormatting();

    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    // TimeOfDay? pickedTime = await showTimePicker(
    //   context: Get.context!,
    //   initialTime: TimeOfDay.now(),
    // );
    if (pickedDate != null) {
      selectedDate.value = pickedDate;
      // selectedTime.value = pickedTime;
      String formattedDate =
          DateFormat('dd/MM/yyyy').format(pickedDate).toString().split(" ")[0];
      // String formattedTime =
      // "${pickedTime.hour}:${pickedTime.minute.toString().padLeft(2, '0')}";
      // Update the controller text with the formatted date
      // _dateController.text = "${formattedDate}, ${formattedTime}";
      _dateController.text = "${formattedDate}";
    }
  }

  chooseDateRange() async {
    DateTimeRange? picked = await showDateRangePicker(
        context: Get.context!,
        firstDate: DateTime(DateTime.now().year - 20),
        lastDate: DateTime(DateTime.now().year + 20),
        initialDateRange: dateRange.value);
    if (picked != null) {
      dateRange.value = picked;
    }
  }
}
