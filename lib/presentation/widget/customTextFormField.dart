import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/presentation/widget/customSnakPar.dart';

class CustomTextField extends StatelessWidget {
  Function(String) onChange;
  final String hintText;
  final IconData icon;
  final String lable;

  final String? Function(String?) validator;
  CustomTextField({
    super.key,
    required this.hintText,
    required this.onChange,
    required this.icon,
    required this.lable,
    required this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      cursorColor: Colors.black,
      onChanged: onChange,
      style: GoogleFonts.poppins(color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.black, size: 20),
        hintText: hintText,

        labelStyle: GoogleFonts.poppins(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
        hintStyle: GoogleFonts.poppins(color: Colors.grey),
        floatingLabelStyle: GoogleFonts.poppins(color: Colors.black),
        filled: true,
        labelText: lable,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black),
        ),
        fillColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black, width: 1.5),
        ),
      ),
    );
  }
}
