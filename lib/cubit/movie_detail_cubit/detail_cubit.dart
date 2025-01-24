import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browsing/cubit/movie_detail_cubit/detail_state.dart';
import 'package:movie_browsing/repository/movie_repository.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieRepository movieRepository = MovieRepository();
  MovieDetailCubit({required this.movieRepository}) : super(MovieDetailInitial());

void fetchMovieDetail(int id ) async{

  try {
    emit(MovieDetailLoading());
    final movies = await movieRepository.fetchMovieDetails(id);
    emit(MovieDetailLoaded(movieDetails: movies));
  } catch (e) {
    emit(MovieDetailError(message: e.toString()));
  }
}
}