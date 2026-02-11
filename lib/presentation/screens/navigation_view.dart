import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/presentation/screens/HomeScreen.dart';
import 'package:musa/presentation/screens/cart_view.dart';
import 'package:musa/presentation/screens/favoritView.dart';
import 'package:musa/presentation/screens/profileScreen.dart';
import 'package:musa/presentation/screens/search_view.dart';

class NavigationView extends StatefulWidget {
  NavigationView({super.key});
  static String id = 'NavigationView';

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int currentIndex = 0;
  @override
  List<Widget> listWidget = [
    HomeScreen(),
    FavoritesView(),
    CartView(),
    ProfilePage(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: GoogleFonts.poppins(fontSize: 18),
        selectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (val) {
          setState(() {
            currentIndex = val;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.home, color: Colors.black54),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.heart, color: Colors.black54),
            label: "Favoriates",
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.shoppingBag, color: Colors.black54),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.user, color: Colors.black54),
            label: "You",
          ),
        ],
      ),
      body: listWidget[currentIndex],
    );
  }
}
