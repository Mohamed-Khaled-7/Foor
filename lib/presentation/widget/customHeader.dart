import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeader extends StatelessWidget {
  CustomHeader({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
