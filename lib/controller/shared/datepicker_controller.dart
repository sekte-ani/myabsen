import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DatePickerController extends GetxController {
  var selectedDate = DateTime.now().obs;
  // var selectedTime = TimeOfDay.now().obs;

  chooseDate(_dateController) async {
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
}
