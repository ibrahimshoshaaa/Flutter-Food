import 'package:flutter/material.dart';
import 'constants.dart';
import 'home.dart';

void main() { WidgetsFlutterBinding.ensureInitialized(); runApp(const FlutterFoodApp()); }

class FlutterFoodApp extends StatefulWidget {
  const FlutterFoodApp({super.key});
  @override State<FlutterFoodApp> createState() => _FlutterFoodAppState();
}

class _FlutterFoodAppState extends State<FlutterFoodApp> {
  ThemeMode themeMode = ThemeMode.light;
  ColorSelection colorSelected = ColorSelection.blue;
  void changeThemeMode(bool useLightMode) => setState(() { themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark; });
  void changeColor(int value) => setState(() { colorSelected = ColorSelection.values[value]; });
  @override Widget build(BuildContext context) {
    const appTitle = 'Flutter Food';
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData(colorSchemeSeed: colorSelected.color, useMaterial3: true),
      darkTheme: ThemeData(colorSchemeSeed: colorSelected.color, useMaterial3: true, brightness: Brightness.dark),
      home: Home(appTitle: appTitle, changeTheme: changeThemeMode, changeColor: changeColor, colorSelected: colorSelected),
    );
  }
}
