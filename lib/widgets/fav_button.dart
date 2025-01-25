import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browsing/cubit/favorit_cubit/favorite_cubit.dart';
import 'package:movie_browsing/cubit/favorit_cubit/favorite_state.dart';
import 'package:movie_browsing/models/movie_model.dart';

class FavoriteButton extends StatelessWidget {
  final Movie movie;

  const FavoriteButton({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoaded) {
          final isFavorite = state.favorites.any((fav) => fav.id == movie.id);
          return IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: () {
              context.read<FavoriteCubit>().toggleFavorite(movie);
            },
          );
        }
        return const SizedBox(); // Return an empty widget if the state is not loaded
      },
    );
  }
}
