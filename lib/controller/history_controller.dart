import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:MyAbsen/services/history_service.dart';
import 'package:MyAbsen/controller/models/History.dart';

class HistoryController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getHistory();
    update();
  }

  RxList<dynamic> history = <dynamic>[].obs;

  Future<void> getHistory() async {
    try {
      history.assignAll(await HistoryService().get());
      update(); // Ensure to call update after changing the data
    } catch (e) {
      print('Error fetching absens: $e');
    }
  }
}
