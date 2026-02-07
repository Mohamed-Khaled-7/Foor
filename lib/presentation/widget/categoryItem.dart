import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 218, 217, 217),
        //borderRadius: BorderRadius.circular(66),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/images/MusaBrand.webp'),
      ),
    );
  }
}
