import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CustomTextSearch extends StatelessWidget {
  const CustomTextSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: GoogleFonts.poppins(color: Colors.black),
          //labelStyle: GoogleFonts.poppins(color: Colors.black),
          //labelText: 'Search',
          prefixIcon: Icon(LucideIcons.search, color: Colors.black),
          prefixIconConstraints: BoxConstraints(minWidth: 40, minHeight: 40),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(44),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(44),
            borderSide: BorderSide(color: Colors.black, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(44),
            borderSide: BorderSide(color: Colors.black, width: 1.5),
          ),
          fillColor: Color(0xffF5F5F5),
          filled: true,
          contentPadding: EdgeInsetsGeometry.symmetric(vertical: 10),
        ),
      ),
    );
  }
}
