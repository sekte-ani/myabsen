import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:MyAbsen/services/auth_service.dart';

class AbsensiService {
  final box = GetStorage();

  Future<List> get() async {
    String? token = box.read("token");
    var response = await Dio().get(
      "https://myabsen.ferdirns.com/api/attendance-history",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );

    String jsonString = jsonEncode(response.data);
    Map obj = jsonDecode(jsonString);
    List data = obj["data"];
    return data;
  }

  doCheckAbsensi() async {
    String? token = box.read("token");
    var response = await Dio().get(
      "https://myabsen.ferdirns.com/api/attendance-in-check",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );

    Map obj = response.data;
    return obj["status"];
  }
}
