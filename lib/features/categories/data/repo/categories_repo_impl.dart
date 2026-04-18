import 'package:musa/features/categories/data/data_source/remote/getAllCategories.dart';
import 'package:musa/features/categories/data/models/category_model.dart';
import 'package:musa/features/categories/domain/entites/category.dart';
import 'package:musa/features/categories/domain/repo/categories_repo.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  GetAllCategoriesDataSource getAllCategoriesDS;

  CategoriesRepoImpl(this.getAllCategoriesDS);

  @override
  Future<List<Category>> getAllCategories() async {
    final categories = await getAllCategoriesDS.getAllCategories();
    return categories
        .map<Category>((categoery) => CategoryModel.fromJson(categoery).toEntity())
        .toList();
  }
}
