import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musa/features/categories/domain/repo/categories_repo.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.repo}) : super(CategoryInitial());
  final CategoriesRepo repo;
  Future<void> getAllCategories() async {
    try {
      emit(CategoryLoading());
      final categories = await repo.getAllCategories();
      emit(CategoryLoaded(categories: categories));
    } on Exception catch (e) {
      emit(CategoryError(errMessage: e.toString()));
    }
  }
}
