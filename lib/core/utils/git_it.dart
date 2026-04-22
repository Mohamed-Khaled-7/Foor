import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:musa/features/cart/data/data_source/local/cart_local_datasource.dart';
import 'package:musa/features/cart/data/repo/repo_impl.dart';
import 'package:musa/features/cart/domain/repo/cart_repo.dart';
import 'package:musa/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:musa/features/favoriate/data/data_source/local/favoriate_local.dart';
import 'package:musa/features/favoriate/data/repo/favoriate_impl.dart';
import 'package:musa/features/favoriate/domain/repo/favoriate_repo.dart';
import 'package:musa/features/favoriate/presentation/cubit/cubit/favoriate_cubit.dart';
import 'package:musa/features/home/data/data_source/remote/home_remote_ds.dart';
import 'package:musa/features/home/data/repo/home_repo_impl.dart';
import 'package:musa/features/home/domain/repo/home_repo.dart';
import 'package:musa/features/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:musa/features/profile/data/data_source/local/local_profile_ds.dart';
import 'package:musa/features/profile/data/data_source/remote/remote_profile.dart';
import 'package:musa/features/profile/data/repo/profile_repo_impl.dart';
import 'package:musa/features/profile/domain/repo/profile_repo.dart';
import 'package:musa/features/profile/presentation/cubit/profile_cubit.dart';

final gitIt = GetIt.instance;
void setup() {
  gitIt.registerFactory<FirebaseFirestore>(()=> FirebaseFirestore.instance);
  gitIt.registerFactory<GetProfileDataSource>(
    () => GetProfileDataSource(firestore: gitIt()),
  );
  gitIt.registerFactory<LocalProfileDataSource>(() => LocalProfileDataSource());
  gitIt.registerSingleton<ProfileRepo>(
    ProfileRepoImpl(remoteDataSource: gitIt(), localDataSource: gitIt()),
  );
  gitIt.registerSingleton<ProfileCubit>(
    ProfileCubit(profileRepo: gitIt<ProfileRepo>())..getProfile(),
  );
  gitIt.registerFactory<HomeRemoteDS>(() => HomeRemoteDS());
  gitIt.registerFactory<HomeRepo>(() => HomeRepoImpl(remoteDS: gitIt()));
  gitIt.registerFactory<HomeCubit>(
    () => HomeCubit(repo: gitIt<HomeRepo>())
      ..getAllCategories()
      ..getAllProducts(),
  );
  gitIt.registerFactory<FavoriateLocalDataSoure>(
    () => FavoriateLocalDataSoure(),
  );
  gitIt.registerFactory<FavoriteRepository>(
    () =>
        FavoriateRepositoryImpl(favoriateDS: gitIt<FavoriateLocalDataSoure>()),
  );
  gitIt.registerFactory<FavoriateCubit>(
    () =>
        FavoriateCubit(favoriteRepository: gitIt<FavoriteRepository>())
          ..getAllFavoriates(),
  );
  gitIt.registerFactory<CartLocalDataSource>(() => CartLocalDataSource());
  gitIt.registerFactory<CartRepository>(
    () => CartRepoImpl(cartDataSource: gitIt<CartLocalDataSource>()),
  );
  gitIt.registerCachedFactory<CartCubit>(
    () => CartCubit(cartRepository: gitIt<CartRepository>())..fetchAllCarts(),
  );
}
