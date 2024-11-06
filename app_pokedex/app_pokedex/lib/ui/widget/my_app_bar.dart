import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color colors;
  final Color colorText;
  const MyAppBar({
    super.key,
    required this.title,
    this.colors = Colors.white,
    this.colorText = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 10,
      backgroundColor: colors,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: colorText,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
