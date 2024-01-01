import 'package:MyAbsen/services/profile_service.dart';
import 'package:MyAbsen/controller/models/Profile.dart';
import 'package:flutter/material.dart'; // Pastikan impor kelas Profile ada di sini
import 'package:MyAbsen/ui/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:MyAbsen/theme.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  final box = GetStorage();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isUpdatingProfile = false.obs;
  onLogout() {
    box.erase();
    Get.offAll(LoginPage());
  }

  @override
  void onInit() {
    super.onInit();
    getProfiles();
  }

  void initState() {}

  String? name;
  String? no_induk;
  String? email;
  String? born;
  String? address;
  // String? password;
  RxMap profile = {}.obs;
  Future<void> getProfiles() async {
    try {
      profile.value = await ProfileService().get();

      name = profile['name'];
      no_induk = profile['nomor_induk'];
      email = profile['email'];
      born = profile['born'];
      address = profile['address'];

      update();
    } catch (e) {
      print('Error fetching profiles: $e');
      // Handle error as needed
    }
  }

  Future<void> updateProfile({
    required String name,
    required String no_induk,
    required String email,
    required String born,
    required String address,
  }) async {
    try {
      isUpdatingProfile.value = true;
      int userId = await ProfileService().update(
        id: profile['id'], // Assuming 'id' is a key in your profile data
        name: name,
        no_induk: no_induk,
        email: email,
        born: born,
        address: address,
      );

      // Optionally update the local profile data after successful update
      profile['name'] = name;
      profile['no_induk'] = no_induk;
      profile['email'] = email;
      profile['born'] = born;
      profile['address'] = address;
      // profile['password'] = password;

      // Notify listeners (if necessary)
      update();

      // Show success message or handle success as needed
      Get.snackbar(
        'Success',
        'Profile Update Successful',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: green2Color,
      );
      await getProfiles();
    } catch (e) {
      print('Error updating profile: $e');
      // Handle error as needed
      Get.snackbar(
        'Error',
        'Profile Update Failed',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: redColor,
      );
    } finally {
      // Set isUpdatingProfile to false when the update is completed
      isUpdatingProfile.value = false;
    }
  }
}
