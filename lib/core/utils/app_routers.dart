import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:musa/core/shared/product.dart';
import 'package:musa/core/utils/git_it.dart';
import 'package:musa/features/auth/domain/repo/auth_repo.dart';
import 'package:musa/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:musa/features/auth/presentation/views/login_view.dart';
import 'package:musa/features/auth/presentation/views/register_view.dart';
import 'package:musa/features/cart/presentation/views/cart_view.dart';
import 'package:musa/features/favoriate/presentation/views/favoriate_view.dart';
import 'package:musa/features/home/presentation/views/home_view.dart';
import 'package:musa/features/home/presentation/views/navigation_view.dart';
import 'package:musa/features/home/presentation/views/product_details_view.dart';
import 'package:musa/features/profile/presentation/views/profile_view.dart';
import 'package:musa/features/splash/presentation/views/splash_view.dart';

class AppRouters {
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
      GoRoute(path: '/', builder: (context, state) => NavigationView()),
      GoRoute(
        path: loginView,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(authRepo: gitIt<AuthRepo>()),
          child: LoginView(),
        ),
      ),
      GoRoute(path: registerView, builder: (context, state) => RegisterView()),
      GoRoute(path: homeView, builder: (context, state) => HomeView()),
      GoRoute(path: cartView, builder: (context, state) => CartView()),
      GoRoute(path: profileView, builder: (context, state) => ProfileView()),
      GoRoute(
        path: favoriateView,
        builder: (context, state) => FavoriateView(),
      ),
      GoRoute(path: splashView, builder: (context, state) => SplashView()),
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
