import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browsing/cubit/favorit_cubit/favorite_cubit.dart';
import 'package:movie_browsing/cubit/favorit_cubit/favorite_state.dart';
import 'package:movie_browsing/widgets/app_bar.dart';
import 'package:movie_browsing/widgets/movie_card.dart';
import 'package:movie_browsing/widgets/search_bar.dart';

class FavoriteScreen extends StatelessWidget {
  TextEditingController _searchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    // Load favorites when the screen is first built
    context.read<FavoriteCubit>().loadFavorites();

    return Scaffold(
      appBar: CustomAppBar(
        title: "Favorite",
         actions: [
          // Use the reusable SearchBar widget
          SizedBox(
            width: 250,
            child: SearchBarWidget(
              controller: _searchController,
              hintText: "Search favorites...",
              onSearch: (query) {
                context.read<FavoriteCubit>().searchFavorites(query);
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavoriteLoaded) {
            final favorites = state.favorites;

            if (favorites.isEmpty) {
              return const Center(child: Text('No favorites yet.'));
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.5,
              ),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final movie = favorites[index];
                return MovieItem(movie: movie);  // Display favorite movie
              },
            );
          } 
           else if (state is FavoriteEmpty) {
      debugPrint("State is FavoriteEmpty"); // Debugging
      return const Center(
        child: Text(
          "No results found for your search",
          style: TextStyle( fontSize: 16),
        ),
      );
    }
          else if (state is FavoriteError) {
            return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
