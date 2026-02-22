import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/presentation/widget/custom_search_delegate.dart';

class CustomTextSearch extends StatelessWidget {
  const CustomTextSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        readOnly: true,
        onTap: () {
          showSearch(context: context, delegate: CustomSearchDelegate());
        },
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: GoogleFonts.poppins(color: Colors.black),
          prefixIcon: Icon(LucideIcons.search, color: Colors.black),
          prefixIconConstraints: BoxConstraints(minWidth: 48, minHeight: 40),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(44),
            borderSide: BorderSide(color: Color.fromARGB(255, 218, 217, 217)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(44),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 218, 217, 217),
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(44),
            borderSide: BorderSide(color: Color(0xffF5F5F5), width: 1.5),
          ),
          fillColor: Color.fromARGB(255, 218, 217, 217),
          filled: true,
          contentPadding: EdgeInsetsGeometry.symmetric(vertical: 10),
        ),
      ),
    );
  }
}
