//main cubit class part of state class i.e, movie_state

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browsing/models/movie_model.dart';
import 'package:movie_browsing/repository/movie_repository.dart';
part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieRepository movieRepository = MovieRepository();
   List<Movie> allMovies = [];
  MovieCubit({required this.movieRepository}) : super(MovieInitial());


//fetch movies from repo

void fetchMovies(int page) async{
try {
  emit(MovieLoading());
  final movies = await movieRepository.fetchMovies(page);
   allMovies = movies;
  emit(MovieLoaded(movies: movies));
} catch (e) {
  emit(MovieError(message: e.toString()));
}
}

//search in all movie list
 void searchMovies(String query) {
    if (allMovies.isNotEmpty) {
      final filteredMovies = allMovies
          .where((movie) => movie.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
         // print("filteredMovies in search ${filteredMovies.map((movie) => movie.title).toList()}");
      emit(MovieLoaded(movies: filteredMovies)); // Emit the filtered list

      if (filteredMovies.isEmpty) {
      emit(MovieEmpty()); //emit the MovieEmpty state
    } else {
      emit(MovieLoaded(movies: filteredMovies)); // Emit the filtered movies
    }
    }
  }

}
