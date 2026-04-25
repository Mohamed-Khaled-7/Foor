part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}
final class CategoryLoading extends CategoryState {}
final class CategoryLoaded extends CategoryState {
  final List<CategoryEntitey> categories;
  CategoryLoaded({required this.categories});
}
final class CategoryError extends CategoryState {
  final String errMessage;
  CategoryError({required this.errMessage});
}