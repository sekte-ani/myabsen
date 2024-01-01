import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get_storage/get_storage.dart';

class ResetService {
  final box = GetStorage();

  static String lastError = "";

  update({
    required String password,
    required String password_confirmation,
    required String current_password,
  }) async {
    try {
      String? token = box.read("token");
      var response = await Dio().post(
        "https://myabsen.ferdirns.com/api/reset-password",
        options: Options(
          headers: {
            "Accept": "*/*",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
        data: {
          "password": password,
          "password_confirmation": password_confirmation,
          "current_password": current_password,
        },
      );
      Map obj = response.data;
      print(
          "Request payload: $password, $password_confirmation, $current_password");
      print("Response data: ${obj["msg"]}");
      print("Full Response: $response");

      print("Status Code: ${response.statusCode}");
      return obj["msg"];
    } on Exception catch (err) {
      print(err);
      return;
    }
  }
}
