import 'package:MyAbsen/theme.dart';
import 'package:MyAbsen/ui/widgets/buttons.dart';
import 'package:MyAbsen/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfileResetPage extends StatelessWidget {
  const ProfileResetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset Password',
          style: TextStyle(
              color: Colors
                  .white), // font_semiBold.copyWith(color: whiteColor) tidak didefinisikan di kode yang Anda berikan
        ),
        backgroundColor: Colors.green,
      ),
      body: ResetPasswordForm(),
    );
  }
}

class ResetPasswordForm extends StatefulWidget {
  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 15),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.vertical(top: Radius.circular(27)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 24),
              InputFieldPassword(
                title: "Password Lama",
                hintText: "Masukkan password lama anda..",
                controller: oldPasswordController,
              ),
              const SizedBox(height: 16),
              InputFieldPassword(
                title: "Password Baru",
                hintText: "Masukkan password baru anda..",
                controller: newPasswordController,
              ),
              const SizedBox(height: 16),
              InputFieldPassword(
                title: "Konfirmasi Password",
                hintText: "Masukkan ulang password baru..",
                controller: confirmPasswordController,
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                title: "Ubah Password",
                onPressed: changePassword,
              ),
            ],
          ),
        ),
      ],
    );
  }

  bool isValidPassword(
      String oldPassword, String newPassword, String confirmPassword) {
    return oldPassword.isNotEmpty &&
        newPassword.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        newPassword == confirmPassword;
  }

  void changePassword() async {
    final oldPassword = oldPasswordController.text;
    final newPassword = newPasswordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (isValidPassword(oldPassword, newPassword, confirmPassword)) {
      final response = await http.post(
        Uri.parse('https://myabsen.ferdirns.com/api/reset-password'),
        headers: {
          'Content-Type': 'application/json',
          // Tambahkan header otentikasi jika diperlukan
        },
        body: jsonEncode({
          'old_password': oldPassword,
          'new_password': newPassword,
          // Tambahkan field lain yang dibutuhkan
        }),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Berhasil', 'Password berhasil diubah!');
        // Lakukan navigasi atau re-login jika diperlukan
      } else {
        Get.snackbar('Gagal', 'Gagal mengubah password. Silakan coba lagi.');
      }
    } else {
      Get.snackbar('Error', 'Password tidak valid');
    }
  }
}
