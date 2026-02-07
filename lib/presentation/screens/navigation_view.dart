import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/presentation/screens/HomeScreen.dart';
import 'package:musa/presentation/screens/favoritScreen.dart';
import 'package:musa/presentation/screens/profileScreen.dart';
import 'package:musa/presentation/screens/search_view.dart';

class NavigationView extends StatefulWidget {
  NavigationView({super.key});
  static String id = 'NavigationScreen';

  @override
  State<NavigationView> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<NavigationView> {
  int currentIndex = 0;
  @override
  List<Widget> listWidget = [HomeScreen(), SearchView(),FavoritesPage(), ProfilePage()];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // appBar: AppBar(
      //   title: const Text('Home Page', style: TextStyle(color: Colors.white)),
      //   backgroundColor: Colors.white,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (val) {
          setState(() {
            currentIndex = val;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(LucideIcons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.heart),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.user),
            label: "Profile",
          ),
          
        ],
      ),
      body: listWidget[currentIndex],
    );
  }
}
