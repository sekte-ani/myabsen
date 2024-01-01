import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
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
    print(obj["data"]);
    return obj["data"];
  }

  update({
    // required int id,
    // required String name,
    required String phone,
    required String email,
    required String born,
    required String address,
  }) async {
    String? token = box.read("token");
    var response = await Dio().post(
      "https://myabsen.ferdirns.com/api/profile",
      options: Options(
        headers: {
          "Accept": "*/*",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
      data: {
        // "name": name,
        "phone": phone,
        "email": email,
        "born": born,
        "address": address,
      },
    );
    Map obj = response.data;
    print("Request payload: $phone, $email, $born, $address");
    print("Response data: ${obj['data']}");
    print("Full Response: $response");

    print("Status Code: ${response.statusCode}");
    return obj["data"]["id"];
  }
}
