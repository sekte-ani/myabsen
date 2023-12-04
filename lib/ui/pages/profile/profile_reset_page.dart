import 'package:MyAbsen/theme.dart';
import 'package:MyAbsen/ui/widgets/buttons.dart';
import 'package:MyAbsen/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileResetPage extends StatelessWidget {
  const ProfileResetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: whiteColor,
        ),
        title: Text(
          'Reset Password',
          style: font_semiBold.copyWith(
            color: whiteColor,
          ),
        ),
        backgroundColor: green2Color,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: green2Color,
            ),
          ),
          ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(27),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    InputFieldPassword(
                      title: "Password Lama",
                      hintText: "Masukkan password lama anda..",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputFieldPassword(
                      title: "Password Baru",
                      hintText: "Masukkan password baru anda..",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputFieldPassword(
                      title: "Konfirmasi Password",
                      hintText: "Masukkan ulang password baru..",
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    PrimaryButton(
                      title: "Ubah Password",
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
