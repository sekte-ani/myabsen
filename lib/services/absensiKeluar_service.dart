import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class AbsenKeluarService {
  final box = GetStorage();

  Future create({
    required String tanggal_keluar,
    required String jam_keluar,
    required String lat_out,
    required String long_out,
  }) async {
    try {
      String? token = box.read("token");

      var response = await Dio().post(
        "https://myabsen.ferdirns.com/api/attendance-out",
        options: Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
        data: {
          "tanggal_keluar": tanggal_keluar,
          "jam_keluar": jam_keluar,
          "lat_out": lat_out,
          "long_out": long_out,
        },
      );
      Map obj = response.data;
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
