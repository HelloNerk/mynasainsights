import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/local/favorite_dao.dart';
import '../blocs/favorite_bloc.dart';
import '../blocs/favorite_event.dart';
import '../blocs/favorite_state.dart';
import '../widgets/favorite_list_item.dart';

class FavoriteListPage extends StatelessWidget {
  const FavoriteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavoriteBloc>().add(LoadFavorites());
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FavoriteLoadedState) {
          return ListView.builder(
            itemCount: state.favorites.length,
            itemBuilder: (context, index) => FavoriteListItem(
              favorite: state.favorites[index],
              onDelete: () {
                FavoriteDao().deleteFavorite(state.favorites[index].date);
                context.read<FavoriteBloc>().add(LoadFavorites());
              },
            ),
          );
        } else if (state is FavoriteErrorState) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No favorites found.'));
        }
      },
    );
  }
}