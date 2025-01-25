import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browsing/cubit/favorit_cubit/favorite_state.dart';
import 'package:movie_browsing/models/movie_model.dart';
import 'package:movie_browsing/repository/favorite_repository.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteRepository favoriteRepository;
  List<Movie> currentFavorites = [];
  FavoriteCubit({required this.favoriteRepository}) : super(FavoriteInitial());

   Future<void> loadFavorites() async {
    emit(FavoriteLoading());
    var favorites = await favoriteRepository.fetchFavMovies();
    emit(FavoriteLoaded(favorites));
  }

  Future<void> toggleFavorite(Movie movie) async{
    if(state is FavoriteLoaded){
        currentFavorites = List<Movie>.from((state as FavoriteLoaded).favorites);

        if (currentFavorites.any((fav) => fav.id == movie.id)) {
      // Remove movie from favorites
      await favoriteRepository.removeFavMovie(movie.id);
      // Remove movie from currentFavorites list and emit new state
      currentFavorites.removeWhere((fav) => fav.id == movie.id);
      emit(FavoriteLoaded(currentFavorites)); // Emit updated state
    }
    else{
     // Add movie to favorites
      await favoriteRepository.addFavMovie(movie);
      // Add movie to currentFavorites list and emit new state
      currentFavorites.add(movie);
      emit(FavoriteLoaded(currentFavorites)); // Emit updated state
    }
    }
    
  }
}