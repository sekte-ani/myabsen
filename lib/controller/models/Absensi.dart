import 'package:get/get.dart';

class Attendece {
  final int userId;
  final String tanggalMasuk;
  final String jamMasuk;
  final String status;
//  final String createdAt;

  Attendece(
      {required this.userId,
      required this.tanggalMasuk,
      required this.jamMasuk,
      required this.status});

  factory Attendece.fromJson(Map<String, dynamic> json) {
    return Attendece(
      userId: json['user_id'],
      tanggalMasuk: json['jam_masuk'],
      jamMasuk: json['jam_masuk'],
      status: json['status'],
    );
  }
}
