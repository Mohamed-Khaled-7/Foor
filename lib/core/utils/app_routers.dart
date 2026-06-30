import 'package:go_router/go_router.dart';
import 'package:musa/core/shared/product.dart';
import 'package:musa/features/auth/presentation/views/login_view.dart';
import 'package:musa/features/auth/presentation/views/register_view.dart';
import 'package:musa/features/cart/presentation/views/cart_view.dart';
import 'package:musa/features/favoriate/presentation/views/favoriate_view.dart';
import 'package:musa/features/home/presentation/views/home_view.dart';
import 'package:musa/features/home/presentation/views/navigation_view.dart';
import 'package:musa/features/home/presentation/views/product_details_view.dart';
import 'package:musa/features/onBoarding/presentation/views/onBoardingView.dart';
import 'package:musa/features/payment/presentation/views/widgets/payment_details_screen.dart';
import 'package:musa/features/profile/presentation/views/profile_view.dart';
import 'package:musa/features/splash/presentation/views/splash_view.dart';

class AppRouters {
  static const String paymentView = '/PaymentView';
  static const String navigationView = '/NavigationView';
  static const String loginView = '/LoginView';
  static const String registerView = '/RegisterView';
  static const String homeView = '/HomeView';
  static const String cartView = '/CartView';
  static const String profileView = '/ProfileView';
  static const String favoriateView = '/FavoriateView';
  static const String productDetailsView = '/ProductDetailsView';
  static const String splashView = '/SplashView';
  static const String onBoardingView = '/OnBoardingView';
  static final routers = GoRouter(
    routes: [
      GoRoute(
        path: navigationView,
        builder: (context, state) => NavigationView(),
      ),
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(path: loginView, builder: (context, state) => LoginView()),
      GoRoute(path: registerView, builder: (context, state) => RegisterView()),
      GoRoute(
        path: onBoardingView,
        builder: (context, state) => OnBoardingView(),
      ),
      GoRoute(path: homeView, builder: (context, state) => HomeView()),
      GoRoute(path: cartView, builder: (context, state) => CartView()),
      GoRoute(path: profileView, builder: (context, state) => ProfileView()),
      GoRoute(
        path: favoriateView,
        builder: (context, state) => FavoriateView(),
      ),
      GoRoute(
        path: paymentView,
        builder: (context, state) => PaymentDetailsScreen(),
      ),
      GoRoute(
        path: productDetailsView,
        builder: (context, state) {
          final product = state.extra as Product;
          return ProductDetailsView(product: product);
        },
      ),
    ],
  );
}
