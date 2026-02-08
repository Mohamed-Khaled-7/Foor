import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CustomAddCardButton extends StatelessWidget {
  VoidCallback? onPressed;

  CustomAddCardButton({super.key, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(LucideIcons.shoppingBag, color: Colors.white),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4C6FFF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 0,
      ),
      label: Text(
        'Add Card',
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
