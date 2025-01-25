import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browsing/cubit/theme_cubit.dart';
import 'package:movie_browsing/screens/main_screens.dart';

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
          themeMode: state == AppTheme.light ? ThemeMode.light : ThemeMode.dark, //set theme
          debugShowCheckedModeBanner: false,
          home: MainScreen(), //bottom nav bar screen
        );
      },
    );
  }
}
