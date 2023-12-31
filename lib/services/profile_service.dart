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
    print("data profile : ${obj}");
    return obj["data"];
  }
}
