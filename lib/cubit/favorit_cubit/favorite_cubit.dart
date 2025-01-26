import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browsing/cubit/favorit_cubit/favorite_state.dart';
import 'package:movie_browsing/models/movie_model.dart';
import 'package:movie_browsing/repository/favorite_repository.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteRepository favoriteRepository;
  List<Movie> currentFavorites = [];
  List<Movie> filteredFavorites = [];
  FavoriteCubit({required this.favoriteRepository}) : super(FavoriteInitial());

  Future<void> loadFavorites() async {

    try {
       emit(FavoriteLoading());
    var favorites = await favoriteRepository.fetchFavMovies();

    filteredFavorites = favorites; //filteredFavorites for search
    emit(FavoriteLoaded(favorites));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
   
  }

  Future<void> toggleFavorite(Movie movie) async {
    if (state is FavoriteLoaded) {
      currentFavorites = List<Movie>.from((state as FavoriteLoaded).favorites);

      if (currentFavorites.any((fav) => fav.id == movie.id)) {
        await favoriteRepository.removeFavMovie(movie.id);

        currentFavorites.removeWhere(
            (fav) => fav.id == movie.id); //remove movie from list also
        emit(FavoriteLoaded(currentFavorites)); // update the loaded state
      } else {
        await favoriteRepository
            .addFavMovie(movie); // Add movie to favorites in firestore

        currentFavorites.add(movie); // Add movie to currentFavorites list also
        emit(FavoriteLoaded(currentFavorites)); // Emit updated state
      }
    }
  }

  void searchFavorites(String query) {
  //   if (query.isEmpty) {
  //     filteredFavorites = currentFavorites; // all current fav movies assigned to filtered fav
  //     emit(FavoriteLoaded(filteredFavorites));
  //   } else {
  //     filteredFavorites = currentFavorites
  //         .where((movie) =>
  //             movie.title.toLowerCase().contains(query.toLowerCase()))
  //         .toList(); //search in current fav and assigned to filter fav
  //   }
  //   emit(FavoriteLoaded(filteredFavorites)); // Emit the filtered list

  if(filteredFavorites.isNotEmpty){
   final searchMovies = filteredFavorites.where((smovie)=>smovie.title.toLowerCase().contains(query.toLowerCase())).toList();
   emit(FavoriteLoaded(searchMovies));

   if(searchMovies.isEmpty){
    emit(FavoriteEmpty());
   }
   else{
    emit(FavoriteLoaded(searchMovies));
   }
  }
  }
}
