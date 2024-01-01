import 'package:MyAbsen/controller/models/Profile.dart';
import 'package:MyAbsen/theme.dart';
import 'package:MyAbsen/ui/widgets/buttons.dart';
import 'package:MyAbsen/ui/widgets/datepicker.dart';
import 'package:MyAbsen/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MyAbsen/services/profile_service.dart';
import 'package:MyAbsen/controller/profile_controller.dart';
import 'package:MyAbsen/ui/widgets/forms.dart';
import 'package:MyAbsen/ui/widgets/validator.dart';

class ProfileEditPage extends GetView<ProfileController> {
  ProfileController controller = Get.put(ProfileController());

  // const ProfileEditPage({super.key});
  final Map? itemProfile;
  ProfileEditPage({
    Key? key,
    this.itemProfile,
  }) : super(key: key);

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
                      validator: Validator.required,
                      value: controller.name,
                      onChange: (value) {
                        controller.name = value;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputField(
                      title: "No Pegawai",
                      hintText: "Masukkan nomor pegawai anda...",
                      // controller: nomorIndukController,
                      validator: Validator.required,
                      value: controller.no_induk,
                      onChange: (value) {
                        controller.no_induk = value;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputField(
                      title: "Email",
                      hintText: "Masukkan email anda...",
                      // controller: emailController,
                      validator: Validator.required,
                      value: controller.email,
                      onChange: (value) {
                        controller.email = value;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    QDatePicker(
                      label: "Tanggal Lahir",
                      validator: Validator.required,
                      value: controller.born != null
                          ? DateTime.parse(controller.born!)
                          : null,
                      onChanged: (value) {
                        controller.born = value.toString();
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputFieldBox(
                      title: "Alamat",
                      hintText: "Masukkan alamat rumah anda...",
                      validator: Validator.required,
                      value: controller.address,
                      onChange: (value) {
                        controller.address = value;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    PrimaryButton(
                      title: "Perbarui Profile",
                      onPressed: controller.isUpdatingProfile.value
                          ? null
                          : () {
                              controller.updateProfile(
                                name: controller.name!,
                                no_induk: controller.no_induk!,
                                email: controller.email!,
                                born: controller.born!,
                                address: controller.address!,
                                // password: controller.password!,
                              );
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
