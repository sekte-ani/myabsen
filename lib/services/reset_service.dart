import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get_storage/get_storage.dart';

class ResetService {
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
    print(obj["data"]);
    return obj["data"];
  }

  update({
    required String password,
    required String passwordConfirmation,
    required String currentPassword,
  }) async {
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
        "password_confirmation": passwordConfirmation,
        "current_password": currentPassword,
      },
    );
    Map obj = response.data;
    print(
        "Request payload: $password, $passwordConfirmation, $currentPassword");
    print("Response data: ${obj['data']}");
    print("Full Response: $response");

    print("Status Code: ${response.statusCode}");
    return obj["data"]["id"];
  }
}
