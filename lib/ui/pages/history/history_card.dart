import 'package:flutter/material.dart';

class RiwayatCard extends StatelessWidget {
  final String tanggal;
  final String status;

  RiwayatCard({required this.tanggal, this.status = ''});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Customize your card design as needed
      child: ListTile(
        title: Text('Tanggal: $tanggal'),
        subtitle: Text('Status: $status'),
      ),
    );
  }
}
