

import '../../data/local/favorite_model.dart';

abstract class FavoriteState {}

class FavoriteInitialState extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class FavoriteLoadedState extends FavoriteState {
  final List<FavoriteModel> favorites;

  FavoriteLoadedState({required this.favorites});
}

class FavoriteErrorState extends FavoriteState {
  final String message;

  FavoriteErrorState({required this.message});
}