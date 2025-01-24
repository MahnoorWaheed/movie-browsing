import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browsing/cubit/bottom_nav_cubit.dart';
import 'package:movie_browsing/screens/favorite_screen.dart';
import 'package:movie_browsing/screens/movie_list_screen.dart';
import 'package:movie_browsing/screens/setting_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  int currentPage = 1;

  final List<Widget> _screens = [
    MovieListScreen(), // Your Movie List Screen
    FavoriteScreen(), // Favorite Screen
    SettingScreen(), // Settings Screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavCubit, int>( // Use BottomNavCubit to listen for index changes
        builder: (context, selectedIndex) {
          return _screens[selectedIndex]; // Display the selected screen
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavCubit, int>(
        builder: (context, selectedIndex) {
          return BottomNavigationBar(
            currentIndex: selectedIndex, // Use selectedIndex from Cubit
            onTap: (index) {
              context.read<BottomNavCubit>().updateIndex(index); // Update the index in the Cubit
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          );
        },
      ),
    );
  }
}
