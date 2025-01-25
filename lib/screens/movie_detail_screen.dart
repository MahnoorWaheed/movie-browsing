import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browsing/cubit/movie_detail_cubit/detail_cubit.dart';
import 'package:movie_browsing/cubit/movie_detail_cubit/detail_state.dart';

class MovieDetailscreen extends StatelessWidget {
  int id;
  MovieDetailscreen({required this.id});

  @override
  Widget build(BuildContext context) {
    context.read<MovieDetailCubit>().fetchMovieDetail(id);
    return Scaffold(
      body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
        builder: (context, state) {
          if (state is MovieDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieDetailLoaded) {
            final movieDetails = state.movieDetails;

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                       'https://image.tmdb.org/t/p/w500${movieDetails.posterPath}',
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    movieDetails.title,
                    style: const TextStyle(
                      
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Release Date: ${movieDetails.releaseDate}',
                    
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rating: ${movieDetails.voteAverage}',
                    
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Overview:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movieDetails.overview,
                  ),
                ],
              ),
            ),
          );
          } else if (state is MovieDetailError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
