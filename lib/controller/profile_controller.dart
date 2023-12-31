import 'package:MyAbsen/services/profile_service.dart';
import 'package:MyAbsen/ui/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final box = GetStorage();
  onLogout() {
    box.erase();
    Get.offAll(LoginPage());
  }

  @override
  void onInit() {
    super.onInit();
    getProfiles();
  }

  RxMap profile = {}.obs;
  Future<void> getProfiles() async {
    try {
      profile.value = await ProfileService().get();
      update();
    } catch (e) {
      print('Error fetching profiles: $e');
      // Handle error as needed
    }
  }
}
