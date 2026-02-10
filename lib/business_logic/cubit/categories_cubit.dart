import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musa/data/models/category_model.dart';
import 'package:musa/data/repository/get_all_categories_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required this.categoriesRepository})
    : super(CategoriesInitial());
   List<CategoryModel> categories=[];
  final CategoriesRepository categoriesRepository;
  List<CategoryModel> getAllCategories() {
    categoriesRepository.getAllCharacters().then((categories) {
      emit(CategoriesLoaded(categories: categories));
      this.categories = categories;
    });
    return categories;
  }
}
