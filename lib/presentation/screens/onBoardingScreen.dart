import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musa/data/models/onBoardingModel.dart';
import 'package:musa/presentation/screens/registerPage.dart';
import 'package:musa/presentation/screens/loginPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static String id = 'OnBoardingScreen';
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;
  List<OnboardingModel> pageList = [
    OnboardingModel(
      description:
          'Explore unique collections inspired by airplanes and rockets, and create a bold, modern look.',
      title: 'Discover Your Style',
      image: 'assets/images/fisrtOnBoard.png',
    ),
    OnboardingModel(
      description:
          'Enjoy exclusive offers on standout pieces and get the best value every time you shop.',
      title: 'Deals That Take Off',
      image: 'assets/images/secondOnBoard.png',
    ),
    OnboardingModel(
      description:
          'Quick checkout and fast delivery straight to your door for a smooth shopping experience',
      title: 'Easy Order and Fast  \n Delivery',
      image: 'assets/images/thridOnBoard.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index; //هنا بنغير الانديكس
              });
            },
            itemCount: pageList.length,
            itemBuilder: (context, index) {
              return buildOnboardingPage(pageList[index]);
            },
          ),

          Positioned(
            bottom: 54,
            left: 32,
            right: 32,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (currentIndex == 2) {
                        Navigator.pushNamed(context, LoginPage.id);
                      } else {
                        pageController.animateToPage(
                          2,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: Text(
                      currentIndex == 2 ? 'Login' : 'Skip',
                      style: GoogleFonts.montserrat(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (currentIndex == 2) {
                        Navigator.pushNamed(context, RegisterPage.id);
                      } else {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      currentIndex == 2 ? 'Register' : 'Next',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: pageList.length,
                effect: const WormEffect(
                  dotColor: Colors.white38,
                  activeDotColor: Colors.white,
                  dotHeight: 12,
                  dotWidth: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOnboardingPage(OnboardingModel page) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(page.image, fit: BoxFit.cover)),
        Container(color: Colors.black.withOpacity(0.3)),
        Padding(
          padding: const EdgeInsets.only(top: 96),
          child: Column(
            children: [
              const Spacer(flex: 3),
              Text(
                page.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  shadows: [
                    const Shadow(
                      blurRadius: 10.0,
                      color: Colors.black45,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                page.description,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
