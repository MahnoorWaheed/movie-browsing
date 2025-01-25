

import 'package:movie_browsing/models/movie_model.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<Movie> favorites;

  FavoriteLoaded(this.favorites);
} //success state

class FavoriteError extends FavoriteState {
  final String message;

  FavoriteError(this.message);
}
