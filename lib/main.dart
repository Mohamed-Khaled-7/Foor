import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:musa/core/const/const.dart';
import 'package:musa/core/shared/product_model.dart';
import 'package:musa/core/utils/app_routers.dart';
import 'package:musa/core/utils/git_it.dart';
import 'package:musa/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:musa/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:musa/features/favoriate/presentation/cubit/cubit/favoriate_cubit.dart';
import 'package:musa/features/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:musa/features/profile/data/models/profile_model.dart';
import 'package:musa/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:musa/firebase_options.dart';
import 'package:musa/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(ProfileModelAdapter());

  await Hive.openBox<ProductModel>(FavoritesBox);
  await Hive.openBox<ProductModel>(CartBox);
  await Hive.openBox<ProfileModel>(ProfileBox);
  await Hive.openBox(onBoarding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setup();
  runApp(Foor());
}

class Foor extends StatelessWidget {
  const Foor({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => gitIt<HomeCubit>()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouters.routers,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
