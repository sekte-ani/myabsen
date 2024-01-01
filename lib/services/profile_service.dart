import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class ProfileService {
  final box = GetStorage();

  Future<Map> get() async {
    String? token = box.read("token");
    var response = await Dio().get(
      "http://myabsen.ferdirns.com/api/profile",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );
    Map obj = response.data;
    return obj["data"];
  }
  
}
// import 'package:dio/dio.dart';
// import 'package:MyAbsen/controller/models/Profile.dart';

// class ProfileService {
//   final Dio dio = Dio(); // Sesuaikan konfigurasi Dio sesuai kebutuhan
//   Future<Profile> getProfile() async {
//     try {
//       // Lakukan permintaan profil dan parsing respons ke objek Profile
//       // Di sini Anda harus mengonfigurasi permintaan sesuai dengan kebutuhan API Anda
//       // Contoh:
//       Response response =
//           await dio.get('https://myabsen.ferdirns.com/api/profile');
//       if (response.statusCode == 200) {
//         Map<String, dynamic> responseData = response.data["data"];
//         Profile profile = Profile.fromJson(responseData);
//         return profile;
//       } else {
//         throw Exception('Failed to fetch profile');
//       }
//     } catch (e) {
//       throw Exception('Error fetching profile: $e');
//     }
//   }

//   Future<void> updateProfile(Profile updatedProfile) async {
//     try {
//       final response = await dio.put(
//         'https://myabsen.ferdirns.com/api/profile/${updatedProfile.id}',
//         data: updatedProfile.toJson(),
//         // Tambahkan headers jika diperlukan
//       );
//       if (response.statusCode == 200) {
//         print('Profile updated successfully');
//         // Handle success
//       } else {
//         print('Failed to update profile');
//         // Handle failure
//       }
//     } catch (e) {
//       print('Error updating profile: $e');
//       // Handle error
//     }
//   }
// }
