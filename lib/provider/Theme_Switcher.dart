import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/Theme_Provider.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return IconButton(
      onPressed: () {
        themeProvider.toggleTheme();
        
      },
      icon: Icon(Icons.wb_sunny),
    );
  }
}