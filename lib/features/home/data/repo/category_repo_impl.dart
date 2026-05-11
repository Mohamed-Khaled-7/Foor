import 'package:musa/features/home/data/data_source/remote/category_remote_ds.dart';
import 'package:musa/features/home/data/models/category_model.dart';
import 'package:musa/features/home/domain/entites/category.dart';
import 'package:musa/features/home/domain/repo/categorey_repo.dart';

class CategoryRepoImpl implements CategoreyRepo {
  final CategoryRemoteDataSource remoteDS;

  CategoryRepoImpl({required this.remoteDS});
  @override
  Future<List<CategoryEntitey>> getAllCategories() async {
    final categories = await remoteDS.getAllCategories();
    return categories
        .map<CategoryEntitey>(
          (categoery) => CategoryModel.fromJson(categoery).toEntity(),
        )
        .toList();
  }
}
