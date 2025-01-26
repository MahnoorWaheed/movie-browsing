import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppTheme { light, dark } //we took enum because there are only two state {dark, light}

class ThemeCubit extends Cubit<AppTheme> { //AppTheme is the state here 
  ThemeCubit() : super(AppTheme.light){ //initial theme is light
    loadTheme();  
  } 

//load the theme that is saved locally
Future<void> loadTheme()async {
  SharedPreferences pref = await SharedPreferences.getInstance(); 
  var theme = pref.getInt('theme')??0;
  emit(AppTheme.values[theme]);
}


//to save the theme locally
Future<void> saveTheme(AppTheme theme) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme', theme.index);
  }

//toggle theme
  void toggleTheme() {
    final newTheme = state == AppTheme.light ? AppTheme.dark : AppTheme.light;
    emit(newTheme);
    saveTheme(newTheme); // Save the new theme
  }
}

