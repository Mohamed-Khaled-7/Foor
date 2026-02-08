import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 30),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(LucideIcons.user2))],
      ),
      body: Center(
        child: Text(
          'No Profile Information!',
          style: GoogleFonts.poppins(fontSize: 23),
        ),
      ),
    );
  }
}
