import 'package:get/get.dart';

class History {
  final int userId;
  final String tanggalMasuk;
  final String jamMasuk;
  final String tanggalKeluar;
  final String jamKeluar;
  final int status;

  History({
    required this.userId,
    required this.tanggalMasuk,
    required this.jamMasuk,
    required this.tanggalKeluar,
    required this.jamKeluar,
    required this.status,
  });

  static String getStatusString(int statusCode) {
    if (statusCode == 0) {
      return 'Cuti';
    } else if (statusCode == 1) {
      return 'Hadir';
    } else {
      return 'Status tidak diketahui';
    }
  }

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      userId: json['id'],
      tanggalMasuk: json['tanggal_masuk'],
      jamMasuk: json['jam_masuk'],
      tanggalKeluar: json['tanggal_keluar'],
      jamKeluar: json['jam_keluar'],
      status: json['status'],
    );
  }
}
