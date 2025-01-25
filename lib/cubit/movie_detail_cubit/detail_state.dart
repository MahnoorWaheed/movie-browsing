import 'package:movie_browsing/models/movie_detail_model.dart';
abstract class MovieDetailState{}

class MovieDetailInitial extends MovieDetailState{}

class MovieDetailLoading extends MovieDetailState{}

class MovieDetailLoaded extends MovieDetailState{
  final MovieDetails movieDetails;

  MovieDetailLoaded({required this.movieDetails});
}

class MovieDetailError extends MovieDetailState{
  final String message;

  MovieDetailError({required this.message});
}