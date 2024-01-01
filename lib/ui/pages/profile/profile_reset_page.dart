import 'package:MyAbsen/controller/reset_password_controller.dart';
import 'package:MyAbsen/theme.dart';
import 'package:MyAbsen/ui/widgets/buttons.dart';
import 'package:MyAbsen/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:MyAbsen/services/reset_service.dart';
import 'package:MyAbsen/ui/widgets/forms.dart';
import 'package:MyAbsen/ui/widgets/validator.dart';

class ProfileResetPage extends StatelessWidget {
  // const ProfileResetPage({Key? key}) : super(key: key);
  final Map? itemReset;
  ProfileResetPage({
    Key? key,
    this.itemReset,
  }) : super(key: key);

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
  ResetController controller = Get.put(ResetController());

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
                validator: Validator.required,
                value: controller.password,
                onChange: (value) {
                  controller.password = value;
                },
              ),
              const SizedBox(height: 16),
              InputFieldPassword(
                title: "Password Baru",
                hintText: "Masukkan password baru anda..",
                controller: newPasswordController,
                validator: Validator.required,
                value: controller.passwordConfirmation,
                onChange: (value) {
                  controller.passwordConfirmation = value;
                },
              ),
              const SizedBox(height: 16),
              InputFieldPassword(
                title: "Konfirmasi Password",
                hintText: "Masukkan ulang password baru..",
                controller: confirmPasswordController,
                validator: Validator.required,
                value: controller.currentPassword,
                onChange: (value) {
                  controller.currentPassword = value;
                },
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                title: "Perbarui Profile",
                onPressed: controller.isUpdatingPassword.value
                    ? null
                    : () {
                        // print("name : ${controller.name}");
                        print("password: ${controller.password}");
                        print(
                            "password_confirmation: ${controller.passwordConfirmation}");
                        print(
                            "current_password: ${controller.currentPassword}");

                        controller.updatePassword(
                          password: controller.password!,
                          password_confirmation:
                              controller.passwordConfirmation!,
                          current_password: controller.currentPassword!,
                        );
                      },
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
          // 'old_password': oldPassword,
          // 'new_password': newPassword,
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
