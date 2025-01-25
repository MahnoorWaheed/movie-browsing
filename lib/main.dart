import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browsing/cubit/bottom_nav_cubit.dart';
import 'package:movie_browsing/cubit/favorit_cubit/favorite_cubit.dart';
import 'package:movie_browsing/cubit/movie_cubit/movie_cubit.dart';
import 'package:movie_browsing/cubit/movie_detail_cubit/detail_cubit.dart';
import 'package:movie_browsing/cubit/theme_cubit.dart';
import 'package:movie_browsing/firebase_options.dart';
import 'package:movie_browsing/my_app.dart';
import 'package:movie_browsing/repository/favorite_repository.dart';
import 'package:movie_browsing/repository/movie_repository.dart';

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
        BlocProvider(
            create: (_) =>
                FavoriteCubit(favoriteRepository: FavoriteRepository())),
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: DevicePreview(
        builder: (context)=> MyApp()),
    ),
  );
}
