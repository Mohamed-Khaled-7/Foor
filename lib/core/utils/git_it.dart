import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:musa/core/shared/product.dart';
import 'package:musa/features/cart/data/data_source/local/cart_local_datasource.dart';
import 'package:musa/features/cart/data/repo/cart_repo_impl.dart';
import 'package:musa/features/cart/domain/repo/cart_repo.dart';
import 'package:musa/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:musa/features/favoriate/data/data_source/local/favoriate_local.dart';
import 'package:musa/features/favoriate/data/repo/favoriate_impl.dart';
import 'package:musa/features/favoriate/domain/repo/favoriate_repo.dart';
import 'package:musa/features/favoriate/presentation/cubit/cubit/favoriate_cubit.dart';
import 'package:musa/features/home/data/data_source/remote/category_remote_ds.dart';
import 'package:musa/features/home/data/data_source/remote/product_remote_ds.dart';
import 'package:musa/features/home/data/repo/category_repo_impl.dart';
import 'package:musa/features/home/data/repo/product_repo_impl.dart';
import 'package:musa/features/home/domain/repo/categorey_repo.dart';
import 'package:musa/features/home/domain/repo/products_repo.dart';
import 'package:musa/features/home/presentation/cubit/cubit/category_cubit.dart';
import 'package:musa/features/home/presentation/cubit/cubit/products_cubit.dart';
import 'package:musa/features/profile/data/data_source/local/local_profile_ds.dart';
import 'package:musa/features/profile/data/data_source/remote/remote_profile.dart';
import 'package:musa/features/profile/data/repo/profile_repo_impl.dart';
import 'package:musa/features/profile/domain/repo/profile_repo.dart';
import 'package:musa/features/profile/presentation/cubit/profile_cubit.dart';

final gitIt = GetIt.instance;
void setup() {
  gitIt.registerFactory<FirebaseFirestore>(() => FirebaseFirestore.instance);
  gitIt.registerFactory<RemoteProfileDataSource>(
    () => RemoteProfileDataSource(firestore: gitIt()),
  );
  gitIt.registerFactory<LocalProfileDataSource>(() => LocalProfileDataSource());

  gitIt.registerSingleton<ProfileRepo>(
    ProfileRepoImpl(remoteDataSource: gitIt(), localDataSource: gitIt()),
  );
  gitIt.registerSingleton<ProfileCubit>(
    ProfileCubit(profileRepo: gitIt<ProfileRepo>())..getProfile(),
  );
  gitIt.registerFactory<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSource(),
  );
  gitIt.registerFactory<ProductsRepo>(
    () => ProductRepoImpl(remoteDS: gitIt<ProductsRemoteDataSource>()),
  );
  gitIt.registerFactory<ProductsCubit>(
    () => ProductsCubit(repo: gitIt<ProductsRepo>())..getAllProducts(),
  );
  gitIt.registerFactory<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSource(),
  );
  gitIt.registerFactory<CategoreyRepo>(
    () => CategoryRepoImpl(remoteDS: gitIt<CategoryRemoteDataSource>()),
  );
  gitIt.registerFactory<CategoryCubit>(
    () => CategoryCubit(repo: gitIt<CategoreyRepo>())..getAllCategories(),
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
