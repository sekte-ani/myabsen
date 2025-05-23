// date_format_controller.dart
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateFormatController extends GetxController {
  RxString formattedDate = ''.obs;
  RxString hariIni = ''.obs;
  RxString jamSekarang = ''.obs;
  RxString greet = ''.obs;

  void formatDate(DateTime date) {
    initializeDateFormatting();
    formattedDate.value = DateFormat('d MMMM yyyy', 'id_ID').format(date);
  }

  void formatHari(DateTime date) {
    initializeDateFormatting();
    hariIni.value = DateFormat('EEEE', 'id_ID').format(date);
  }

  void formatJam(DateTime time) {
    jamSekarang.value = DateFormat('H:mm').format(time);
  }

  void greetings(DateTime time) {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      greet.value = "Selamat Pagi,";
    }
    if (hour < 15) {
      greet.value = "Selamat Siang,";
    }
    if (hour < 18) {
      greet.value = "Selamat Sore,";
    }
    greet.value = "Selamat Malam,";
  }
}
