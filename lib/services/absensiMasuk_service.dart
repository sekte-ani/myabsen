import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class AbsenMasukService {
  final box = GetStorage();

  Future create({
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
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
        data: {
          "tanggal_masuk": tanggalMasuk,
          "jam_masuk": jamMasuk,
          "lat_in": latIn,
          "long_In": longIn,
        },
      );
      Map obj = response.data;
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
