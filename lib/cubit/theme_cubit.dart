import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppTheme { light, dark }

class ThemeCubit extends Cubit<AppTheme> {
  ThemeCubit() : super(AppTheme.light){
    loadTheme();
  } // Default theme is light

//to save the theme

Future<void> loadTheme()async {
  SharedPreferences pref = await SharedPreferences.getInstance(); 
  var theme = pref.getInt('theme')??0;
  emit(AppTheme.values[theme]);
}

Future<void> saveTheme(AppTheme theme) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme', theme.index);
  }

  void toggleTheme() {
    final newTheme = state == AppTheme.light ? AppTheme.dark : AppTheme.light;
    emit(newTheme);
    saveTheme(newTheme); // Save the new theme
  }
}

