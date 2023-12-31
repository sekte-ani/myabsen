import 'package:MyAbsen/controller/login_controller.dart';
import 'package:MyAbsen/ui/widgets/buttons.dart';
import 'package:MyAbsen/ui/widgets/forms.dart';
import 'package:MyAbsen/ui/widgets/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:MyAbsen/theme.dart';
import 'package:flutter/services.dart';

class LoginPage extends GetView<LoginController> {
  final LoginController controller = Get.find<LoginController>();

  // TextEditingController properties
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: green2Color, // Ensure green2Color is defined
        image: DecorationImage(
          image: const AssetImage("assets/bg3.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            green2Color.withOpacity(0.2),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top: 80, child: _buildTop(mediaSize)),
            Positioned(bottom: 50, child: _buildBottom(mediaSize)),
          ],
        ),
      ),
    );
  }

  Widget _buildTop(Size mediaSize) {
    return Container(
      width: mediaSize.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.assignment_ind_outlined, size: 100, color: Colors.white),
          Text(
            "MyAbsen",
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottom(Size mediaSize) {
    return Container(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Selamat datang!",
            style: GoogleFonts.montserrat(
              color: green2Color, // Ensure green2Color is defined
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text("Silahkan login dengan credential anda"),
          const SizedBox(height: 50),
          InputField(
            title: "Email",
            hintText: "Masukkan email anda..",
            controller: emailController,
            validator: Validator.email,
            onChange: (value) {
              controller.email = value;
            },
          ),
          const SizedBox(height: 30),
          InputFieldPassword(
            title: "Password",
            hintText: "Masukkan password anda..",
            controller: passwordController,
            validator: Validator.required,
            onChange: (value) {
              controller.password = value;
            },
          ),
          const SizedBox(height: 40),
          PrimaryButton(
            title: "Login",
            onPressed: () {
              debugPrint("Email : ${emailController.text}");
              debugPrint("Password : ${passwordController.text}");
              controller.onLogin();
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
