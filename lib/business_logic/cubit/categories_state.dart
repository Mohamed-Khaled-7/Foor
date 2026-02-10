part of 'categories_cubit.dart';
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  List<CategoryModel> categories;
  CategoriesLoaded({
    required this.categories,
  });
}
class CategoriesLoading extends CategoriesState {}
