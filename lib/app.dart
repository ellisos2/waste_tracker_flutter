import 'package:flutter/material.dart';
import 'package:waste_tracker/screens/food_waste_list.dart';
import 'package:waste_tracker/styles.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: WasteagramTheme(context),
      home: const FoodWasteList(),
    );
  }

  ThemeData WasteagramTheme(BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.grey,
        primaryColorDark: Colors.grey[800],
        accentColor: Colors.grey[900],
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: Colors.grey[800],
      textTheme: Styles.darkModeText,
    );
  }

}
