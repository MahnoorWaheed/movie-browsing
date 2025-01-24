//main cubit class part of state class i.e, movie_state

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browsing/models/movie_model.dart';
import 'package:movie_browsing/repository/movie_repository.dart';
part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieRepository movieRepository = MovieRepository();
  MovieCubit({required this.movieRepository}) : super(MovieInitial());

void fetchMovies(int page) async{

try {
  emit(MovieLoading());
  final movies = await movieRepository.fetchMovies(page);
  emit(MovieLoaded(movies: movies));
} catch (e) {
  emit(MovieError(message: e.toString()));
}
}

}
