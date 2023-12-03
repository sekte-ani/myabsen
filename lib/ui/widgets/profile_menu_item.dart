import 'package:flutter/material.dart';
import 'package:MyAbsen/theme.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData iconUrl;
  final String title;
  final Color textColor;
  final VoidCallback? onTap;

  const ProfileMenuItem({
    Key? key,
    required this.iconUrl,
    required this.title,
    this.textColor = const Color(0xff404040),
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 30,
        ),
        child: Row(
          children: [
            Icon(
              iconUrl,
              color: textColor,
              size: 25,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              title,
              style: font_medium.copyWith(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
