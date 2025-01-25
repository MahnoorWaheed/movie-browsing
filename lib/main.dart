import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browsing/cubit/bottom_nav_cubit.dart';
import 'package:movie_browsing/cubit/favorit_cubit/favorite_cubit.dart';
import 'package:movie_browsing/cubit/movie_cubit/movie_cubit.dart';
import 'package:movie_browsing/cubit/movie_detail_cubit/detail_cubit.dart';
import 'package:movie_browsing/cubit/theme_cubit.dart';
import 'package:movie_browsing/firebase_options.dart';
import 'package:movie_browsing/repository/favorite_repository.dart';
import 'package:movie_browsing/repository/movie_repository.dart';
import 'package:movie_browsing/screens/movie_list_screen.dart';
import 'package:movie_browsing/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    // MyApp(),
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => MovieCubit(movieRepository: MovieRepository())),
        BlocProvider(
            create: (_) =>
                MovieDetailCubit(movieRepository: MovieRepository())),
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(create: (_) => FavoriteCubit(favoriteRepository: FavoriteRepository())),
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, AppTheme>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.light(), // Light theme
          darkTheme: ThemeData.dark(), // Dark theme
          themeMode: state == AppTheme.light ? ThemeMode.light : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          home: MainScreen(),
        );
      },
    );
  }
}
