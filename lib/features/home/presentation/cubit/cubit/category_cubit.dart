import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:musa/features/home/domain/entites/category.dart';
import 'package:musa/features/home/domain/repo/categorey_repo.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.repo}) : super(CategoryInitial());
  CategoreyRepo repo;

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
