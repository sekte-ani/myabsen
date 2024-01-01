import 'package:get/get.dart';

class Profile {
  final int id;
  final String name;
  final String nomorInduk;
  final String email;
  final String born;
  final String address;

  Profile({
    required this.id,
    required this.name,
    required this.nomorInduk,
    required this.email,
    required this.born,
    required this.address,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: int.parse(json['id']), // Ubah tipe data 'id' menjadi 'int'
      name: json['name'],
      nomorInduk: json['nomor_induk'],
      email: json['email'],
      born: json['born'],
      address: json['address'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nomor_induk': nomorInduk,
      'email': email,
      'born': born,
      'address': address,
    };
  }
}
