import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomTextField extends StatelessWidget {
  Function(String) onChange;
  final bool enabled;
  final String? hintText;
  final IconData? icon;
  final String? lable;
  final TextEditingController? controller;
  final int? color;
  final String? Function(String?)? validator;
  CustomTextField({
    this.enabled = true,
    this.color,
    this.controller,
    super.key,
    this.hintText,
    required this.onChange,
    this.icon,
    this.lable,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      validator: validator,
      cursorColor: Colors.black,
      onChanged: onChange,
      style: GoogleFonts.poppins(
        color: Colors.grey[800],
        fontWeight: FontWeight.bold,
        fontSize: 19,
      ),
      decoration: InputDecoration(
        prefixIcon: icon != null
            ? Icon(icon, color: Colors.black, size: 23)
            : null,
        hintText: hintText,
        labelStyle: GoogleFonts.poppins(
          color: Colors.grey[800],
          fontWeight: FontWeight.bold,
        ),
        hintStyle: GoogleFonts.poppins(
          color: Colors.grey[700],
          fontWeight: FontWeight.bold,
        ),
        floatingLabelStyle: GoogleFonts.poppins(color: const Color(0xFF000000)),
        filled: true,
        labelText: lable,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black),
        ),
        fillColor: Color(color ?? 0x00000000),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black, width: 3),
        ),
      ),
    );
  }
}
