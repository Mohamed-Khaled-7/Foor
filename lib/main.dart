import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:musa/business_logic/cubit/auth_cubit.dart';
import 'package:musa/business_logic/cubit/cart_cubit.dart';
import 'package:musa/business_logic/cubit/categories_cubit.dart';
import 'package:musa/business_logic/cubit/favoriate_cubit.dart';
import 'package:musa/business_logic/cubit/products_cubit.dart';
import 'package:musa/business_logic/cubit/profile_cubit.dart';
import 'package:musa/const/const.dart';
import 'package:musa/data/datasource/local/cart_local_datasource.dart';
import 'package:musa/data/datasource/local/favoriate_local_datasoure.dart';
import 'package:musa/data/datasource/local/local_profile_datascource.dart';
import 'package:musa/data/models/product_model.dart';
import 'package:musa/data/models/profile_model.dart';
import 'package:musa/data/repository/cart_repository.dart';
import 'package:musa/data/repository/favoriate_repository.dart';
import 'package:musa/data/repository/get_all_categories_repo.dart';
import 'package:musa/data/repository/get_all_products_repo.dart';
import 'package:musa/data/datasource/remote/services/get_all_categories.dart';
import 'package:musa/data/datasource/remote/services/get_all_products.dart';
import 'package:musa/data/repository/proifle_repository.dart';
import 'package:musa/firebase_options.dart';
import 'package:musa/presentation/views/home_screen.dart';
import 'package:musa/presentation/views/navigation_view.dart';
import 'package:musa/presentation/views/profile_view.dart';
import 'package:musa/presentation/views/register_view.dart';
import 'package:musa/presentation/views/login_view.dart';
import 'package:musa/presentation/views/onBoarding_view.dart';
import 'package:musa/presentation/views/splash_screen.dart';
import 'package:musa/presentation/views/cart_view.dart';
import 'package:musa/presentation/views/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<ProductModel>(FavoritesBox);
  await Hive.openBox<ProductModel>(CartBox);
  Hive.registerAdapter(ProfileModelAdapter());
  await Hive.openBox<ProfileModel>(ProfileBox);
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
final favoriateCubit = FavoriateCubit(
  favoriateRepository: FavoriateRepository(
    favoriateLocalDatasoure: FavoriateLocalDatasoure(),
  ),
);
final cartcubit = CartCubit(
  cartRepository: CartRepository(cartDataSource: CartLocalDataSource()),
);
final profileCubit = ProfileCubit(
  Repo: ProfileRepository(profileDataSource: ProfileDataSource()),
);

class Foor extends StatelessWidget {
  Foor({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CategoriesCubit(categoriesRepository: categoryRepository),
        ),
        BlocProvider(
          create: (context) => ProductsCubit(repo: productRepository),
        ),
        BlocProvider(create: (context) => cartcubit),
        BlocProvider(create: (context) => favoriateCubit),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => profileCubit),
      ],
      child: MaterialApp(
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          CartView.id: (context) => CartView(),
          SplashScreen.id: (context) => SplashScreen(),
          NavigationView.id: (context) => NavigationView(),
          OnBoardingScreen.id: (context) => OnBoardingScreen(),
          RegisterView.id: (context) => RegisterView(),
          LoginPage.id: (context) => LoginPage(),
          CustomProductDetails.id: (context) => CustomProductDetails(),
          ProfilePage.id: (context) => ProfilePage(),
        },
        initialRoute: SplashScreen.id,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
