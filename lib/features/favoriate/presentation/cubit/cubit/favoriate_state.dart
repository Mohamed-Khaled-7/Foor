part of 'favoriate_cubit.dart';

sealed class FavoriateState {}

final class FavoriateInitial extends FavoriateState {}

final class FavoriateLoaded extends FavoriateState {
  final List products;
  FavoriateLoaded({required this.products});
}

final class FavoriateError extends FavoriateState {
  final String errMessage;
  FavoriateError({required this.errMessage});
}

final class FavoriateLoading extends FavoriateState {}
