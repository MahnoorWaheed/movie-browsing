import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browsing/cubit/theme_cubit.dart'; // Import the ThemeCubit

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('Dark Mode'),
              trailing: Switch(  //toggle
                value: context.read<ThemeCubit>().state == AppTheme.dark, 
                onChanged: (value) {
                  // Toggle theme when switch is changed
                  context.read<ThemeCubit>().toggleTheme();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
