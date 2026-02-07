import 'package:musa/firebase_options.dart';
import 'package:musa/presentation/screens/homeScreen.dart';
import 'package:musa/presentation/screens/navigation_view.dart';
import 'package:musa/presentation/screens/registerPage.dart';
import 'package:musa/presentation/screens/loginPage.dart';
import 'package:musa/presentation/screens/onBoardingScreen.dart';
import 'package:musa/presentation/screens/search_view.dart';
import 'package:musa/presentation/screens/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(Foor());
}

class Foor extends StatelessWidget {
  Foor({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        SearchView.id: (context) => SearchView(),
        SplashScreen.id: (context) => SplashScreen(),
        NavigationView.id: (context) => NavigationView(),
        OnBoardingScreen.id: (context) => OnBoardingScreen(),
        RegisterPage.id: (context) => RegisterPage(),
        LoginPage.id: (context) => LoginPage(),
      },
      initialRoute: 'NavigationView',
      debugShowCheckedModeBanner: false,
    );
  }
}