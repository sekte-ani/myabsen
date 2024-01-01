import 'package:MyAbsen/services/profile_service.dart';
import 'package:MyAbsen/controller/models/Profile.dart'; // Pastikan impor kelas Profile ada di sini
import 'package:MyAbsen/ui/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  final box = GetStorage();

  void onLogout() {
    box.erase();
    Get.offAll(LoginPage());
  }

  @override
  void onInit() {
    super.onInit();
    getProfiles(); // Mengubah nama fungsi menjadi getProfile dari getProfiles
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

  Future<void> onUpdateProfile(Profile updatedProfile) async {
    String apiUrl =
        'https://myabsen.ferdirns.com/api/profile/${updatedProfile.id}';
    try {
      var response = await http.put(
        Uri.parse(apiUrl),
        body: {
          'name': updatedProfile.name,
          'nomor_induk': updatedProfile.nomorInduk,
          'email': updatedProfile.email,
          'born': updatedProfile.born,
          'address': updatedProfile.address,
          // tambahkan field lain jika diperlukan
        },
        // tambahkan headers jika diperlukan
      );

      if (response.statusCode == 200) {
        // Handle jika permintaan sukses
        print('Profil berhasil diperbarui');
      } else {
        // Handle jika permintaan gagal
        print('Gagal memperbarui profil');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
    // void getProfile() async {
    //   try {
    //     Profile fetchedProfile = await ProfileService()
    //         .getProfile(); // Panggil fungsi getProfile dari ProfileService
    //     profile.value = fetchedProfile.toJson();
    //     update();
    //   } catch (e) {
    //     print('Error fetching profile: $e');
    //     // Handle error as needed
    //   }
    // }

    // void onUpdateProfile(Profile updatedProfile) async {
    //   try {
    //     await ProfileService().updateProfile(updatedProfile);
    //     // Refresh profil setelah pembaruan
    //     getProfile();
    //   } catch (e) {
    //     print('Error updating profile: $e');
    //     // Handle error
    //   }
    // }
  }
}
