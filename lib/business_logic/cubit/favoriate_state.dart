part of 'favoriate_cubit.dart';

@immutable
sealed class FavoriateState {}

final class FavoriateInitial extends FavoriateState {}
class FavoriateLoaded extends FavoriateState {
  final List<ProductModel> items;
  FavoriateLoaded({required this.items});
}
