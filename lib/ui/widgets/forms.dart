import 'package:MyAbsen/controller/shared/datepicker_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:MyAbsen/theme.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboard;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String?)? onChange;
  final String? value;
  final bool? enabled;
  const InputField({
    Key? key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.inputFormatters,
    this.onChange,
    this.keyboard,
    this.value,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // input username
        Text(
          title,
          style: font_semiBold,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          obscureText: obscureText,
          initialValue: value,
          controller: controller,
          enabled: enabled,
          validator: validator,
          inputFormatters: inputFormatters,
          onChanged: onChange,
          keyboardType: keyboard,
          decoration: InputDecoration(
            filled: true,
            fillColor: whiteColor,
            focusColor: whiteColor,
            hintText: hintText,
            hintStyle: font_regular.copyWith(
              fontSize: 14,
              color: greyColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: greyColor, // Set the default border color
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: darkGreenColor,
                )),
            contentPadding: const EdgeInsets.only(
              top: 12,
              bottom: 12,
              left: 20,
            ),
          ),
        ),
      ],
    );
  }
}

class InputFieldEmail extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String?)? onChange;

  const InputFieldEmail({
    Key? key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.inputFormatters,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // input username
        Text(
          title,
          style: font_semiBold,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          inputFormatters: inputFormatters,
          onChanged: onChange,
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: whiteColor,
            focusColor: whiteColor,
            hintText: hintText,
            hintStyle: font_regular.copyWith(
              fontSize: 14,
              color: greyColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: greyColor, // Set the default border color
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: darkGreenColor,
                )),
            contentPadding: const EdgeInsets.only(
              top: 12,
              bottom: 12,
              left: 20,
            ),
          ),
        ),
      ],
    );
  }
}

class InputFieldPassword extends StatelessWidget {
  final String title;
  final String hintText;
  var _obscureText = true.obs;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String?)? onChange;
  final RxBool isChecked = false.obs;
  final RxBool isSwitch = false.obs;

  InputFieldPassword({
    Key? key,
    required this.title,
    required this.hintText,
    this.controller,
    this.validator,
    this.inputFormatters,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // input username
        Text(
          title,
          style: font_semiBold,
        ),
        const SizedBox(
          height: 8,
        ),
        Obx(
          () => TextFormField(
            obscureText: _obscureText.value,
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            inputFormatters: inputFormatters,
            onChanged: onChange,
            validator: validator,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  _obscureText.value = !_obscureText.value;
                },
                child: Icon(_obscureText.value
                    ? Icons.visibility
                    : Icons.visibility_off),
              ),
              filled: true,
              fillColor: whiteColor,
              focusColor: whiteColor,
              hintText: hintText,
              hintStyle: font_regular.copyWith(
                fontSize: 14,
                color: greyColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: greyColor, // Set the default border color
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    color: darkGreenColor,
                  )),
              contentPadding: const EdgeInsets.only(
                top: 12,
                bottom: 12,
                left: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class InputFieldBox extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String?)? onChange;
  final String? value;

  const InputFieldBox({
    Key? key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.inputFormatters,
    this.onChange,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // input username
        Text(
          title,
          style: font_semiBold,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          minLines: 4,
          maxLines: 5,
          keyboardType: TextInputType.multiline,
          obscureText: obscureText,
          initialValue: value,
          controller: controller,
          validator: validator,
          inputFormatters: inputFormatters,
          onChanged: onChange,
          decoration: InputDecoration(
            filled: true,
            fillColor: whiteColor,
            focusColor: whiteColor,
            hintText: hintText,
            hintStyle: font_regular.copyWith(
              fontSize: 14,
              color: greyColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: greyColor, // Set the default border color
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: darkGreenColor,
                )),
            contentPadding: const EdgeInsets.only(
              top: 12,
              bottom: 12,
              left: 20,
            ),
          ),
        ),
      ],
    );
  }
}

class InputFieldDate extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final DatePickerController dateController = Get.put(DatePickerController());
  final TextEditingController _dateController = TextEditingController();
  final DateTime? value;
  final Function(DateTime) onChanged;
  InputFieldDate({
    Key? key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // input username
        Text(
          title,
          style: font_semiBold,
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          obscureText: obscureText,
          controller: _dateController,
          onTap: () {
            dateController.chooseDate(_dateController);
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: whiteColor,
            suffixIcon: GestureDetector(
              onTap: () => dateController.chooseDate(_dateController),
              child: Icon(
                Icons.calendar_month,
                color: darkGreyColor,
              ),
            ),
            hintText: hintText,
            hintStyle: font_regular.copyWith(
              color: greyColor,
              fontSize: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: greyColor, // Set the default border color
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: darkGreenColor,
                )),
            contentPadding: const EdgeInsets.only(
              top: 12,
              bottom: 12,
              left: 20,
            ),
          ),
        ),
      ],
    );
  }
}
