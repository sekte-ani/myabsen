import 'package:MyAbsen/services/absensi_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:MyAbsen/controller/models/Absensi.dart';
import 'shared/dateformat_controller.dart';
import 'package:MyAbsen/services/absensi_service.dart';
import 'package:MyAbsen/controller/models/Absensi.dart';
import 'package:MyAbsen/controller/models/History.dart';

class AbsensiController extends GetxController {
  final DateFormatController dateFormatController =
      Get.put(DateFormatController());

  @override
  void onInit() {
    super.onInit();
    getAttendenceIn();
    update();
  }

  RxList<dynamic> attendancein = <dynamic>[].obs;

  Future<void> getAttendenceIn() async {
    try {
      attendancein.assignAll(await AbsensiService().get());
      update(); // Ensure to call update after changing the data
    } catch (e) {
      print('Error fetching absens: $e');
    }
  }
}
