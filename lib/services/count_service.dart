import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:MyAbsen/services/auth_service.dart';

class CountTotalAbsen {
  final box = GetStorage();

  Future getTotalHadir() async {
    String? token = box.read("token");
    var response = await Dio().get(
      "https://myabsen.ferdirns.com/api/attendance-count",
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

  Future getTotalCuti() async {
    String? token = box.read("token");
    var response = await Dio().get(
      "https://myabsen.ferdirns.com/api/leave-count",
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
