import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browsing/cubit/movie_cubit/movie_cubit.dart';
import 'package:movie_browsing/widgets/categories.dart';

class MovieListScreen extends StatelessWidget {
  final ScrollController _scrollController = ScrollController(); // Controller for pagination
  int currentPage = 1;

  MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MovieCubit>().fetchMovies(currentPage); // Initial fetch
    
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Netflix Clone'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading && state.movies.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieLoaded || state is MovieLoading) {
            final movies = state is MovieLoaded ? state.movies : (state as MovieLoading).movies;

            return Column(
              children: [
              
                const SizedBox(height: 20),
               
                Expanded(
                  child: GridView.builder(
                    controller: _scrollController,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return buildMovieItem(movie);
                    },
                  ),
                ),
                if (state is MovieLoading && movies.isNotEmpty) // Show a loader at the bottom during pagination
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(child: CircularProgressIndicator()),
                  ),
              ],
            );
          } else if (state is MovieError) {
            return Center(child: Text('Error: ${state.message}', style: const TextStyle(color: Colors.white)));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
