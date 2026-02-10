import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musa/business_logic/cubit/categories_cubit.dart';
import 'package:musa/business_logic/cubit/products_cubit.dart';
import 'package:musa/data/repository/get_all_categories_repo.dart';
import 'package:musa/data/repository/get_all_products_repo.dart';
import 'package:musa/data/services/get_all_categories.dart';
import 'package:musa/data/services/get_all_products.dart';
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
import 'package:musa/presentation/screens/cart_view.dart';
import 'package:musa/presentation/screens/product_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(Foor());
}

final categoryService = GetAllCategoriesServices();
final categoryRepository = CategoriesRepository(
  getAllCategoriesServices: categoryService,
);
final productServics = GetAllProductsServics();
final productRepository = GetAllProductsRepo(
  getAllProductsServics: productServics,
);

class Foor extends StatelessWidget {
  Foor({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoriesCubit(
            categoriesRepository:categoryRepository
          ),
        ),

        BlocProvider(
          create: (context) => ProductsCubit(
            repo: productRepository
          ),
        ),
      ],
      child: MaterialApp(
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          CartView.id: (context) => CartView(),
          SearchView.id: (context) => SearchView(),
          SplashScreen.id: (context) => SplashScreen(),
          NavigationView.id: (context) => NavigationView(),
          OnBoardingScreen.id: (context) => OnBoardingScreen(),
          RegisterPage.id: (context) => RegisterPage(),
          LoginPage.id: (context) => LoginPage(),
          CustomProductDetails.id: (context) => CustomProductDetails(),
        },
        initialRoute: NavigationView.id,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
