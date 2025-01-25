import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browsing/cubit/favorit_cubit/favorite_cubit.dart';
import 'package:movie_browsing/cubit/favorit_cubit/favorite_state.dart';
import 'package:movie_browsing/models/movie_model.dart';
import 'package:movie_browsing/screens/movie_detail_screen.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailscreen(id: movie.id),
                ),
              );
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                ),
                BlocBuilder<FavoriteCubit, FavoriteState>(
                  builder: (context, state) {
                     if (state is FavoriteLoaded) {
                final isFavorite =
                    state.favorites.any((fav) => fav.id == movie.id);
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
              return const SizedBox();
                  },
                )
              ],
            ),
          ),
          
          Text(
            movie.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          
        ],
      ),
    );
  }
}
