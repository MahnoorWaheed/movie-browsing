import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browsing/cubit/favorit_cubit/favorite_cubit.dart';
import 'package:movie_browsing/cubit/favorit_cubit/favorite_state.dart';
import 'package:movie_browsing/cubit/movie_cubit/movie_cubit.dart';
import 'package:movie_browsing/widgets/app_bar.dart';
import 'package:movie_browsing/widgets/movie_card.dart';
import 'package:movie_browsing/widgets/search_bar.dart';

class MovieListScreen extends StatelessWidget {
  final ScrollController _scrollController =
      ScrollController(); 
  int currentPage = 1;
  final TextEditingController _searchController = TextEditingController();

  MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MovieCubit>().fetchMovies(currentPage); // Initial fetch
    context.read<FavoriteCubit>().loadFavorites();
    return Scaffold(
      appBar: CustomAppBar(
        title: "Movies",
         actions: [
          // Use the reusable SearchBar widget
          SizedBox(
            width: 250,
            child: SearchBarWidget(
              controller: _searchController,
              hintText: "Search Movies...",
              onSearch: (query) {
                context.read<MovieCubit>().searchMovies(query);
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading && state.movies.isEmpty) {  //movie loading state
            return Container();
          } else if (state is MovieLoaded || state is MovieLoading) { 
            final movies = state is MovieLoaded  // loaded movies save into the variable 
                ? state.movies
                : (state as MovieLoading).movies;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                      controller: _scrollController,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.5,
                      ),
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return BlocBuilder<FavoriteCubit, FavoriteState>(
                          builder: (context, state) {
                            return MovieItem(movie: movie);
                          },
                        );
                      },
                    ),
                  ),
                  if (state is MovieLoading &&
                      movies
                          .isNotEmpty) // Show a loader at the bottom during pagination
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                ],
              ),
            );
          } else if (state is MovieError) {
            return Center(
                child: Text('Error: ${state.message}',
                    style: const TextStyle(color: Colors.white)));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
