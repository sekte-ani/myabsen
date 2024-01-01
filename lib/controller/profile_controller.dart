import 'package:MyAbsen/services/profile_service.dart';
import 'package:MyAbsen/controller/models/Profile.dart'; // Pastikan impor kelas Profile ada di sini
import 'package:MyAbsen/ui/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final box = GetStorage();

  void onLogout() {
    box.erase();
    Get.offAll(LoginPage());
  }

  @override
  void onInit() {
    super.onInit();
    getProfile(); // Mengubah nama fungsi menjadi getProfile dari getProfiles
  }

  RxMap profile = {}.obs;

  void getProfile() async {
    try {
      Profile fetchedProfile = await ProfileService()
          .getProfile(); // Panggil fungsi getProfile dari ProfileService
      profile.value = fetchedProfile.toJson();
      update();
    } catch (e) {
      print('Error fetching profile: $e');
      // Handle error as needed
    }
  }

  void onUpdateProfile(Profile updatedProfile) async {
    try {
      await ProfileService().updateProfile(updatedProfile);
      // Refresh profil setelah pembaruan
      getProfile();
    } catch (e) {
      print('Error updating profile: $e');
      // Handle error
    }
  }
}
