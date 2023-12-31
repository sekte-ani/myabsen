import 'package:MyAbsen/ui/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final box = GetStorage();
  onLogout() {
    box.erase();
    Get.offAll(LoginPage());
  }
}
