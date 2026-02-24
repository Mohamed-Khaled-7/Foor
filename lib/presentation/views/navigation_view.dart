import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/business_logic/cubit/auth_cubit.dart';
import 'package:musa/presentation/views/cart_view.dart';
import 'package:musa/presentation/views/favoritView.dart';
import 'package:musa/presentation/views/home_screen.dart';
import 'package:musa/presentation/views/login_view.dart';
import 'package:musa/presentation/views/profile_view.dart';

class NavigationView extends StatefulWidget {
  NavigationView({super.key});
  static String id = 'NavigationView';

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  DateTime? lastPressed;
  int currentIndex = 0;
  @override
  List<Widget> listWidget = [
    HomeScreen(),
    FavoritesView(),
    CartView(),
    ProfilePage(),
  ];
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
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthUnAuthenticated) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => LoginPage()),
              (_) => false,
            );
          }
        },
        child: Scaffold(
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
        ),
      ),
    );
  }
}
