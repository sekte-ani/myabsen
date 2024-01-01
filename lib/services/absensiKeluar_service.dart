import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class AbsenKeluarService {
  final box = GetStorage();

  Future create({
    required String tanggalKeluar,
    required String jamKeluar,
    required String latOut,
    required String longOut,
  }) async {
    try {
      String? token = box.read("token");

      var response = await Dio().post(
        "https://myabsen.ferdirns.com/api/attendance-out",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
        data: {
          "tangga;_keluar": tanggalKeluar,
          "jam_masuk": jamKeluar,
          "lat_in": latOut,
          "long_In": longOut,
        },
      );
      Map obj = response.data;
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
