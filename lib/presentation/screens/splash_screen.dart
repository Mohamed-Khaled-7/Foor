import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:musa/presentation/screens/onBoarding_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String id = 'SplashScreen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool showSubtitle = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation =
        Tween<double>(begin: -200, end: 0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut),
        )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            setState(() {
              showSubtitle = true;
            });
          }
        });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _animation.value),
                  child: child,
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric( horizontal: 16),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,        
                  child: Text(
                    'Smart Shopping',
                    style: GoogleFonts.pacifico(
                      fontSize: 64,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (showSubtitle)
              DefaultTextStyle(
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  color: Colors.white70,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'All You Need In One Place',
                      speed: const Duration(milliseconds: 150),
                    ),
                  ],
                  totalRepeatCount: 1,
                  onFinished: () {
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.pushNamed(context, OnBoardingScreen.id);
                    });
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
