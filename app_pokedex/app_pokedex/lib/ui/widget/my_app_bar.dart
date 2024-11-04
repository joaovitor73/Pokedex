import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MyAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 10,
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      /* actions: const [
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ],*/
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
