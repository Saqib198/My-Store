import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Custom App Bar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? isBack;
  final Function()? onBackTap;


  const CustomAppBar({
    Key? key,
    required this.title,
    this.isBack = false,
    this.onBackTap,

  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: GoogleFonts.playfairDisplay(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: isBack!
          ? IconButton(
              onPressed: onBackTap,
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              ),
            )
          : null,
    );
  }
}
