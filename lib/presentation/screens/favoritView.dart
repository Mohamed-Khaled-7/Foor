import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(LucideIcons.heart))],
        title: Text(
          'Favoriates Page',
          style: GoogleFonts.poppins(fontSize: 30, color: Colors.black),
        ),
      ),
      body: Center(
        child: Text('No Favoriates!', style: GoogleFonts.poppins(fontSize: 23)),
      ),
    );
  }
}
