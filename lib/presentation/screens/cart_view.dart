import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static final id = 'BageView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        title: Text('My Bage', style: GoogleFonts.poppins(fontSize: 30)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(LucideIcons.shoppingBag)),
        ],
      ),
      body: Center(
        child: Text(
          'No items in your card!',
          style: GoogleFonts.poppins(fontSize: 23),
        ),
      ),
    );
  }
}
