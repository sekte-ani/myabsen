import 'package:MyAbsen/theme.dart';
import 'package:MyAbsen/ui/widgets/buttons.dart';
import 'package:MyAbsen/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: whiteColor,
        ),
        title: Text(
          'Edit Profile',
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
                      height: 34,
                    ),
                    InputField(
                      title: "Nama Lengkap",
                      hintText: "Masukkan nama anda...",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputField(
                      title: "NoPeg",
                      hintText: "Masukkan nomor pegawai anda...",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputField(
                      title: "Email",
                      hintText: "Masukkan email anda...",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputFieldDate(
                      title: "Tanggal Lahir",
                      hintText: "Masukkan tanggal lahir anda...",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputFieldBox(
                      title: "Alamat",
                      hintText: "Masukkan alamat anda...",
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    PrimaryButton(
                      title: 'Perbarui Profile',
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    const SizedBox(
                      height: 40,
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
