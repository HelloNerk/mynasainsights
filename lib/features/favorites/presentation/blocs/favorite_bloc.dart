import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/local/favorite_dao.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState>{
  FavoriteBloc() : super(FavoriteInitialState()){
    on<LoadFavorites>(_onLoadFavorites);
  }
  Future<void>_onLoadFavorites(LoadFavorites event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoadingState());
    try {
      final favorites = await FavoriteDao().fetchAllFavorites();
      emit(FavoriteLoadedState(favorites: favorites));
    } catch (e) {
      emit(FavoriteErrorState(message: e.toString()));
    }
  }
}