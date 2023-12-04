import 'package:flutter/material.dart';
import 'package:MyAbsen/theme.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const PrimaryButton({
    Key? key,
    required this.title,
    this.width = double.infinity,
    this.height = 50,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: greenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          title,
          style: font_semiBold.copyWith(
            fontSize: 16,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final IconData ikon;
  final Color warna;
  final VoidCallback? onPressed;

  const CustomIconButton({
    Key? key,
    required this.title,
    required this.ikon,
    this.width = double.infinity,
    this.height = 50,
    this.warna = Colors.white,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.isFinite ? width : null,
      height: height.isFinite ? height : null,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: greenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Icon(
          ikon,
          color: warna,
          size: 24,
        ),
      ),
    );
  }
}
