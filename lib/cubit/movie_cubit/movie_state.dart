part of 'movie_cubit.dart';
abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {
   List<Movie> movies = [];
   MovieLoading({this.movies = const []});
}

class MovieLoaded extends MovieState {
  final List<Movie> movies;
   MovieLoaded({required this.movies});
}

class MovieError extends MovieState {
  final String message;
   MovieError({required this.message});
}