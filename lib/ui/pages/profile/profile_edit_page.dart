import 'package:MyAbsen/controller/models/Profile.dart';
import 'package:MyAbsen/theme.dart';
import 'package:MyAbsen/ui/widgets/buttons.dart';
import 'package:MyAbsen/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MyAbsen/controller/profile_controller.dart';

class ProfileEditPage extends StatelessWidget {
  final ProfileController profileController = Get.find();
  // const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController nomorIndukController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController bornController = TextEditingController();
    TextEditingController addressController = TextEditingController();
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
                      controller: nameController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputField(
                      title: "NoPeg",
                      hintText: "Masukkan nomor pegawai anda...",
                      controller: nomorIndukController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputField(
                      title: "Email",
                      hintText: "Masukkan email anda...",
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputFieldDate(
                      title: "Tanggal Lahir",
                      hintText: "Masukkan tanggal lahir anda...",
                      controller: bornController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputFieldBox(
                      title: "Alamat",
                      hintText: "Masukkan alamat anda...",
                      controller: addressController,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    PrimaryButton(
                      title: 'Perbarui Profile',
                      onPressed: () {
                        // Mengambil nilai dari input fields
                        String name = nameController.text;
                        String nomorInduk = nomorIndukController.text;
                        String email = emailController.text;
                        String born = bornController.text;
                        String address = addressController.text;

                        // Membuat objek Profile dari nilai-nilai yang diambil
                        Profile updatedProfile = Profile(
                          id: profileController.profile['id'] ?? 0,
                          name: name,
                          nomorInduk: nomorInduk,
                          email: email,
                          born: born,
                          address: address,
                        );

                        // Memanggil fungsi onUpdateProfile dari controller untuk memperbarui profil
                        // profileController.onUpdateProfile(updatedProfile);
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
