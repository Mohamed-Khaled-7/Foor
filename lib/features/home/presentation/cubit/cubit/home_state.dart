part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Product> products;
  final List<CategoryEntitey> categories;

  HomeLoaded({
    required this.products,
    required this.categories,
  });
}

class HomeError extends HomeState {
  final String errMessage;

  HomeError({required this.errMessage});
}



// search states
class SearchLoading extends HomeState {}

class SearchLoaded extends HomeState {
  final List<Product> results;

  SearchLoaded({required this.results});
}

class SearchError extends HomeState {
  final String errMessage;

  SearchError({required this.errMessage});
}