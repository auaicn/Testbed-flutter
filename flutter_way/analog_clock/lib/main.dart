import 'package:analog_clock/home_screen.dart';
import 'package:analog_clock/providers/theme_provider.dart';
import 'package:analog_clock/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, theme, child) => MaterialApp(
          title: 'Analog Clock',
          debugShowCheckedModeBanner: false,
          theme: themeData(context),
          darkTheme: darkThemeData(context),
          themeMode: theme.isLightTheme ? ThemeMode.light : ThemeMode.dark,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
