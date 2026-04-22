import 'package:go_router/go_router.dart';
import 'package:musa/features/auth/presentation/views/login_view.dart';
import 'package:musa/features/auth/presentation/views/register_view.dart';
import 'package:musa/features/cart/presentation/views/cart_view.dart';
import 'package:musa/features/favoriate/presentation/views/favoriate_view.dart';
import 'package:musa/features/home/presentation/views/home_view.dart';
import 'package:musa/features/home/presentation/views/navigation_view.dart';
import 'package:musa/features/home/presentation/views/product_details_view.dart';
import 'package:musa/features/profile/presentation/views/profile_view.dart';

class AppRouters {
  static const String navigationView = '/NavigationView';
  static const String loginView = '/LoginView';
  static const String registerView = '/RegisterView';
  static const String homeView = '/HomeView';
  static const String cartView = '/CartView';
  static const String profileView = '/ProfileView';
  static const String favoriateView = '/FavoriateView';
  static const String productDetailsView = '/ProductDetailsView';
  static final routers = GoRouter(
    routes: [
      GoRoute(path: '/' , builder: (context, state) => NavigationView()),
      GoRoute(path: loginView , builder: (context, state) => LoginView()),
      GoRoute(path: registerView , builder: (context, state) => RegisterView()),
      GoRoute(path: homeView , builder: (context, state) => HomeView()),
      GoRoute(path: cartView , builder: (context, state) => CartView()),
      GoRoute(path: profileView , builder: (context, state) => ProfileView()),
      GoRoute(path: favoriateView , builder: (context, state) => FavoriateView()),
      GoRoute(path: productDetailsView , builder: (context, state) => ProductDetailsView()),
    ]
  );
}
