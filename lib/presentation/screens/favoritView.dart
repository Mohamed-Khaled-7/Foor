import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text(
          'Favoriates Page',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body:Center(
        child: Text('No items in your card!',style: GoogleFonts.poppins(
          fontSize: 23
        ),),
      )
    );
  }
}
