import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BageView extends StatelessWidget {
  const BageView({super.key});
  static final id = 'BageView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bage View', style: GoogleFonts.poppins(fontSize: 23)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(LucideIcons.shoppingBag)),
        ],
      ),
    );
  }
}
