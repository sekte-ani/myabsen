import 'package:MyAbsen/controller/absensi_controller.dart';
import 'package:MyAbsen/controller/cuti_controller.dart';
import 'package:MyAbsen/controller/dashboard_controller.dart';
import 'package:MyAbsen/controller/history_controller.dart';
import 'package:MyAbsen/controller/login_controller.dart';
import 'package:MyAbsen/controller/profile_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<AbsensiController>(() => AbsensiController());
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<CutiController>(() => CutiController());
  }
}
