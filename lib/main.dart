import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browsing/cubit/movie_cubit/movie_cubit.dart';
import 'package:movie_browsing/firebase_options.dart';
import 'package:movie_browsing/repository/movie_repository.dart';
import 'package:movie_browsing/screens/movie_list_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(
      // MyApp(),
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MovieCubit(movieRepository: MovieRepository())),
        // BlocProvider(create: (_) => FavoriteCubit()),
        // BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MovieListScreen(),
    );
  }
}

