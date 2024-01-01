import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class AbsenMasukService {
  final box = GetStorage();

  Future<bool> create({
    required String tanggalMasuk,
    required String jamMasuk,
    required String latIn,
    required String longIn,
  }) async {
    try {
      String? token = box.read("token");

      var response = await Dio().post(
        "https://myabsen.ferdirns.com/api/attendance-in",
        options: Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
        data: {
          "tanggal_masuk": tanggalMasuk,
          "jam_masuk": jamMasuk,
          "lat_in": latIn,
          "long_in": longIn,
        },
      );

      Map obj = response.data;
      print("Request payload: $tanggalMasuk, $jamMasuk, $latIn, $longIn");
      print("Response data: ${obj['data']}");
      print("Full Response: $response");

      print("Status Code: ${response.statusCode}");
      // Check for success based on the response structure
      return response.statusCode == 200 && obj['success'] == true;
    } on DioError catch (e) {
      print("Dio Error Status Code: ${e.response?.statusCode}");
      print("Dio Error Response: ${e.response?.data}");
      return false;
    } catch (err) {
      print("Unexpected error: $err");
      return false;
    }
  }
}
