import 'package:flutter/material.dart';
import 'package:flutter_food/screens/explore_page.dart';
import 'components/color_button.dart';
import 'components/theme_button.dart';
import 'constants.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.changeTheme, required this.changeColor, required this.colorSelected, required this.appTitle});
  final void Function(bool useLightMode) changeTheme;
  final void Function(int value) changeColor;
  final ColorSelection colorSelected;
  final String appTitle;
  @override State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tab = 0;
  static const destinations = [
    NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Explore', selectedIcon: Icon(Icons.home)),
    NavigationDestination(icon: Icon(Icons.receipt_long_outlined), label: 'Orders', selectedIcon: Icon(Icons.receipt_long)),
    NavigationDestination(icon: Icon(Icons.person_outline), label: 'Account', selectedIcon: Icon(Icons.person)),
  ];
  @override Widget build(BuildContext context) {
    final pages = [const ExplorePage(), const Center(child: Text('Orders')), const Center(child: Text('Account'))];
    return Scaffold(
      appBar: AppBar(title: Text(widget.appTitle), actions: [ThemeButton(changeThemeMode: widget.changeTheme), ColorButton(changeColor: widget.changeColor, colorSelected: widget.colorSelected)]),
      body: IndexedStack(index: tab, children: pages),
      bottomNavigationBar: NavigationBar(selectedIndex: tab, onDestinationSelected: (index) => setState(() => tab = index), destinations: destinations),
    );
  }
}
