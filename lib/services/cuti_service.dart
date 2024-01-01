import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class CutiService {
  final box = GetStorage();

  Future<Map> get() async {
    String? token = box.read("token");
    var response = await Dio().get(
      "https://myabsen.ferdirns.com/api/leave",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );
    Map obj = response.data;
    print(obj);
    return obj["data"];
  }

  Future create({
    required String tanggal_mulai,
    required String tanggal_berakhir,
    required String alasan,
  }) async {
    try {
      String? token = box.read("token");

      var response = await Dio().post(
        "https://myabsen.ferdirns.com/api/leave",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
        data: {
          "tanggal_mulai": tanggal_mulai,
          "tanggal_berakhir": tanggal_berakhir,
          "alasan": alasan,
        },
      );
      Map obj = response.data;
      return true;
    } on Exception catch (err) {
      print(err);
      return false;
    }
  }
}
