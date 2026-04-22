import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/features/cart/presentation/views/cart_view.dart';
import 'package:musa/features/favoriate/presentation/views/favoriate_view.dart';
import 'package:musa/features/home/presentation/views/home_view.dart';
import 'package:musa/features/profile/presentation/views/profile_view.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});
  static String id = 'NavigationView';
  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  DateTime? lastPressed;
  int currentIndex = 0;
  List<Widget> listWidget = [
    HomeView(),
    FavoriateView(),
    CartView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentIndex != 0) {
          setState(() => currentIndex = 0);
          return false;
        }
        final now = DateTime.now();
        if (lastPressed == null ||
            now.difference(lastPressed!) > Duration(seconds: 2)) {
          lastPressed = now;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Press back again to exit")));
          return false;
        }
        return true;
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: GoogleFonts.poppins(fontSize: 18),
          selectedItemColor: Colors.black,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
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
      ),
    );
  }
}
